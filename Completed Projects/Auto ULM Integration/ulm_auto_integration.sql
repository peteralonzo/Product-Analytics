-- Query for implementing Carsten's logic in adding ULM metrics to Op Loss
SELECT 
POL_ID,                     -- Grain Level #1: Policy ID
POL_PRD_ID,                 -- Grain Level #2: Policy Period ID 
COV_TYPE_ABBR,              -- Grain Level #3: Coverage Type
EARNED_MONTH,               -- Grain Level #4: Earned Month
DERIV_ADJ_EP_EXPSR_MO_CNT,  -- Shows EE for a given row in Op Loss
SUM(DERIV_ADJ_EP_EXPSR_MO_CNT) OVER (PARTITION BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR) AS TTL_COV_EE, -- Total EE for a given policy period id and cov type
-- Calculates EE of a given row as a percentage, which will be used to adjust ULM scores to a finer grain
DERIV_ADJ_EP_EXPSR_MO_CNT / NULLIFZERO(SUM(DERIV_ADJ_EP_EXPSR_MO_CNT) OVER (PARTITION BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR)) AS EE_PERCENT,
-- Mapping for breaking down ULM metrics by coverage for a particular policy period id
CASE WHEN COV_TYPE_ABBR = 'BI'      
    THEN EE_PERCENT * ADJ_BI_PP_PRED * BI_EXPOSURE ELSE 0 END AS ADJ_BI_PP,                     -- Adjusted BI Pure Premium (fraction of total BI PP)
CASE WHEN COV_TYPE_ABBR = 'COLL'    
    THEN EE_PERCENT * ADJ_COLL_PP_PRED * COLL_EXPOSURE ELSE 0 END AS ADJ_COLL_PP,               -- Adjusted COLL Pure Premium (fraction of total COLL PP)
CASE WHEN COV_TYPE_ABBR = 'COMP'    
    THEN EE_PERCENT * ADJ_COMP_PP_PRED * COMP_EXPOSURE ELSE 0 END AS ADJ_COMP_PP,               -- Adjusted COMP Pure Premium (fraction of total COMP PP)
CASE WHEN COV_TYPE_ABBR = 'MED'     
    THEN EE_PERCENT * ADJ_MP_PP_PRED * MP_EXPOSURE ELSE 0 END AS ADJ_MP_PP,                     -- Adjusted MED Pure Premium (fraction of total MED PP)
CASE WHEN COV_TYPE_ABBR = 'PD'      
    THEN EE_PERCENT * ADJ_PD_PP_PRED * PD_EXPOSURE ELSE 0 END AS ADJ_PD_PP,                     -- Adjusted PD Pure Premium (fraction of total PD PP)
CASE WHEN COV_TYPE_ABBR = 'PIP'     
    THEN EE_PERCENT * ADJ_PIP_PP_PRED * PIP_EXPOSURE ELSE 0 END AS ADJ_PIP_PP,                  -- Adjusted PIP Pure Premium (fraction of total PIP PP)
CASE WHEN COV_TYPE_ABBR = 'UMBI'      
    THEN EE_PERCENT * ADJ_UM_PP_PRED * UM_EXPOSURE ELSE 0 END AS ADJ_UM_PP,                     -- Adjusted UM Pure Premium (fraction of total UM PP)
