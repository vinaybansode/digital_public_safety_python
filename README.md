# 🛡️ SecureShield AI: 5-Pillar Digital Public Safety Command Center

SecureShield AI is an integrated, multi-agent cyber safety and threat intelligence platform designed to protect citizens from "Digital Arrest" impersonation scams, identify Fake Indian Currency Notes (FICN) at bank counters, and orchestrate inter-district law enforcement deployment. 

The project provides a dual-use portal: a **Citizen-facing conversational safety shield** and a **Law Enforcement Command Center dashboard**.

---

## 🚀 The 5 Core Pillars

1. **Citizen Fraud Shield:** An interactive conversational scanner that parses transcripts and caller IDs for digital arrest and coercion signatures (CBI, Customs, narcotics threats) to warn citizens before payments occur.
2. **Counterfeit Currency Identification Agent:** A Computer Vision-guided inspection terminal for RBI ₹500 notes checking Microprints, security thread color-shifts, and UV fibers. Includes a default-reject system for foreign currency (USD, Dirhams) and plain paper.
3. **Financial SOAR Orchestrator:** Automatically freezes flagged recipient bank accounts and registers caller blacklists in carriers to secure victim funds within the "golden hour."
4. **Geospatial Crime Pattern Intelligence:** Maps complaints, seizures, and syndicate hubs (like Jamtara) to rank patrol priorities (P1, P2, P3) for police deployment.
5. **Multilingual Advisories & RAG Search:** Renders safety warnings in 12 regional languages (Hindi, Tamil, Marathi, etc.) and integrates a searchable database of MHA and RBI circulars.

---

## 📊 System Architecture

```text
┌────────────────────────────────────────────────────────────────────────┐
│                        CITIZEN & USER PORTAL                           │
│   (Suspicious Call Transcripts, Banknote Photo Uploads, Caller IDs)   │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
                                   ▼
┌────────────────────────────────────────────────────────────────────────┐
│                        FLASK REST API GATEWAY                          │
│          (Routes traffic, secures ports, validates payloads)           │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
         ┌─────────────────────────┴─────────────────────────┐
         ▼                                                   ▼
┌─────────────────────────┐                         ┌────────────────────┐
│   NLP ANALYZER AGENT    │                         │ CV BANKNOTE AGENT  │
│  (Scans Call Coercion   │                         │(RBI ₹500 Features: │
│   & Scam Keywords)      │                         │Thread, UV, Micro)  │
└────────┬────────────────┘                         └────────┬───────────┘
         │                                                   │
         └─────────────────────────┬─────────────────────────┘
                                   ▼
┌────────────────────────────────────────────────────────────────────────┐
│                      FINANCIAL INTELLIGENCE AGENT                      │
│     (Cross-references Bank Accounts & Caller IDs with DB Registries)   │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
                                   ▼
┌────────────────────────────────────────────────────────────────────────┐
│                      RESPONSE ORCHESTRATOR AGENT                       │
│    (Executes SOAR automated playbooks for critical threat actions)     │
└──────────────────────────────────┬─────────────────────────────────────┘
                                   │
         ┌─────────────────────────┼─────────────────────────┐
         ▼                         ▼                         ▼
┌─────────────────┐       ┌─────────────────┐       ┌────────────────────┐
│ SQLITE DATABASE │       │  TELCO FIREWALL │       │ GEOSPATIAL MAP &   │
│ (Blocks account │       │ (Flags spoofed  │       │ LAW ENFORCEMENT    │
│  & logs audit)  │       │     numbers)    │       │   COMMAND CENTER   │
└─────────────────┘       └─────────────────┘       └────────────────────┘