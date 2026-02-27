# Move terpedia.com domain to Terpedia AWS

Steps to move **terpedia.com** (and its DNS) from the current AWS account (e.g. dan@syzygyx / syzygyx) to the **Terpedia** AWS account.

---

## Overview

1. **Terpedia AWS:** Create a new Route 53 hosted zone for **terpedia.com** and note the name servers (NS).
2. **Registrar:** At the domain registrar (where terpedia.com is registered), change the domain’s name servers to the NS from the new hosted zone in Terpedia AWS.
3. **Recreate or migrate records:** Either recreate needed records (e.g. next.terpedia.com CNAME) in the new zone, or export records from the old zone and import into the new one.
4. **Decommission old zone:** After DNS has propagated and everything works, delete the old hosted zone in the previous account (optional; stops billing for that zone).

---

## 1. Create hosted zone in Terpedia AWS

Use the **Terpedia** AWS account (e.g. profile **`terpedia`**).

**Console:**

1. Log in to AWS as the Terpedia account.
2. Open **Route 53** → **Hosted zones** → **Create hosted zone**.
3. **Domain name:** `terpedia.com`
4. **Type:** Public hosted zone
5. Create. Note the **name servers** (NS) listed (e.g. `ns-123.awsdns-45.com`, …).

**CLI:**

```bash
aws route53 create-hosted-zone --profile terpedia \
  --name terpedia.com \
  --caller-reference "terpedia-$(date +%s)"
```

Then get the name servers:

```bash
aws route53 get-hosted-zone --profile terpedia --id <ZONE_ID> \
  --query "DelegationSet.NameServers" --output text
```

---

## 2. Update name servers at the registrar

Where **terpedia.com** is registered (e.g. Route 53 Domains, GoDaddy, Namecheap, Cloudflare, etc.):

1. Open the domain **terpedia.com**.
2. Find **Name servers** / **DNS** settings.
3. Replace the current name servers with the **four NS values** from the new hosted zone in Terpedia AWS.
4. Save. Propagation can take from a few minutes up to 48 hours.

---

## 3. Recreate or migrate DNS records

**Option A – Recreate (simplest)**  
In the new Terpedia hosted zone, add the records you need, e.g.:

- **next.terpedia.com** → CNAME → **terpedia.github.io** (for GitHub Pages)
- Any other records (www, apex, email, etc.)

Use the repo script after the move (with profile **terpedia**):

```bash
export AWS_PROFILE=terpedia
./scripts/setup-route53-next.sh
```

**Option B – Migrate existing records**  
In the **old** account, export the resource record sets:

```bash
aws route53 list-resource-record-sets --profile dan-syzygyx \
  --hosted-zone-id Z_OLD_ZONE_ID \
  --output json > terpedia-com-records-old.json
```

Edit the JSON to remove the NS and SOA (they’re created with the zone) and adjust any references. Then in the **Terpedia** account, create a change batch and apply it (e.g. using `aws route53 change-resource-record-sets` with the edited JSON). Alternatively, use a script or the console to recreate records from the export.

---

## 4. After the move

- **Script and docs:** Use AWS profile **`terpedia`** for any Route 53 commands for terpedia.com (see [deploy-route53.md](deploy-route53.md)).
- **next.terpedia.com:** Ensure the CNAME **next** → **terpedia.github.io** exists in the new zone, and that GitHub repo **Settings → Pages → Custom domain** is set to **next.terpedia.com**.
- **Old zone:** Once DNS is fully switched and verified, you can delete the old hosted zone in the previous account to avoid ongoing charges (Route 53 charges per hosted zone per month).

---

## Why next.terpedia.com might still 404

- **DNS not in Terpedia AWS yet** — The domain move must be done and name servers updated; then the CNAME for **next** must exist in the Terpedia hosted zone.
- **GitHub Pages custom domain not set** — In repo **Settings → Pages**, set **Custom domain** to **next.terpedia.com** and save.
- **GitHub Pages not enabled** — Deploy source must be set (e.g. **GitHub Actions**). See main [README](../README.md).

After the domain is in Terpedia AWS and the CNAME + GitHub custom domain are correct, allow a few minutes for DNS and GitHub’s certificate; then **https://next.terpedia.com** should stop 404ing.