(ADJ_BI_PP + ADJ_COLL_PP + ADJ_COMP_PP + ADJ_MP_PP + ADJ_PD_PP + ADJ_PIP_PP + ADJ_UM_PP) AS ADJ_TTL_PP, -- Adjusted TTL Pure Premium (fraction of total PP)
ULM_AUTO.ADJ_BI_PP_PRED,                    -- Used for testing BI Pure Premium value
ULM_AUTO.ADJ_COLL_PP_PRED,                  -- Used for testing COLL Pure Premium value
ULM_AUTO.ADJ_COMP_PP_PRED,                  -- Used for testing COMP Pure Premium value
ULM_AUTO.ADJ_MP_PP_PRED,                    -- Used for testing MP Pure Premium value                                             
ULM_AUTO.ADJ_PD_PP_PRED,                    -- Used for testing PD Pure Premium value                                                    
ULM_AUTO.ADJ_PIP_PP_PRED,                   -- Used for testing PIP Pure Premium value                                             
ULM_AUTO.ADJ_UM_PP_PRED,                    -- Used for testing UM Pure Premium value                                                     
ULM_AUTO.ADJ_TTL_PP_PRED                    -- Used for testing TTL Pure Premium value
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_OPERATIONAL_LOSS" AS AUTO_OP_LOSS
JOIN "DSC_PLDS_DB"."APP_AUTOMATA_PRD"."PREVAIL_AUTO_ULM_POL_PRD_AGG_VW" AS ULM_AUTO
ON AUTO_OP_LOSS.POL_PRD_ID = ULM_AUTO.CV_PLCY_PERIOD_ID
ORDER BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR, EARNED_MONTH
LIMIT 500

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Personal test table that tests Auto Op Loss Integration
CREATE OR REPLACE TRANSIENT TABLE USER_DB.AD1_PA08042.AUTO_TEST
(
POL_ID VARCHAR,
POL_PRD_ID VARCHAR,
COV_TYPE_ABBR VARCHAR,
EARNED_MONTH VARCHAR,
DERIV_ADJ_EP_EXPSR_MO_CNT NUMBER(38,4)
)

-- Inserts policies into test table that are guaranteed to have ULM metrics
INSERT INTO USER_DB.AD1_PA08042.AUTO_TEST
(POL_ID, POL_PRD_ID, COV_TYPE_ABBR, EARNED_MONTH, DERIV_ADJ_EP_EXPSR_MO_CNT)
SELECT POL_ID, POL_PRD_ID, COV_TYPE_ABBR, EARNED_MONTH, DERIV_ADJ_EP_EXPSR_MO_CNT
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_OPERATIONAL_LOSS"
JOIN "DSC_PLDS_DB"."APP_AUTOMATA_PRD"."PREVAIL_AUTO_ULM_POL_PRD_AGG_VW"
ON POL_PRD_ID = CV_PLCY_PERIOD_ID
WHERE POL_PRD_ID IS NOT NULL
ORDER BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR, EARNED_MONTH
LIMIT 50000

-- Used to see the contents of the test table
SELECT * FROM USER_DB.AD1_PA08042.AUTO_TEST
ORDER BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR, EARNED_MONTH;

-- Drops test table if necessary
DROP TABLE USER_DB.AD1_PA08042.AUTO_TEST

-- Adds new columns to test table
ALTER TABLE USER_DB.AD1_PA08042.AUTO_TEST ADD COLUMN
ADJ_BI_PP FLOAT DEFAULT 0,
ADJ_COLL_PP FLOAT DEFAULT 0,
ADJ_COMP_PP FLOAT DEFAULT 0,
ADJ_MP_PP FLOAT DEFAULT 0,
ADJ_PD_PP FLOAT DEFAULT 0,
ADJ_PIP_PP FLOAT DEFAULT 0,
ADJ_UM_PP FLOAT DEFAULT 0,
ADJ_TTL_PP FLOAT DEFAULT 0;

