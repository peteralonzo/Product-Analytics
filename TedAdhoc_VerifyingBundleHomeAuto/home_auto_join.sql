-- Note: The TED_STARTER table was created from the csv file in this folder
-- Some column names may need to be updated when trying to convert the csv file to a Snowflake table

WITH full_join AS
(
SELECT 
CASE WHEN TED.POL_ACCT_CR_IND = 0 THEN 'N' ELSE 'Y' END AS ACCT_CR_IND,     -- Converts binary flag to Y/N flag
TED.POL_ID AS AUTO_POL_ID,                                                  -- Displays Auto PolicyID from Ted's dataset
AUTO_Q.POL_ID AS QUOTE_AUTO_POL_ID,                                         -- Verifies Auto PolicyID match from Auto Quote Flow
AUTO_Q.QCN AS QUOTE_AUTO_QCN,                                               -- Displays Auto QCN from Auto Quote Flow
CROSSWALK.AUTO_QCN AS CW_AUTO_QCN,                                          -- Verifies Auto QCN match from Crosswalk table
CROSSWALK.HOME_QCN AS CW_HOME_QCN,                                          -- Displays Home QCN from Crosswalk table
HOME_Q.QCN AS QUOTE_HOME_QCN,                                               -- Verifies Home QCN match from Home Quote Flow
HOME_Q.POL_ID AS QUOTE_HOME_POL_ID                                          -- Displays Home PolicyID from Home Quote Flow
FROM USER_DB.AD1_PA08042.TED_STARTER AS TED                                 -- Table in my personal schema made from Ted's excel file
JOIN "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" AS AUTO_Q              -- Auto Quote Flow table
ON TED.POL_ID = AUTO_Q.POL_ID
JOIN "DSC_PLBI_DB"."APP_AUTO_PRD"."PLBI_PARTY_LINKING_VW" AS CROSSWALK      -- Crosswalk table that links home and auto qcn's
ON AUTO_Q.QCN = CROSSWALK.AUTO_QCN
JOIN "PRD_PL_DB"."APP_DCPA_DM"."PROP_QUOTE_DWELL_LATST_VW" AS HOME_Q        -- Home Quote Flow table
ON CROSSWALK.HOME_QCN = HOME_Q.QCN
)
SELECT full_join.QUOTE_AUTO_POL_ID AS AUTO_POL_ID,                          -- Grabs Auto PolicyID
full_join.QUOTE_HOME_POL_ID AS HOME_POL_ID,                                 -- Grabs Home PolicyID
HOME_MIF.POL_EFF_DT,                                                        -- Grabs Pol Eff Dt for entry in MIF
HOME_MIF.ACCT_CR_IND AS HOME_ACCT_CR_IND,                                   -- Account Credit Indicator on Home side (indicates bundle discount)
full_join.ACCT_CR_IND AS AUTO_ACCT_CR_IND                                   -- Account Credit Indicator on Auto side (indicates bundle discount)
FROM full_join 
JOIN "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_INFORCE_MONTHEND" AS HOME_MIF       -- Table for tracking home policies still inforce
ON full_join.QUOTE_HOME_POL_ID = HOME_MIF.POLICY_ID
WHERE TRY_TO_DECIMAL(HOME_MIF.POLICY_ID) IS NOT NULL 
AND ME_DT = '2024-09-30'                                                    -- Grabs the most recent record in home month end inforce