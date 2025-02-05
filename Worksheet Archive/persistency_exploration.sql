-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Auto

WITH filter AS
(
SELECT *
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_COMBINED"
WHERE POL_TRANS_EFF_DT <= '2024-11-15'
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


SELECT RATE_PLAN_CD, POL_STATUS_CD, COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND")     -- Grabs all policies inforce as of 10-31-2024
AND POL_STATUS_CD = 'InForce' OR POL_STATUS_CD = 'A'
GROUP BY RATE_PLAN_CD, POL_STATUS_CD

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Home

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
SELECT 
RATE_PLAN_CD, 
COUNT(DISTINCT POLICY_ID) AS CNT
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND"
WHERE ME_DT = (SELECT MAX(ME_DT) FROM "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND")     -- Grabs all policies inforce as of 10-31-2024
AND POL_STATUS_CD = 'InForce'
GROUP BY RATE_PLAN_CD
), 
HOME_PER AS -- Generates counts for Home Persistency Count based on most recent record for each policy
(
SELECT 
RATE_PLAN_CD, 
COUNT(DISTINCT POL_ID) AS CNT
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
-- NewCo vs NowCo, RatePlan screenshots for Home and Auto

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Market Channel Investigation

WITH connected_table AS
(
SELECT DISTINCT
AUTO_PER.MKTG_MEDIA_GRP_DESC AS AUTO_MKT_GRP,
AUTO_PER.MARKET_CHANNEL AS AUTO_MKT_CHNL,
AUTO_PER.POL_ID AS AUTO_POL_ID, -- MARKET_CHANNEL, MRKT_MEDIA_GRP_DESCR
AUTO_Q.QCN AS AUTO_QCN,
CROSSWALK.HOME_QCN AS HOME_QCN,
HOME_Q.POL_ID AS HOME_POL_ID,
HOME_PER.MARKET_CHANNEL AS HOME_MKT_CHNL,
HOME_PER.MKTG_MEDIA_GRP_DESC AS HOME_MKT_GRP
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_COMBINED" AS AUTO_PER
JOIN "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" AS AUTO_Q
ON TRY_TO_DECIMAL(AUTO_PER.POL_ID) = TRY_TO_DECIMAL(AUTO_Q.POL_ID)
JOIN "DSC_PLBI_DB"."APP_AUTO_PRD"."PLBI_PARTY_LINKING_VW" AS CROSSWALK
ON AUTO_Q.QCN = CROSSWALK.AUTO_QCN
JOIN "PRD_PL_DB"."APP_DCPA_DM"."PROP_QUOTE_DWELL_LATST_VW" AS HOME_Q 
ON CROSSWALK.HOME_QCN = HOME_Q.QCN
JOIN "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_COMBINED" AS HOME_PER
ON TRY_TO_DECIMAL(HOME_Q.POL_ID) = TRY_TO_DECIMAL(HOME_PER.POL_ID)
)
SELECT COUNT(*) -- Total records is 141,465
FROM connected_table
WHERE --AUTO_MKT_GRP <> HOME_MKT_GRP -- 25,510 have mismatched MKT_GRP
AUTO_MKT_CHNL <> HOME_MKT_CHNL -- 24,649 have mismatched MKT_CHNL
-- 33,897 have differences for Group, Channel, or both1


SELECT PCARR_BI_LMT_CD, COV_TYPE_ABBR, SUM(DERIV_ADJ_EP_AMT)
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_OPERATIONAL_LOSS_TS" AS AUTO_OP_LOSS
GROUP BY PCARR_BI_LMT_CD, COV_TYPE_ABBR