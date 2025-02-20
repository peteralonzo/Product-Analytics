WITH data AS
(
SELECT A.*,
-- UW Pieces
B.MSG,
B.NB,
B.RW,
B.RENEW,
B.UW_RULE_TRIG_RSN_DESC,

--Critical Items
C.POL_NUM,                      -- Policy Number
C.CANCEL_FLAG,                  -- Policy Status
C.BU_ABBR,                      -- Business Unit
C.POL_FORM_CD,                  -- Policy Form Code
C.ORIG_POL_EFF_DT,              -- OPD

-- Betsy's Asks
C.POL_BI_LIAB_COV_LMT_RNG,      -- POL BI LIAB Cov Limit
C.PUP_IND,                      -- PUP Indicator
C.TELEMATICS_IND,               -- Telematics Indicator
C.CNT_OF_CAR + C.CNT_OF_SUV +
C.CNT_OF_LUXURY_SPORT + C.CNT_OF_PICKUP
+ C.CNT_OF_VAN_WAGON + C.CNT_OF_OTHER
AS VEH_CNT,                     -- # of Vehicles
C.ACTL_DRVR_CNT,                -- # of Drivers
C.PNI_AGE,                      -- Age of Drivers
C.INS_SCR_CD,                   -- Insurance Score
C.CLEAN_DIRTY_DESC,             -- Clean/Dirty
C.POL_TTL_CHRG_AFA_CNT,         -- Chargeable At Fault Accidents
C.POL_TTL_NCHRG_AFA_CNT,        -- Non-Chargeable At Fault Accidents
C.POL_TTL_VIO_CNT,              -- Number of Violations
C.LAPSE_IN_COV_NPI_IND_NB,      -- NPI Indicator
C.PCARR_YR_CNT,                 -- Years with Prior Carrier
C.YEARS_WITH_HIG                -- Years with HIG


FROM PRD_PL_DB.APP_DCPA_AUTO_CURATE.AUTO_POLICY_UNDERWRITER_RULE A
LEFT JOIN PRD_PL_DB.APP_PL_REF.AUTO_UNDERWRITING_RULES_DECLINE B
ON A.UW_REF_DECL_RULE_ID = B.RULE_ID
JOIN DSC_PLBI_DB.APP_AUTO_PRD.AUTO_PERSISTENCY_NEWCO C 
ON CAST(A.POL_ID AS VARCHAR) = CAST(C.POL_ID AS VARCHAR) AND A.POL_EFF_DT = C.POL_EFF_DT
)

SELECT *
FROM data
LIMIT 100000;