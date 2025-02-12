-- This query is used to compare PIF counts between Persistency and Month End Inforce
-- Note that the filter date may need to be changed for best results

WITH filter AS
(
SELECT *
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED"
WHERE DATE(POL_TERM_LATST_TRANS_TMSP) <= '2024-11-02'
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