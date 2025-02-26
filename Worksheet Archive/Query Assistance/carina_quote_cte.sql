WITH home_quote as 
( 
SELECT * 
, ROW_NUMBER() OVER (PARTITION BY QCN ORDER BY date(QUOTE_TRANS_LST_CHNG_DT, 'YYYYMMDD') DESC) AS rn 
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."PLBI_HOME_QUOTE_FLOW_VW" 
),

qcn_agg AS
(
SELECT QCN, MAX(resp_ind_cnt) AS resp_ind_cnt, MAX(iss_ind_cnt) AS iss_ind_cnt
FROM "DSC_PLBI_DB"."APP_HOME_PRD"."PLBI_HOME_QUOTE_FLOW_VW"
GROUP BY QCN
),

carina AS
(
SELECT QCN
        , CONCAT(PROD_RO_CD, POL_SYM_CD, POL_NUM) as POL_ID
        , AARP_MEMBER_IND 
        , date(QUOTE_TRANS_LST_CHNG_DT, 'YYYYMMDD') as QUOTE_LAST_TRANSACTION_DT
        , date(ORIG_QTE_DT_PK_ID, 'YYYYMMDD') as ORIG_QUOTE_DT
        , ORIG_TRANS_SUBMISS_METHOD_CD
        , LAST_TRANS_SUBMISS_METHOD_CD
        , date(POL_EFF_DT, 'YYYYMMDD') AS POL_EFF_DT      
        , ISSUE_DT
        , ISSUE_PREM_AMT
        , QTE_PREM_AMT
        , LOCATION_ID
        , PROD_AGNCY_ID
        , MASTER_AGCY_CD
        , E_AGENT_IND
        , SALES_REP_FULL_NM
        , SALES_REP_MGR_FULL_NM
        , POL_FORM_CD
        , ACCT_CR_IND 
        , DWELLING_LOC_ZIP_CD
        , INS_SCORE_CD 
        , DECLINE_PUP_CNT
        , date(LAST_TRANS_DT_PK_ID, 'YYYYMMDD') as last_trans_dt
        , RATE_PLAN_CD
        , RISK_ST_ABBR as QUOTE_RISK_ST
        , COV_A_AMT
        , COV_B_AMT
        , COV_C_AMT
        , COV_E_AMT
        , COV_F_AMT
        , INS_SCR_DECILE_INFORCE_CW
        , INS_SCR_DECILE_INFORCE_ST
        , INS_SCR_DECILE_QUOTE_CW
        , INS_SCR_DECILE_QUOTE_ST 
    FROM home_quote
where BUS_UNIT_ABBR = 'AGCY' AND QUOTE_TRANS_LST_CHNG_DT >= '20230101' AND rn = 1
),

a AS
(
    SELECT carina.*, qcn_agg.resp_ind_cnt, qcn_agg.iss_ind_cnt
    FROM carina JOIN qcn_agg ON carina.QCN = qcn_agg.QCN
),

b as 
(SELECT 
        QCN
        , LOB 
        , MASTER_AGENCY_NAME
        , SUCCESS_IND
        , CARRIERSSELECTED
        , CARRIERSQUOTED
        , HIGHPREMIUM
        , LOWPREMIUM
        , MEDIAN_PREMIUM
        , MEDIAN_PREMIUM_XHIG
        , AVGPREMIUM
        , AVG_PREMIUM_XHIG
        , HIG_PREMIUM
        , ANNUALIZEDPREMIUM
        , HIG_RANK
        , WIN_IND
        , COMPETITIVE_IND
        , BRIDGED_IND_CNT
        , COMP_QTE_IND_CNT
        , DECLINE_IND_CNT
        , ERROR_IND_CNT
        , DATA_VALIDATION_IND_CNT
        , UW_REFER_IND_CNT
        , FAILURE_IND
        , WIN_BRIDGED_IND_CNT
        , COMPETITIVE_COMP_QTE_IND_CNT
        , COMPETITIVE_BRIDGED_IND_CNT
        , COMPETITIVE_ISS_IND_CNT
        , POLICY_ID
        , FRST_RATING_TERR_CD
        , LATST_RATING_TERR_CD
        , TERM_WRIT_PREM
        , BILL_PYMNT_METH_DESC
        , frst_ins_score_cd
        , latst_ins_score_cd
        , SQ_FT_GRP
        , TOTAL_AREA_SQUARE_FEET_CNT
        , DIST_TO_COAST_GRP
        , FIRELINE_SCORE_CD
        , DWELLING_AGE
        , YEAR_BUILT
        , ROOF_AGE
        , ROOF_COMPL_YR
    FROM "DSC_PLBI_DB"."APP_AGCY_PRD"."AGCY_COMP_RATER_HOME_QTE_VW"
),

