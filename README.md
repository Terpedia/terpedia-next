# Terpedia — Prototype

A static prototype for [terpedia.com](https://terpedia.com), built for **GitHub Pages**.

## Contents

- **Terpedia** — Your Terpene Knowledge Hub: cannabis strains, terpene library, and evidence-based terpene science.
- Single-page landing with hero, feature cards, and about section.
- **[FEATURES.md](FEATURES.md)** — Product feature list: Encyclopedia, Terports, Terproduct Database, Tersona, Podcasts, Activity Feed.
- **[PLAN.md](PLAN.md)** — Comprehensive launch plan: phases, tech decisions, data, timeline, and next steps.

## GitHub Pages

**If https://terpedia.github.io/terpedia-next/ is 404**, Pages isn’t enabled yet. Do one of the following.

### Option 1: Deploy with GitHub Actions (recommended)

1. Open the repo **Settings → Pages**:  
   **https://github.com/Terpedia/terpedia-next/settings/pages**
2. Under **Build and deployment**, set **Source** to **GitHub Actions**.
3. Push to `main` (or run the workflow manually: Actions → “Deploy to GitHub Pages” → Run workflow).
4. Wait 1–2 minutes. The site will be at **https://terpedia.github.io/terpedia-next/**.

This repo includes the workflow [`.github/workflows/deploy-pages.yml`](.github/workflows/deploy-pages.yml), which deploys the static files on every push to `main`.

### Option 2: Set up with gh (CLI)

From the repo root, with [gh](https://cli.github.com/) installed and logged in (`gh auth login`):

```bash
./scripts/setup-pages.sh
# or for another repo: ./scripts/setup-pages.sh Owner/repo
```

Or one-shot (JSON body):

```bash
gh api repos/Terpedia/terpedia-next/pages -X POST \
  -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" \
  --input - <<<'{"build_type":"legacy","source":{"branch":"main","path":"/"}}'
```

To open **Settings → Pages** in the browser:

```bash
gh browse --repo Terpedia/terpedia-next settings/pages
```

### Option 3: Deploy from a branch (UI)

1. In the repo: **Settings → Pages**
2. Under **Build and deployment**, set **Source** to **Deploy from a branch**
3. Branch: **main**, folder: **/ (root)**
4. Save. The site will be at **https://terpedia.github.io/terpedia-next/** (or your custom domain).

*Note: Some organizations disable “Deploy from a branch”; use Option 1 (GitHub Actions) instead.*

## Run locally

Open `index.html` in a browser, or use a local server:

```bash
python3 -m http.server 8000
# or: npx serve .
```

Then visit `http://localhost:8000`.

## License

Prototype for Terpedia / Apothyx.
