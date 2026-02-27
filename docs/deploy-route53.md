# Deploy to next.terpedia.com with AWS Route 53

Use AWS Route 53 to point the subdomain **next.terpedia.com** at the GitHub Pages site for this repo.

**If https://next.terpedia.com returns 404:** (1) Ensure **terpedia.com** DNS is in the right AWS account and the **next** CNAME exists (see below). (2) In GitHub repo **Settings → Pages**, set **Custom domain** to **next.terpedia.com**. (3) Ensure GitHub Pages is enabled (e.g. Source: GitHub Actions). See [move-terpedia-domain-to-terpedia-aws.md](move-terpedia-domain-to-terpedia-aws.md) if you’re moving the domain to Terpedia AWS.

## Prerequisites

- **terpedia.com** is in **Terpedia AWS** (Route 53 hosted zone). If it’s still in another account (e.g. syzygyx), see [move-terpedia-domain-to-terpedia-aws.md](move-terpedia-domain-to-terpedia-aws.md).
- **GitHub Pages** is enabled for this repo and the site works at **https://terpedia.github.io/terpedia-next/**.

---

## 1. Create the DNS record in Route 53

1. Open **AWS Console** → **Route 53** → **Hosted zones**.
2. Click the hosted zone for **terpedia.com**.
3. Click **Create record**.
4. Set:
   - **Record name:** `next`  
     (Route 53 will use this as **next.terpedia.com**.)
   - **Record type:** `CNAME`
   - **Value:** `terpedia.github.io`
   - **TTL:** 300 (or default).
5. Click **Create records**.

Result: **next.terpedia.com** will resolve to **terpedia.github.io**, which GitHub Pages uses to serve this repo’s site when the custom domain is configured.

---

## 2. Configure the custom domain in GitHub

1. Open the repo **Settings → Pages**:  
   **https://github.com/Terpedia/terpedia-next/settings/pages**
2. Under **Custom domain**, enter: **next.terpedia.com**
3. Click **Save**.
4. Wait for DNS to be reported as verified (often 1–2 minutes; DNS can take longer to propagate).
5. Optionally enable **Enforce HTTPS** (recommended).

This repo already contains a **CNAME** file with `next.terpedia.com` so GitHub knows which domain to use.

---

## 3. Verify

- After DNS propagates and GitHub shows the domain as verified, open **https://next.terpedia.com**.
- If you enabled **Enforce HTTPS**, the site should load over HTTPS (GitHub provisions the certificate).

---

## Troubleshooting

| Issue | Check |
|-------|--------|
| **next.terpedia.com** doesn’t load | Confirm the CNAME record in Route 53: **next** → **terpedia.github.io**. Run `dig next.terpedia.com CNAME` or use Route 53’s “Test record” to verify. |
| GitHub says “Domain’s DNS record is incorrect” | Ensure the CNAME value is exactly **terpedia.github.io** (no trailing dot unless your UI requires it). Wait a few minutes and click “Save” again. |
| Certificate / HTTPS errors | In GitHub Pages settings, leave **Enforce HTTPS** off until the domain is verified, then turn it on. Give the certificate a few minutes to be issued. |

---

## AWS CLI (Terpedia AWS)

Use the **Terpedia** AWS account. The script defaults to profile **`terpedia`**. If the domain was previously in another account (e.g. dan-syzygyx), migrate it first: see [move-terpedia-domain-to-terpedia-aws.md](move-terpedia-domain-to-terpedia-aws.md).

### Option A: Script (recommended)

From the repo root:

```bash
export AWS_PROFILE=terpedia
./scripts/setup-route53-next.sh
```

The script finds the **terpedia.com** hosted zone in the Terpedia account and creates the CNAME **next.terpedia.com** → **terpedia.github.io**. To skip the lookup, set the zone ID:

```bash
export AWS_PROFILE=terpedia
export HOSTED_ZONE_ID=Z1234567890ABC
./scripts/setup-route53-next.sh
```

### Option B: One-off command

If you have the hosted zone ID for **terpedia.com** in Terpedia AWS (e.g. `Z1234567890ABC`):

```bash
aws route53 change-resource-record-sets --profile terpedia \
  --hosted-zone-id Z1234567890ABC \
  --change-batch '{
  "Changes": [{
    "Action": "UPSERT",
    "ResourceRecordSet": {
      "Name": "next.terpedia.com",
      "Type": "CNAME",
      "TTL": 300,
      "ResourceRecords": [{ "Value": "terpedia.github.io" }]
    }
  }]
}'
```

Replace `Z1234567890ABC` with the hosted zone ID in Terpedia AWS (Route 53 → Hosted zones → terpedia.com).
