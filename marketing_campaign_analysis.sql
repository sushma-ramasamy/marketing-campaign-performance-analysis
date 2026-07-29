-- Setup
CREATE DATABASE marketing_project;
USE marketing_project;

-- Data Quality Checks
SELECT COUNT(*) FROM campaigns;

SELECT
  SUM(CASE WHEN CampaignID IS NULL THEN 1 ELSE 0 END) as missing_CampaignID,
  SUM(CASE WHEN StartDate IS NULL THEN 1 ELSE 0 END) as missing_StartDate,
  SUM(CASE WHEN Channel IS NULL THEN 1 ELSE 0 END) as missing_Channel,
  SUM(CASE WHEN Impressions IS NULL THEN 1 ELSE 0 END) as missing_Impressions,
  SUM(CASE WHEN Clicks IS NULL THEN 1 ELSE 0 END) as missing_Clicks,
  SUM(CASE WHEN Leads IS NULL THEN 1 ELSE 0 END) as missing_Leads,
  SUM(CASE WHEN Cost_USD IS NULL THEN 1 ELSE 0 END) as missing_Cost,
  SUM(CASE WHEN Revenue_USD IS NULL THEN 1 ELSE 0 END) as missing_Revenue,
  SUM(CASE WHEN ROI IS NULL THEN 1 ELSE 0 END) as missing_ROI
FROM campaigns;

SELECT CampaignID, COUNT(*) as cnt
FROM campaigns
GROUP BY CampaignID
HAVING COUNT(*) > 1;

SELECT
  SUM(CASE WHEN Impressions <= 0 THEN 1 ELSE 0 END) as bad_impressions,
  SUM(CASE WHEN Clicks < 0 THEN 1 ELSE 0 END) as bad_clicks,
  SUM(CASE WHEN Cost_USD < 0 THEN 1 ELSE 0 END) as bad_cost,
  SUM(CASE WHEN Clicks > Impressions THEN 1 ELSE 0 END) as clicks_exceed_impressions
FROM campaigns;

SELECT
  SUM(CASE WHEN EndDate < StartDate THEN 1 ELSE 0 END) as bad_date_order,
  SUM(CASE WHEN Leads > Clicks THEN 1 ELSE 0 END) as leads_exceed_clicks,
  SUM(CASE WHEN Conversions > Leads THEN 1 ELSE 0 END) as conversions_exceed_leads
FROM campaigns;

SELECT COUNT(*) as mismatched_roi
FROM campaigns
WHERE ROUND((Revenue_USD - Cost_USD) / Cost_USD, 2) != ROI;

SELECT
  MIN(Cost_USD) as min_cost, MAX(Cost_USD) as max_cost, AVG(Cost_USD) as avg_cost,
  MIN(ROI) as min_roi, MAX(ROI) as max_roi, AVG(ROI) as avg_roi
FROM campaigns;

-- Channel-level Analysis
SELECT
  Channel,
  COUNT(*) as num_campaigns,
  ROUND(AVG(Clicks / Impressions), 4) as avg_CTR,
  ROUND(SUM(Cost_USD), 2) as total_cost,
  ROUND(SUM(Revenue_USD), 2) as total_revenue,
  ROUND(SUM(Cost_USD) / SUM(Leads), 2) as cost_per_lead,
  ROUND(AVG(ROI), 3) as avg_ROI
FROM campaigns
GROUP BY Channel
ORDER BY avg_ROI DESC;

-- Monthly Trend Analysis
SELECT
  DATE_FORMAT(StartDate, '%Y-%m') as month,
  COUNT(*) as num_campaigns,
  ROUND(SUM(Cost_USD), 2) as total_cost,
  ROUND(SUM(Revenue_USD), 2) as total_revenue,
  ROUND(AVG(ROI), 3) as avg_ROI
FROM campaigns
GROUP BY month
ORDER BY month;

-- Channel x Month Cross-Check (the key insight)
SELECT
  Channel,
  DATE_FORMAT(StartDate, '%Y-%m') as month,
  ROUND(AVG(ROI), 3) as avg_ROI
FROM campaigns
WHERE DATE_FORMAT(StartDate, '%Y-%m') IN ('2025-09', '2025-11')
GROUP BY Channel, month
ORDER BY month, avg_ROI;
