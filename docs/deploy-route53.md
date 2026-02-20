# Deploy to next.terpedia.com with AWS Route 53

Use AWS Route 53 to point the subdomain **next.terpedia.com** at the GitHub Pages site for this repo.

## Prerequisites

- **terpedia.com** (or the parent domain) is hosted in **Route 53** (you have a hosted zone for it).
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

## Optional: AWS CLI

If you use the AWS CLI and have the hosted zone ID for **terpedia.com** (e.g. `Z1234567890ABC`):

```bash
aws route53 change-resource-record-sets --hosted-zone-id Z1234567890ABC --change-batch '{
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

Replace `Z1234567890ABC` with your hosted zone ID (Route 53 → Hosted zones → terpedia.com → Hosted zone ID).
