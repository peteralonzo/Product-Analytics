CREATE OR REPLACE TRANSIENT TABLE USER_DB.AD1_PA08042.RENEWAL_ZONE_2 AS
(
WITH full_data AS
(
    SELECT DISTINCT POLICY_NUM, TO_CHAR (EVENT_DAY, 'MON-YYYY') AS EVENT_DAY
    FROM PRD_DGTL_DB.APP_TAS_DM.VW_ALIAS_PERSONAL_LINES_PROD_EVENTS
    WHERE WEB_SITE_IDENTIFIER = 'newco-service'
    AND APP_USER_ACCESS_ROLE_DESC_EVENT = 'consumer'
    AND EVENT_DAY BETWEEN '2024-10-01' AND '2025-01-31'
    AND INTERNAL_TRAFFIC = 'false'
    AND SESSION_ID IN (
    SELECT DISTINCT SESSION_ID
    FROM PRD_DGTL_DB.APP_TAS_DM.VW_ALIAS_PERSONAL_LINES_PROD_EVENTS
    WHERE WEB_SITE_IDENTIFIER = 'newco-service'
    AND APP_USER_ACCESS_ROLE_DESC_EVENT = 'consumer'
    AND EVENT_DAY BETWEEN '2024-10-01' AND '2025-01-31'
    AND INTERNAL_TRAFFIC = 'false'
    AND (EVENT_ID IN ('renewalzoneflow','readyforyourupcomingrenewalpopup','renewalzonetilebtn','reviewthedetailsbtn')
    OR PAGE_NAME = 'renewalzonedashboard'
    OR EVENT_DETAIL = 'learnmoreaboutmyrate'))
),

/* Gets all records with only one POL_ID */
single_record AS
(
    SELECT DISTINCT POLICY_NUM, EVENT_DAY 
    FROM full_data
    WHERE LENGTH(POLICY_NUM) <= 12
),

/* Removes random commas from those records */
comma_fix AS
(
    SELECT SUBSTR(POLICY_NUM, 1, 11) AS POL_ID, EVENT_DAY 
    FROM single_record
),

/* Gathers records with QCNs and/or multiple POL_IDs */
multiple_records AS
(
    SELECT DISTINCT POLICY_NUM, EVENT_DAY 
    FROM full_data
    WHERE LENGTH(policy_num) > 12
),

/* Removes QCN's and turns each POL_ID into its own row */
fixed_records AS
(
    SELECT DISTINCT TRIM(value) AS POL_ID, EVENT_DAY
    FROM multiple_records, LATERAL FLATTEN(input => SPLIT(POLICY_NUM, ',')) AS split_parts
    WHERE value NOT LIKE '%ph%' AND value NOT LIKE '%pa%'
    ORDER BY EVENT_DAY ASC
),

/* Joins clean rows back together and removes records with no POL_ID */
joined_table AS
(
    SELECT * FROM fixed_records
    UNION
    SELECT * FROM comma_fix
)

SELECT DISTINCT POL_ID, MAX(EVENT_DAY) AS EVENT_DAY FROM joined_table
WHERE POL_ID <> ''
GROUP BY POL_ID
)