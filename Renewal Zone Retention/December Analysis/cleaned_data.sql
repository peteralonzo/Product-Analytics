CREATE OR REPLACE TRANSIENT TABLE USER_DB.AD1_PA08042.RENEWAL_ZONE AS
(
WITH full_data AS
(
SELECT distinct policy_num, event_day
from prd_dgtl_db.app_tas_dm.vw_alias_personal_lines_prod_events
where event_day >= dateadd(month,-4,current_date)
and web_site_identifier = 'newco-service'
and internal_traffic = 'false'
and app_user_access_role_desc_event = 'consumer'
and (event_id in ('renewalzoneflow','readyforyourupcomingrenewalpopup','renewalzonetilebtn','reviewthedetailsbtn')
or page_name = 'renewalzonedashboard'
or event_detail = 'learnmoreaboutmyrate')
order by 2 asc
),

/* Gets all records with only one POL_ID */
single_record AS
(
SELECT DISTINCT POLICY_NUM, EVENT_DAY 
from full_data
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
from full_data
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

SELECT * FROM joined_table
WHERE POL_ID <> ''
)