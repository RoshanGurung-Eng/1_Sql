-- Tool 2: Analyze Marketing Leads for AayuLogic

-- Table Structure
CREATE TABLE marketing_leads (
    lead_id INT,
    source VARCHAR(50),
    industry VARCHAR(50),
    demo_requested BOOLEAN
);

-- Query 1: Which source brings most demos?
SELECT source, COUNT(*) as total_demos
FROM marketing_leads
WHERE demo_requested = TRUE
GROUP BY source
ORDER BY total_demos DESC;

-- Query 2: Top Industries interested in RealHRsoft
SELECT industry, COUNT(*) as leads
FROM marketing_leads
WHERE industry IN ('Banking', 'IT', 'Healthcare')
GROUP BY industry;