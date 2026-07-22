-- ========================================================
-- SecureShield Python - SQLite Database DDL & Data Seed
-- ========================================================

-- 1. PHONE REGISTRY
CREATE TABLE IF NOT EXISTS PHONE_REGISTRY (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    phone_number TEXT NOT NULL UNIQUE,
    owner_name TEXT,
    location TEXT,
    carrier TEXT,
    risk_score INTEGER DEFAULT 0,
    is_spoofed BOOLEAN DEFAULT 0,
    fraud_reports_count INTEGER DEFAULT 0
);

-- 2. MULE ACCOUNTS
CREATE TABLE IF NOT EXISTS MULE_ACCOUNTS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    account_number TEXT NOT NULL UNIQUE,
    bank_name TEXT,
    owner_name TEXT,
    transaction_limit REAL,
    current_balance REAL,
    risk_score INTEGER DEFAULT 0,
    status TEXT DEFAULT 'ACTIVE' -- ACTIVE, SUSPENDED, BLOCKED
);

-- 3. FRAUD REPORTS
CREATE TABLE IF NOT EXISTS FRAUD_REPORTS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    caller_phone TEXT,
    receiver_phone TEXT,
    mule_account TEXT,
    transcript TEXT,
    status TEXT DEFAULT 'NEW', -- NEW, INVESTIGATING, CONTAINED
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    severity TEXT DEFAULT 'LOW', -- LOW, MEDIUM, HIGH, CRITICAL
    scam_type TEXT
);

-- 4. BANKNOTE SCANS
CREATE TABLE IF NOT EXISTS BANKNOTE_SCANS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    serial_number TEXT NOT NULL,
    denomination INTEGER DEFAULT 500,
    microprint_match BOOLEAN DEFAULT 1,
    uv_match BOOLEAN DEFAULT 1,
    thread_match BOOLEAN DEFAULT 1,
    result_verdict TEXT DEFAULT 'GENUINE', -- GENUINE, SUSPICIOUS, COUNTERFEIT
    scanned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. AUDIT LOGS
CREATE TABLE IF NOT EXISTS AUDIT_LOGS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    agent_name TEXT NOT NULL,
    severity TEXT DEFAULT 'INFO', -- INFO, WARNING, CRITICAL, ACTION
    details TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INITIAL SEED DATA
INSERT OR IGNORE INTO PHONE_REGISTRY (id, phone_number, owner_name, location, carrier, risk_score, is_spoofed, fraud_reports_count)
VALUES 
(1, '+91 88888 77777', 'Telecom Dept (Spoofed)', 'Jamtara, Jharkhand', 'Airtel', 99, 1, 45),
(2, '+91 90000 11111', 'Customs Office Mumbai', 'Mumbai, Maharashtra', 'Vodafone-Idea', 85, 1, 8),
(3, '+91 98765 43210', 'CBI Impersonation Line', 'Delhi NCR', 'Jio', 95, 1, 12),
(4, '+91 99999 88888', 'Vijay Kumar', 'Bengaluru, Karnataka', 'Airtel', 2, 0, 0);

INSERT OR IGNORE INTO MULE_ACCOUNTS (id, account_number, bank_name, owner_name, transaction_limit, current_balance, risk_score, status)
VALUES 
(1, '30192837465', 'State Bank of India', 'Rahul Kumar (Mule Account A)', 50000.00, 450000.00, 98, 'BLOCKED'),
(2, '98765432109', 'ICICI Bank', 'Amit Patel (Mule Account B)', 100000.00, 125000.00, 90, 'SUSPENDED'),
(3, '11122233344', 'HDFC Bank', 'Vijay Kumar', 500000.00, 85000.00, 5, 'ACTIVE');

INSERT OR IGNORE INTO BANKNOTE_SCANS (id, serial_number, denomination, microprint_match, uv_match, thread_match, result_verdict)
VALUES 
(1, '5AA 123456', 500, 0, 0, 0, 'COUNTERFEIT'),
(2, '9BC 987654', 500, 1, 1, 1, 'GENUINE');

INSERT OR IGNORE INTO AUDIT_LOGS (id, agent_name, severity, details)
VALUES 
(1, 'System Startup', 'INFO', 'SecureShield Python (Flask + SQLite) Safety Engine booted.'),
(2, 'Database Seeder', 'INFO', 'SQLite database safety tables initialized and populated.');
