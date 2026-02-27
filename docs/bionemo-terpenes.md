# BioNeMo + AWS HealthOmics for terpenes

Plan for using **NVIDIA BioNeMo** and **AWS HealthOmics** to work with terpenes and related life-sciences data.

---

## NVIDIA BioNeMo

- **What it is:** NVIDIA’s framework for molecular and life-sciences AI (representation learning, property prediction, molecular generation, cheminformatics).
- **Planned use with terpenes:** Terpene molecular representations/embeddings; property prediction (e.g. aroma, effects); support for TerpeneQueen and chat-with-Tersona; optional molecular generation or drug-likeness.
- **Deployment:** Run on AWS GPU instances (e.g. EC2 with NVIDIA GPUs) or use BioNeMo NIMs (inference microservices/APIs). Integrate with api.terpedia.com or app backend.
- **References:** [BioNeMo Framework](https://docs.nvidia.com/bionemo-framework/), [GitHub](https://github.com/NVIDIA/bionemo-framework).

---

## AWS HealthOmics

- **What it is:** AWS service for storing and processing genomics and omics data at scale. Includes sequence stores, variant stores, annotation stores, and workflow runs (Nextflow, WDL, CWL). Supports Ready2Run pipelines and biological foundation models (e.g. NVIDIA NIMs, AlphaFold).
- **Planned use with terpenes:** Store and query terpene-related omics or annotation data; run bioinformatics pipelines that produce or consume terpene data; optional integration with variant/annotation stores (e.g. query via Athena) for the app/API.
- **Integration with BioNeMo:** HealthOmics workflows can invoke BioNeMo or other models; app can query HealthOmics (e.g. analytics/Athena) and call BioNeMo for terpene ML in one pipeline.
- **References:** [AWS HealthOmics](https://aws.amazon.com/healthomics/), [HealthOmics User Guide](https://docs.aws.amazon.com/omics/latest/dev/).

---

## Open decisions

- [ ] Which BioNeMo components (Framework vs NIMs); which models for terpenes.
- [ ] HealthOmics: Ready2Run vs custom workflows; whether to use sequence/variant/annotation stores for terpene data.
- [ ] How app/API invokes BioNeMo and HealthOmics (direct API, Lambda, Step Functions, or HealthOmics workflow).
- [ ] Region and compliance (e.g. HIPAA) if patient or omics data is involved.

---

*See [migrating-to-aws.md](migrating-to-aws.md) for the broader AWS migration and life-sciences stack.*
