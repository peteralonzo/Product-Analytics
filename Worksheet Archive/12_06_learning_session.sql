-- Helper Queries
SELECT *
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"
LIMIT 50;

SELECT *
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
LIMIT 50;

SELECT MAX(ME_DT)
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"

SELECT POL_ID, POL_EFF_DT, POL_STATUS_CD
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
WHERE POL_ID IN ('01RA226152', '01RA225976')
ORDER BY POL_ID, POL_EFF_DT;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Starter Query
WITH MIF AS  -- Returns PIF counts for Home Month End InForce segmented by Rate Plan Code
(
SELECT 
RATE_PLAN_CD, 
COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND")     -- Grabs all policies InForce as of most recent update
GROUP BY RATE_PLAN_CD
), 

HOME_PER AS -- Returns PIF counts for Home Persistency segmented by Rate Plan Code
(
SELECT 
RATE_PLAN_CD, 
COUNT(DISTINCT POL_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
GROUP BY RATE_PLAN_CD
)

SELECT MIF.RATE_PLAN_CD, 
MIF.CNT AS MIF_CNT, 
HOME_PER.CNT AS HOME_PER_CNT, 
ROUND(ABS((MIF_CNT - HOME_PER_CNT) / ((MIF_CNT + HOME_PER_CNT) / 2.0)) * 100, 2) AS PCT_DIFF,     -- Calculates absolute percent difference between policies InForce
ABS(MIF_CNT - HOME_PER_CNT) AS DIFF_CNT
FROM MIF JOIN HOME_PER ON MIF.RATE_PLAN_CD = HOME_PER.RATE_PLAN_CD
ORDER BY MIF_CNT DESC;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Problem 1.1: First Fix with Comparing PIF Counts

WITH MIF AS  -- Returns PIF counts for Home Month End InForce segmented by Rate Plan Code
(
SELECT 
RATE_PLAN_CD, 
POL_STATUS_CD,
COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND")     -- Grabs all policies InForce as of most recent update
AND POL_STATUS_CD = 'InForce'
GROUP BY RATE_PLAN_CD, POL_STATUS_CD
), 

HOME_PER AS -- Returns PIF counts for Home Persistency segmented by Rate Plan Code
(
SELECT 
RATE_PLAN_CD, 
COUNT(DISTINCT POL_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
WHERE POL_STATUS_CD = 'InForce'
GROUP BY RATE_PLAN_CD
)

SELECT MIF.RATE_PLAN_CD, 
MIF.POL_STATUS_CD,
MIF.CNT AS MIF_CNT, 
HOME_PER.CNT AS HOME_PER_CNT, 
ROUND(ABS((MIF_CNT - HOME_PER_CNT) / ((MIF_CNT + HOME_PER_CNT) / 2.0)) * 100, 2) AS PCT_DIFF,     -- Calculates absolute percent difference between policies InForce
ABS(MIF_CNT - HOME_PER_CNT) AS DIFF_CNT
FROM MIF JOIN HOME_PER ON MIF.RATE_PLAN_CD = HOME_PER.RATE_PLAN_CD
ORDER BY MIF_CNT DESC;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Problem 1.2: Second Fix with Comparing PIF Counts

WITH most_recent_home_per AS
(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS rn          -- Assigns a rank to each policy id based on greatest policy effective date
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
WHERE POL_TERM_LATST_TRANS_TMSP <= '2024-12-02'
), 
MIF AS  -- Generates counts for Home Month End Inforce
(
SELECT RATE_PLAN_CD, COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND")     -- Grabs all policies InForce as of 11-30-2024
AND POL_STATUS_CD = 'InForce'
GROUP BY RATE_PLAN_CD
), 
HOME_PER AS -- Generates counts for Home Persistency Count based on most recent record for each policy
(
SELECT RATE_PLAN_CD, COUNT(DISTINCT POL_ID) AS CNT
FROM most_recent_home_per
WHERE POL_STATUS_CD = 'InForce' AND rn = 1
GROUP BY RATE_PLAN_CD
)
SELECT MIF.RATE_PLAN_CD, 
MIF.CNT AS MIF_CNT, 
HOME_PER.CNT AS HOME_PER_CNT, 
ROUND(ABS((MIF_CNT - HOME_PER_CNT) / ((MIF_CNT + HOME_PER_CNT) / 2.0)) * 100, 2) AS PCT_DIFF,     -- Calculates absolute percent difference between policies InForce
ABS(MIF_CNT - HOME_PER_CNT) AS DIFF_CNT
FROM MIF JOIN HOME_PER ON MIF.RATE_PLAN_CD = HOME_PER.RATE_PLAN_CD
ORDER BY MIF_CNT DESC


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Problem 2: Comparing PIF counts for two datasets with different update frequencies


WITH filter AS
(
SELECT *
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
WHERE DATE(POL_TERM_LATST_TRANS_TMSP) <= '2024-12-04'
), most_recent_home_per AS
(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS rn          -- Assigns a rank to each policy id based on greatest policy effective date
FROM filter
), 
MIF AS  -- Generates counts for Home Month End Inforce
(
SELECT RATE_PLAN_CD, COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND")     -- Grabs all policies inforce as of 10-31-2024
AND POL_STATUS_CD = 'InForce'
GROUP BY RATE_PLAN_CD
), 
HOME_PER AS -- Generates counts for Home Persistency Count based on most recent record for each policy
(
SELECT RATE_PLAN_CD, COUNT(DISTINCT POL_ID) AS CNT
FROM most_recent_home_per
WHERE POL_STATUS_CD = 'InForce' AND rn = 1
GROUP BY RATE_PLAN_CD
)
SELECT MIF.RATE_PLAN_CD, 
MIF.CNT AS MIF_CNT, 
HOME_PER.CNT AS HOME_PER_CNT, 
ROUND(ABS((MIF_CNT - HOME_PER_CNT) / ((MIF_CNT + HOME_PER_CNT) / 2.0)) * 100, 2) AS PCT_DIFF,     -- Calculates absolute percent difference between policies in force
ABS(MIF_CNT - HOME_PER_CNT) AS DIFF_CNT
FROM MIF JOIN HOME_PER ON MIF.RATE_PLAN_CD = HOME_PER.RATE_PLAN_CD
ORDER BY MIF_CNT DESC
