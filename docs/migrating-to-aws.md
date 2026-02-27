# Migrating to AWS

Terpedia is **migrating to AWS** for hosting and infrastructure. This doc captures the direction and decisions as they’re made.

---

## Direction

- **DNS:** terpedia.com is (or will be) in **Terpedia AWS** via Route 53. See [move-terpedia-domain-to-terpedia-aws.md](move-terpedia-domain-to-terpedia-aws.md).
- **Hosting:** The full app (app.terpedia.com), API (api.terpedia.com), and any future services will run on **AWS**.
- **Prototype:** next.terpedia.com can stay on **GitHub Pages** for now (CNAME to terpedia.github.io), or be moved to AWS (e.g. S3 + CloudFront) later.

---

## AWS services (candidates)

| Use case | Possible AWS services | Notes |
|----------|------------------------|--------|
| **Static / front-end** | S3, CloudFront, Amplify Hosting | App or marketing site; CDN for global low latency |
| **API** | API Gateway, Lambda, or ECS + ALB | REST/GraphQL for strains, terpenes, products |
| **Database** | RDS (Postgres), DynamoDB, or Aurora | App data, users, feed, UGC |
| **Auth** | Cognito, or app-managed (e.g. NextAuth + DB) | User accounts, Tersona, post/comment/review |
| **RSS ingestion** | Lambda (scheduled), EventBridge, or ECS | Tersonae subscribing to PubMed / Google News |
| **Search** | OpenSearch, or RDS/DB full-text | Encyclopedia, Terproduct, recipes |
| **Storage** | S3 | Uploads, assets, optional patient-record backup (if opted in) |
| **DNS** | Route 53 | terpedia.com, subdomains (next, app, api, etc.) |
| **Omics / life sciences** | **AWS HealthOmics** | Workflows (Nextflow, WDL, CWL), sequence stores, variant/annotation stores; Ready2Run and private pipelines; can run bioFMs (e.g. NVIDIA NIMs, AlphaFold). Use for terpene-related omics, genomics, or bioinformatics pipelines. |
| **Molecular AI** | **NVIDIA BioNeMo** (on GPU instances or via NIMs) | Terpene representation learning, property prediction, molecular generation; can back TerpeneQueen / chat-with-Tersona. Integrate with HealthOmics workflows or API. |

---

## Life sciences stack: HealthOmics + BioNeMo

- **AWS HealthOmics** — Store and process genomics/omics data; run bioinformatics workflows (Ready2Run or custom Nextflow/WDL/CWL). Supports biological foundation models (e.g. NVIDIA NIMs). Use for terpene-related omics data, variant/annotation stores, or pipelines that feed into the app/API.
- **NVIDIA BioNeMo** — Molecular AI (representation learning, property prediction, cheminformatics). Plan to use for terpenes: embeddings, property prediction, or integration with chat/Tersona. Can run on GPU instances in AWS or via BioNeMo NIMs (inference APIs).
- **Integration** — HealthOmics workflows can call BioNeMo or other models; app/API can query HealthOmics (e.g. Athena over annotation stores) and call BioNeMo for terpene ML. See [bionemo-terpenes.md](bionemo-terpenes.md).

---

## Migration phases (draft)

1. **Domain in AWS** — terpedia.com hosted zone in Terpedia AWS; NS updated at registrar. (See move-terpedia-domain doc.)
2. **Static on AWS (optional)** — Move next.terpedia.com from GitHub Pages to S3 + CloudFront, or keep on GitHub Pages.
3. **App + API on AWS** — Deploy app.terpedia.com and api.terpedia.com (e.g. CloudFront + S3 for static, API Gateway + Lambda or ECS for API; or Amplify).
4. **Data and backend** — Database, auth, feed pipeline, RSS ingestion on AWS as the plan advances.

---

## Open decisions

- [ ] Primary AWS region(s) (e.g. us-east-1).
- [ ] App runtime: static only (S3/CloudFront), or SSR/API (Amplify, ECS, Lambda).
- [ ] Database choice (RDS vs DynamoDB vs other).
- [ ] Whether to move next.terpedia.com off GitHub Pages to S3/CloudFront or keep it on Pages.
- [ ] **AWS HealthOmics:** Which workflows (Ready2Run vs custom); sequence/variant/annotation stores for terpene-related data.
- [ ] **BioNeMo:** Hosting (EC2 GPU vs NIMs); use cases (embeddings, property prediction, chat/Tersona).

---

*Update this doc as migration decisions are made. See [features-and-subdomains.md](features-and-subdomains.md), [PLAN.md](../PLAN.md), and [FEATURES.md](../FEATURES.md).*
