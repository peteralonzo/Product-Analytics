-- Persistency Analysis #1: Just Renewal Zone Policies
/* Ranks every row for each POL_ID based on POL_EFF_DT */
WITH labeled_ap AS
(
SELECT 'Auto' AS POL_TYPE, 
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS auto_rn,
* FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_COMBINED"
),

/* Takes most recent record for each POL_ID and only includes policies 
that are in the renewal zone and set to renew 
in the next 60 days */
rz_policies AS
(
SELECT * FROM labeled_ap 
WHERE auto_rn = 1
AND POL_ID IN (SELECT CAST(POL_ID AS VARCHAR) FROM USER_DB.AD1_PA08042.RENEWAL_ZONE)
AND ((DATEADD(DAY, -60, POL_EXP_DT) BETWEEN '2024-10-01' AND CURRENT_DATE) 
OR POL_EXP_DT > CURRENT_DATE)
)

/* Used for Current Policy Status
Make sure two queries below are commented out before running */
SELECT CASE 
WHEN ATR_E_FLAT = 1 AND CANCEL_E_FLAT = 0 THEN 'Active'
WHEN ATR_E_FLAT = 1 AND CANCEL_E_FLAT = 1 THEN 'Cancel'
WHEN ATR_E_FLAT = 0 AND CANCEL_E_FLAT = 0 AND CANCEL_FLAG = 1 THEN 'Cancel'
ELSE 'Pending' END AS STATUS,
COUNT(DISTINCT POL_ID) AS CNT
FROM rz_policies
GROUP BY STATUS

/* Used for E+0 Policy Count
Make sure Current Policy Status and E+0 calculation queries
are commented out before running */
SELECT CANCEL_E_FLAT, COUNT(DISTINCT POL_ID) AS CNT
FROM rz_policies
WHERE ATR_E_FLAT = 1
GROUP BY CANCEL_E_FLAT
ORDER BY CANCEL_E_FLAT

/* Used for E+0 calculation 
Make sure Decision Breakdown SELECT statement above is commented out before running*/
SELECT 
CONCAT(ROUND(((CASE WHEN sum(ATR_E_FLAT) IS NOT NULL THEN sum(ATR_E_FLAT) ELSE 0 END - 
CASE WHEN sum(CANCEL_E_FLAT) IS NOT NULL THEN sum(CANCEL_E_FLAT) ELSE 0 END) / 
NULLIF(CASE WHEN sum(ATR_E_FLAT) IS NOT NULL THEN sum(ATR_E_FLAT) ELSE 0 END,0.0)) * 100, 2), '%') AS "E+0"
FROM rz_policies

-------------------------------------------------------------------------------------------------------------------------------------------

-- Persistency Analysis #2: Full Book
/* Ranks every row for each POL_ID based on POL_EFF_DT */
WITH labeled_ap AS
(
SELECT 'Auto' AS POL_TYPE, 
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS auto_rn,
* FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_COMBINED"
),

/* Takes most recent record for each POL_ID and 
includes all policies that are set to renew 
in the next 60 days */
full_book AS
(
SELECT * FROM labeled_ap 
WHERE auto_rn = 1 
AND ((DATEADD(DAY, -60, POL_EXP_DT) BETWEEN '2024-10-01' AND CURRENT_DATE)
OR POL_EXP_DT > CURRENT_DATE)
)

/* Used for Current Policy Status
Make sure two queries below are commented out before running */
SELECT CASE 
WHEN ATR_E_FLAT = 1 AND CANCEL_E_FLAT = 0 THEN 'Active'
WHEN ATR_E_FLAT = 1 AND CANCEL_E_FLAT = 1 THEN 'Cancel'
WHEN ATR_E_FLAT = 0 AND CANCEL_E_FLAT = 0 AND CANCEL_FLAG = 1 THEN 'Cancel'
ELSE 'Pending' END AS STATUS,
COUNT(DISTINCT POL_ID) AS CNT
FROM full_book
GROUP BY STATUS

/* Used for E+0 Policy Count
Make sure Current Policy Status and E+0 calculation queries
are commented out before running */
SELECT CANCEL_E_FLAT, 
COUNT(DISTINCT POL_ID) AS CNT
FROM full_book
WHERE ATR_E_FLAT = 1
GROUP BY CANCEL_E_FLAT
ORDER BY CANCEL_E_FLAT

/* Used for E+0 calculation 
Make sure Decision Breakdown SELECT statement above is commented out before running*/
SELECT 
CONCAT(ROUND(((CASE WHEN sum(ATR_E_FLAT) IS NOT NULL THEN sum(ATR_E_FLAT) ELSE 0 END - 
CASE WHEN sum(CANCEL_E_FLAT) IS NOT NULL THEN sum(CANCEL_E_FLAT) ELSE 0 END) / 
NULLIF(CASE WHEN sum(ATR_E_FLAT) IS NOT NULL THEN sum(ATR_E_FLAT) ELSE 0 END,0.0)) * 100, 2), '%') AS "E+0"
FROM full_book

-------------------------------------------------------------------------------------------------------------------------------------------

-- Persistency Analysis #3: Full Book w/o Renewal Zone Policies
/* Ranks every row for each POL_ID based on POL_EFF_DT */
WITH labeled_ap AS
(
SELECT 'Auto' AS POL_TYPE, 
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS auto_rn,
* FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_COMBINED"
),

/* Takes most recent record for each POL_ID and 
excludes all policies in the renewal zone and those that are set to renew 
in the next 60 days */
exclude_rz AS
(
SELECT * FROM labeled_ap 
WHERE auto_rn = 1 
AND POL_ID NOT IN (SELECT CAST(POL_ID AS VARCHAR) FROM USER_DB.AD1_PA08042.RENEWAL_ZONE)
AND ((DATEADD(DAY, -60, POL_EXP_DT) BETWEEN '2024-10-01' AND CURRENT_DATE) 
OR POL_EXP_DT > CURRENT_DATE)
)

/* Used for Current Policy Status
Make sure two queries below are commented out before running */
SELECT CASE 
WHEN ATR_E_FLAT = 1 AND CANCEL_E_FLAT = 0 THEN 'Active'
WHEN ATR_E_FLAT = 1 AND CANCEL_E_FLAT = 1 THEN 'Cancel'
WHEN ATR_E_FLAT = 0 AND CANCEL_E_FLAT = 0 AND CANCEL_FLAG = 1 THEN 'Cancel'
ELSE 'Pending' END AS STATUS,
COUNT(DISTINCT POL_ID) AS CNT
FROM exclude_rz
GROUP BY STATUS

/* Used for E+0 Policy Count
Make sure Current Policy Status and E+0 calculation queries
are commented out before running */
SELECT CANCEL_E_FLAT, COUNT(DISTINCT POL_ID) AS CNT
FROM exclude_rz
WHERE ATR_E_FLAT = 1
GROUP BY CANCEL_E_FLAT
ORDER BY CANCEL_E_FLAT

/* Used for E+0 calculation 
Make sure Decision Breakdown SELECT statement above is commented out before running*/
SELECT 
CONCAT(ROUND(((CASE WHEN sum(ATR_E_FLAT) IS NOT NULL THEN sum(ATR_E_FLAT) ELSE 0 END - 
CASE WHEN sum(CANCEL_E_FLAT) IS NOT NULL THEN sum(CANCEL_E_FLAT) ELSE 0 END) / 
NULLIF(CASE WHEN sum(ATR_E_FLAT) IS NOT NULL THEN sum(ATR_E_FLAT) ELSE 0 END,0.0)) * 100, 2), '%') AS "E+0"
FROM exclude_rz