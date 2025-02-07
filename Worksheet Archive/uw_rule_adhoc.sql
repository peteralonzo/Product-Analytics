SELECT A.*, 
B.RULE, RULE_TYPE,

--Critical Items
C.POL_NUM,                      -- Policy Number
C.CANCEL_FLAG,                  -- Policy Status
C.BU_ABBR,                      -- Business Unit
C.POL_FORM_CD,                  -- Policy Form Code
C.FORM,                         -- Form #
C.ORIG_POL_EFF_DT,              -- OPD
C.COV_A_LMT,                    -- Coverage A

-- Nice to Have
C.PROP_ROOF_AGE,                -- Roof Age
C.ROOF_ARCHTCT_GEOM_TYP_DESC,   -- Roof Shape
C.YEAR_BUILT,                   -- Year Built
C.ACCT_CR_IND,                  -- Account Business (credit)
C.DOG_ON_PREMIS_IND,            -- Dog
C.SWIMMING_POOL_IND,            -- Pool
C.FIRELINE_SCORE_CD             -- Fireline

FROM PRD_PL_DB.APP_DCPA_PROP_CURATE.PROP_POLICY_UNDERWRITER_RULE A
LEFT JOIN PRD_PL_DB.APP_PL_REF.HOME_UNDERWRITING_RULES_DECLINE B 
ON A.UW_REF_DECL_RULE_ID = B.RULE_ID
JOIN DSC_PLBI_DB.APP_HOME_PRD.HOME_PERSISTENCY_COMBINED C 
ON CAST(A.POL_ID AS VARCHAR) = CAST(C.POL_ID AS VARCHAR) AND A.POL_EFF_DT = C.POL_EFF_DT