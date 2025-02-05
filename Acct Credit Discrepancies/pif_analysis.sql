-- This query is used to bucket policies and identify those with future renewals and acct credit issues

WITH filtered_ap AS    -- Returns all Prevail Auto records in Persistency																
(																
SELECT *,																
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS rn   																
FROM DSC_PLBI_DB.APP_AUTO_PRD.AUTO_PERSISTENCY_COMBINED																
WHERE NEWCO_IND = 'Y'																
),																
																
auto_per AS     -- Returns most recent record for every Prevail Auto policy in Persistency																
(																
SELECT *																
FROM filtered_ap																
WHERE rn = 1 																
AND POL_EXP_DT >= '2024-09-01' -- ~55 days after bug was introduced (when packets would be sent out)																
),																
																
ranked_hp AS    -- Ranking every record for each Policy ID by Policy Effective Date																
(																
SELECT *,																
ROW_NUMBER() OVER (PARTITION BY POL_ID ORDER BY POL_EFF_DT DESC) AS rn   																
FROM DSC_PLBI_DB.APP_HOME_PRD.HOME_PERSISTENCY_COMBINED																
),																
																
home_per AS     -- Returns most recent record for every Home policy in Persistency																
(																
SELECT *																
FROM ranked_hp																
WHERE rn = 1																
),																
																
joined_table AS -- Connects all Prevail Auto policies to Home Persistency																
(																
SELECT DISTINCT																
auto_per.POL_ID AS AUTO_POL_ID,																
auto_per.POL_EFF_DT AS AUTO_EFF_DT,																
																
/* Manually fixes rows that appeared inforce 																
but had a policy effective date more than 6 months ago */																
CASE WHEN auto_per.POL_QTE_STAT_DESC = 'InForce' AND auto_per.POL_EFF_DT >= DATE(DATEADD(MONTH, -6, GETDATE())) THEN 'InForce' ELSE 'Left' END AS AUTO_STATUS,					
CASE WHEN auto_per.POL_ACCT_CR_IND = 1 THEN 'Y' ELSE 'N' END AS AUTO_ACCT_CR_IND,																
auto_per.POL_FORM_CD AS AUTO_FORM_CD,																
auto_q.QCN AS AUTO_QCN,																
crosswalk.HOME_QCN AS HOME_QCN,																
home_per.POL_FORM_CD AS HOME_FORM_CD,																
home_q.POL_ID AS HOME_POL_ID,																
home_per.ACCT_CR_IND AS HOME_ACCT_CR_IND,																
																
/* Manually fixes rows that appeared inforce 																
but had a policy effective date more than a year ago */																
CASE WHEN home_per.POL_STATUS_CD = 'InForce' AND home_per.POL_EFF_DT >= DATE(DATEADD(YEAR, -1, GETDATE())) THEN 'InForce' ELSE 'Left' END AS HOME_STATUS						
FROM auto_per																
JOIN "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" AS auto_q																
ON auto_per.POL_ID = auto_q.POL_ID																
JOIN "DSC_PLBI_DB"."APP_AUTO_PRD"."PLBI_PARTY_LINKING_VW" AS crosswalk																
ON auto_q.QCN = crosswalk.AUTO_QCN																
JOIN "PRD_PL_DB"."APP_DCPA_DM"."PROP_QUOTE_DWELL_LATST_VW" AS home_q 																
ON crosswalk.HOME_QCN = home_q.QCN																
JOIN home_per																
ON CAST(home_q.POL_ID AS VARCHAR) = CAST(home_per.POL_ID AS VARCHAR)																
),																
																
final_table AS -- Includes logic for bucketing policies into future renewals and historical in-force vs cancelled																
(																
SELECT joined_table.*,																
CASE 																
																
/*This indicator is used for the future bucket (priority 1)																
There is an account credit problem when both auto and home are inforce and either indicator is No																
There is also an account credit problem when only auto is inforce and the auto indicator is Yes */																
WHEN AUTO_STATUS = 'InForce'																
AND ((HOME_STATUS = 'InForce' AND (AUTO_ACCT_CR_IND = 'N' OR HOME_ACCT_CR_IND = 'N')) OR (HOME_STATUS = 'Left' AND AUTO_ACCT_CR_IND = 'Y'))																
/* date range is used to only flag policies that will be renewing in the next two months */																
AND AUTO_EFF_DT >= '2024-06-05' AND AUTO_EFF_DT <= '2024-08-02'																
THEN 1 ELSE 0 END AS FUTURE_IND,																
																
/* This indicator is used for the historical inforce and historical left bucket (priority 2 and 3)																
There is an account credit problem when both auto and home are inforce and either indicator is No																
There is also an account credit problem when only auto is inforce and the auto indicator is Yes																
Another problem is when only home is inforce and the home indicator is Yes																
I also flagged policies that are no longer inforce for both home and auto and either indicator is Yes */																
CASE 
WHEN AUTO_EFF_DT <= '2024-09-01' AND FUTURE_IND = 0 THEN 0 -- Fixes flags for bucket analysis
WHEN AUTO_STATUS = 'InForce'																
AND ((HOME_STATUS = 'InForce' AND (AUTO_ACCT_CR_IND = 'N' OR HOME_ACCT_CR_IND = 'N')) OR (HOME_STATUS = 'Left' AND AUTO_ACCT_CR_IND = 'Y')) THEN 1							
WHEN (HOME_STATUS = 'InForce' AND AUTO_STATUS = 'Left' AND HOME_ACCT_CR_IND = 'Y') THEN 1 																
WHEN AUTO_STATUS = 'Left' AND HOME_STATUS = 'Left' AND (AUTO_ACCT_CR_IND = 'Y' OR HOME_ACCT_CR_IND = 'Y') THEN 1																
ELSE 0 END AS ACCT_ISSUE_IND																
FROM joined_table																
ORDER BY AUTO_EFF_DT																
)																
																
SELECT *																
FROM final_table