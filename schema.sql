-- PMO Portfolio Database Schema
-- Run this in your Neon console

-- Main state table - stores the entire app state as JSON
CREATE TABLE IF NOT EXISTS pmo_state (
    id SERIAL PRIMARY KEY,
    tenant_id VARCHAR(50) DEFAULT 'default',
    projects JSONB DEFAULT '[]',
    people JSONB DEFAULT '{}',
    assignments JSONB DEFAULT '{}',
    triage_items JSONB DEFAULT '[]',
    criteria_weights JSONB DEFAULT '{}',
    max_capacity INTEGER DEFAULT 70,
    criteria JSONB DEFAULT '[]',
    updated_at TIMESTAMP DEFAULT NOW(),
    updated_by VARCHAR(100),
    UNIQUE(tenant_id)
);

-- Insert default row
INSERT INTO pmo_state (tenant_id, projects, people, assignments, triage_items, criteria_weights)
VALUES ('default', '[]', '{}', '{}', '[]', '{}')
ON CONFLICT (tenant_id) DO NOTHING;

-- Activity log for audit trail
CREATE TABLE IF NOT EXISTS pmo_activity_log (
    id SERIAL PRIMARY KEY,
    tenant_id VARCHAR(50) DEFAULT 'default',
    action VARCHAR(50),
    details JSONB,
    user_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Index for faster queries
CREATE INDEX IF NOT EXISTS idx_pmo_state_tenant ON pmo_state(tenant_id);
CREATE INDEX IF NOT EXISTS idx_pmo_activity_tenant ON pmo_activity_log(tenant_id);

-- =============================================
-- RUN THIS IF YOUR TABLE ALREADY EXISTS:
-- (adds the missing columns safely)
-- =============================================
ALTER TABLE pmo_state ADD COLUMN IF NOT EXISTS max_capacity INTEGER DEFAULT 70;
ALTER TABLE pmo_state ADD COLUMN IF NOT EXISTS criteria JSONB DEFAULT '[]';