c as 
(
SELECT 
        CONCAT(PROD_RO_CD, POL_SYM_CD, POL_NUM) as POLICY_ID
        , POL_EFF_DT
        , CANCEL_E_FLAT
        , CANCEL_E_180
        , CANCEL_E_365
        , ATR_E_FLAT
        , ATR_E_180
        , ATR_E_365
        , CANC_EFF_DT
        , POL_CNT
        , RISK_STATE as POL_RISK_ST
        , POL_NEW_RNW_CD
        , REWRITE_IND
        , PREV_POL_ID
        from "DSC_PLBI_DB"."APP_HOME_PRD"."HOME_PERSISTENCY_NOWCO" 
        qualify Min(POL_PRD_ID) over( partition by POLICY_ID ) = POL_PRD_ID 
)
SELECT
    a.QCN
    , a.POL_ID
    , a.AARP_MEMBER_IND
    , a.ORIG_QUOTE_DT
    , a.QUOTE_LAST_TRANSACTION_DT
    , a.ORIG_TRANS_SUBMISS_METHOD_CD
    , a.LAST_TRANS_SUBMISS_METHOD_CD
    , a.POL_EFF_DT
    , a.resp_ind_cnt
    , a.iss_ind_cnt
    , a.ISSUE_DT
    , a.ISSUE_PREM_AMT
    , a.QTE_PREM_AMT
    , a.PROD_AGNCY_ID 
    , a.MASTER_AGCY_CD
    , a.E_AGENT_IND
    , a.LOCATION_ID
    , a.SALES_REP_FULL_NM
    , a.SALES_REP_MGR_FULL_NM
    , a.POL_FORM_CD
    , a.ACCT_CR_IND 
    , a.DWELLING_LOC_ZIP_CD
    , a.INS_SCORE_CD
    , a.DECLINE_PUP_CNT
    , a.last_trans_dt
    , a.RATE_PLAN_CD
    , a.QUOTE_RISK_ST
    , a.COV_A_AMT
    , a.COV_B_AMT
    , a.COV_C_AMT
    , a.COV_E_AMT
    , a.COV_F_AMT
    , a.INS_SCR_DECILE_INFORCE_CW
    , a.INS_SCR_DECILE_INFORCE_ST
    , a.INS_SCR_DECILE_QUOTE_CW
    , a.INS_SCR_DECILE_QUOTE_ST
    , b.SUCCESS_IND
    , b.CARRIERSSELECTED
    , b.CARRIERSQUOTED
    , b.HIGHPREMIUM
    , b.LOWPREMIUM
    , b.MEDIAN_PREMIUM
    , b.MEDIAN_PREMIUM_XHIG
    , b.AVGPREMIUM
    , b.AVG_PREMIUM_XHIG
    , b.HIG_PREMIUM
    , b.ANNUALIZEDPREMIUM
    , b.HIG_RANK
    , b.WIN_IND
    , b.COMPETITIVE_IND
    , b.BRIDGED_IND_CNT
    , b.COMP_QTE_IND_CNT
    , b.DECLINE_IND_CNT
    , b.ERROR_IND_CNT
    , b.DATA_VALIDATION_IND_CNT
    , b.UW_REFER_IND_CNT
    , b.FAILURE_IND
    , b.WIN_BRIDGED_IND_CNT
    , b.COMPETITIVE_COMP_QTE_IND_CNT
    , b.COMPETITIVE_BRIDGED_IND_CNT
    , b.COMPETITIVE_ISS_IND_CNT
    , b.FRST_RATING_TERR_CD
    , b.LATST_RATING_TERR_CD
    , b.TERM_WRIT_PREM
    , b.BILL_PYMNT_METH_DESC
    , b.frst_ins_score_cd
    , b.latst_ins_score_cd
    , b.SQ_FT_GRP
    , b.TOTAL_AREA_SQUARE_FEET_CNT
    , b.DIST_TO_COAST_GRP
    , b.FIRELINE_SCORE_CD
    , b.DWELLING_AGE
    , b.YEAR_BUILT
    , b.ROOF_AGE
    , b.ROOF_COMPL_YR
    , c.CANCEL_E_FLAT
    , c.CANCEL_E_180
    , c.CANCEL_E_365
    , c.ATR_E_FLAT
    , c.ATR_E_180
    , c.ATR_E_365
    , c.CANC_EFF_DT
    , c.POL_CNT
    , c.POL_RISK_ST
    , c.POL_NEW_RNW_CD
    , c.REWRITE_IND
    , c.PREV_POL_ID
    , case when a.POL_ID = c.POLICY_ID then 1 
            else 0 
            end as pol_cnt_issue_match
FROM a 
LEFT JOIN b
ON a.QCN = b.QCN 
LEFT JOIN c
ON a.POL_ID = c.POLICY_ID