-- Update statement for populating new columns in test table
UPDATE USER_DB.AD1_PA08042.AUTO_TEST AS A_TEST SET
A_TEST.ADJ_BI_PP = cte.ADJ_BI_CTE,
A_TEST.ADJ_COLL_PP = cte.ADJ_COLL_CTE,
A_TEST.ADJ_COMP_PP = cte.ADJ_COMP_CTE,
A_TEST.ADJ_MP_PP = cte.ADJ_MP_CTE,
A_TEST.ADJ_PD_PP = cte.ADJ_PD_CTE,
A_TEST.ADJ_PIP_PP = cte.ADJ_PIP_CTE,
A_TEST.ADJ_UM_PP = cte.ADJ_UM_CTE,
A_TEST.ADJ_TTL_PP = cte.ADJ_TTL_CTE
FROM
(
SELECT 
POL_ID,                  
POL_PRD_ID,               
COV_TYPE_ABBR,              
EARNED_MONTH,
DERIV_ADJ_EP_EXPSR_MO_CNT,  -- Shows EE for a given row in Op Loss
SUM(DERIV_ADJ_EP_EXPSR_MO_CNT) OVER (PARTITION BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR) AS TTL_COV_EE, -- Total EE for a given policy period id and cov type
-- Calculates EE of a given row as a percentage, which will be used to adjust ULM scores to a finer grain
DERIV_ADJ_EP_EXPSR_MO_CNT / NULLIFZERO(SUM(DERIV_ADJ_EP_EXPSR_MO_CNT) OVER (PARTITION BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR)) AS EE_PERCENT,
-- Mapping for breaking down ULM metrics by coverage for a particular policy period id
CASE WHEN COV_TYPE_ABBR = 'BI'      
    THEN EE_PERCENT * ADJ_BI_PP_PRED * BI_EXPOSURE ELSE 0 END AS ADJ_BI_CTE,
CASE WHEN COV_TYPE_ABBR = 'COLL'    
    THEN EE_PERCENT * ADJ_COLL_PP_PRED * COLL_EXPOSURE ELSE 0 END AS ADJ_COLL_CTE,
CASE WHEN COV_TYPE_ABBR = 'COMP'    
    THEN EE_PERCENT * ADJ_COMP_PP_PRED * COMP_EXPOSURE ELSE 0 END AS ADJ_COMP_CTE,             
CASE WHEN COV_TYPE_ABBR = 'MED'     
    THEN EE_PERCENT * ADJ_MP_PP_PRED * MP_EXPOSURE ELSE 0 END AS ADJ_MP_CTE,                 
CASE WHEN COV_TYPE_ABBR = 'PD'      
    THEN EE_PERCENT * ADJ_PD_PP_PRED * PD_EXPOSURE ELSE 0 END AS ADJ_PD_CTE,                   
CASE WHEN COV_TYPE_ABBR = 'PIP'     
    THEN EE_PERCENT * ADJ_PIP_PP_PRED * PIP_EXPOSURE ELSE 0 END AS ADJ_PIP_CTE,                
CASE WHEN COV_TYPE_ABBR = 'UMBI'      
    THEN EE_PERCENT * ADJ_UM_PP_PRED * UM_EXPOSURE ELSE 0 END AS ADJ_UM_CTE,                
(ADJ_BI_CTE + ADJ_COLL_CTE + ADJ_COMP_CTE + ADJ_MP_CTE + ADJ_PD_CTE + ADJ_PIP_CTE + ADJ_UM_CTE) AS ADJ_TTL_CTE
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_OPERATIONAL_LOSS" AS AUTO_OP_LOSS
JOIN "DSC_PLDS_DB"."APP_AUTOMATA_PRD"."PREVAIL_AUTO_ULM_POL_PRD_AGG_VW" AS ULM_AUTO
ON AUTO_OP_LOSS.POL_PRD_ID = ULM_AUTO.CV_PLCY_PERIOD_ID
WHERE POL_PRD_ID IS NOT NULL
ORDER BY POL_ID, POL_PRD_ID, COV_TYPE_ABBR, EARNED_MONTH
)
AS cte
WHERE A_TEST.POL_ID = cte.POL_ID 
AND ZEROIFNULL(A_TEST.POL_PRD_ID) = ZEROIFNULL(cte.POL_PRD_ID) --ZEROISNULL is used because auto op loss dataset has some missing policy period IDs
AND A_TEST.COV_TYPE_ABBR = cte.COV_TYPE_ABBR 
AND A_TEST.EARNED_MONTH = cte.EARNED_MONTH