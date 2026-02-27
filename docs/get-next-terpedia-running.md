# Get next.terpedia.com running

Checklist to get **https://next.terpedia.com** serving the Terpedia prototype.

---

## 1. GitHub Pages enabled (Source: GitHub Actions)

- Open: **https://github.com/Terpedia/terpedia-next/settings/pages**
- Under **Build and deployment**, set **Source** to **GitHub Actions**.
- Save. The workflow [`.github/workflows/deploy-pages.yml`](../.github/workflows/deploy-pages.yml) deploys on every push to `main`.
- Confirm a run succeeded: **Actions** tab → "Deploy to GitHub Pages" → latest run **green**. The site will be at **https://terpedia.github.io/terpedia-next/**.

---

## 2. DNS: next.terpedia.com → terpedia.github.io

**Done.** The CNAME **next.terpedia.com** → **terpedia.github.io** is in Route 53 (terpedia.com hosted zone in dan-syzygyx AWS). To recreate or use a different profile: `AWS_PROFILE=terpedia ./scripts/setup-route53-next.sh` (after the zone exists in that account).

- **Record:** next.terpedia.com → terpedia.github.io  
- (Created via `AWS_PROFILE=dan-syzygyx ./scripts/setup-route53-next.sh`)

Allow 1–5 minutes for DNS propagation. Check with: `dig next.terpedia.com CNAME` or [dnschecker.org](https://dnschecker.org/#CNAME/next.terpedia.com).

---

## 3. Custom domain in GitHub

- Open: **https://github.com/Terpedia/terpedia-next/settings/pages**
- Under **Custom domain**, enter: **next.terpedia.com**
- Click **Save**. Wait for GitHub to show the domain as verified (often 1–2 minutes).
- Optionally enable **Enforce HTTPS**.

---

## 4. Verify

- Visit **https://next.terpedia.com**. You should see the Terpedia prototype (landing, /features).
- If it still 404s: re-check step 1 (Pages source = GitHub Actions, workflow run succeeded) and step 3 (custom domain saved); wait a few more minutes for DNS and GitHub’s certificate.

---

## Quick reference

| Step | Status |
|------|--------|
| 1. GitHub Pages source = GitHub Actions | Do in repo Settings → Pages |
| 2. DNS CNAME next → terpedia.github.io | Done (Route 53) |
| 3. Custom domain = next.terpedia.com | Do in repo Settings → Pages |
| 4. Load https://next.terpedia.com | Verify |
