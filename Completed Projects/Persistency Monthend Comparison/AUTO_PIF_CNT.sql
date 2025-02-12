-- This query is used to compare PIF counts between Persistency and Month End Inforce
-- Note that the filter date may need to be changed for best results

WITH filter AS
(
SELECT *
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_COMBINED"
WHERE POL_TRANS_EFF_DT <= '2024-11-14'
), most_recent_auto_per AS
(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS rn          -- Assigns a rank to each policy id based on greatest policy effective date
FROM filter
),
MIF AS  -- Generates counts for Auto Month End Inforce
(
SELECT RATE_PLAN_CD, COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND")     -- Grabs all policies inforce as of 10-31-2024
AND POL_STATUS_CD = 'InForce'
GROUP BY RATE_PLAN_CD
), 
AUTO_PER AS -- Generates counts for Home Persistency Count based on most recent record for each policy
(
SELECT RATE_PLAN_CD, COUNT(DISTINCT POL_ID) AS CNT
FROM most_recent_auto_per
WHERE POL_QTE_STAT_DESC = 'InForce' AND rn = 1
GROUP BY RATE_PLAN_CD
)
SELECT MIF.RATE_PLAN_CD, 
MIF.CNT AS MIF_CNT, 
AUTO_PER.CNT AS AUTO_PER_CNT, 
ROUND(ABS((MIF_CNT - AUTO_PER_CNT) / ((MIF_CNT + AUTO_PER_CNT) / 2.0)) * 100, 2) AS PCT_DIFF,     -- Calculates absolute percent difference between policies in force
ABS(MIF_CNT - AUTO_PER_CNT) AS DIFF_CNT
FROM MIF JOIN AUTO_PER ON MIF.RATE_PLAN_CD = AUTO_PER.RATE_PLAN_CD
ORDER BY MIF_CNT DESC