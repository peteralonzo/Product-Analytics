WITH b AS
(
    SELECT QCN, trans_rsn_desc, trans_dt
    FROM PRD_PL_DB.APP_DCPA_DM.AUTO_POLICY_TRANS_REASON_TNSACTNS_VW
),

a AS
(  
    SELECT
    QCN,
    trans_typ_desc,
    trans_stat_desc,
    trans_id,
    ORIG_POL_EFF_DT,
    POL_EFF_DT,
    POL_ID,
    risk_st_abbr,
    trans_dt,
    canc_eff_dt,
    cntct_meth_cd,
    clean_dirty_cd,
    pol_bi_pers_lmt_cd,
    pol_bi_occur_lmt_cd
    FROM PRD_PL_DB.APP_DCPA_AUTO_CURATE.AUTO_POLICY
    QUALIFY MAX(VERSION_ID) OVER (PARTITION BY QCN, TRANS_DT) = VERSION_ID
),

joined AS
(
    SELECT
    a.QCN,
    a.trans_typ_desc,
    a.trans_id,
    a.ORIG_POL_EFF_DT,
    a.POL_EFF_DT,
    a.POL_ID,
    a.risk_st_abbr,
    a.trans_dt AS REINSTATEMENT_PROCESSING_DT,
    a.canc_eff_dt,
    a.cntct_meth_cd,
    a.clean_dirty_cd,
    a.pol_bi_pers_lmt_cd,
    a.pol_bi_occur_lmt_cd,
    b.trans_rsn_desc,
    FROM a
    JOIN b ON a.QCN = b.QCN AND a.TRANS_DT = b.TRANS_DT
    WHERE DATEDIFF(YEAR, a.ORIG_POL_EFF_DT, REINSTATEMENT_PROCESSING_DT) <= 1
    AND REINSTATEMENT_PROCESSING_DT >= '2024-12-01'
    AND a.TRANS_STAT_DESC = 'Committed'
),

lag_functions AS
(
    SELECT *,
    LAG(TRANS_TYP_DESC) OVER (PARTITION BY QCN ORDER BY REINSTATEMENT_PROCESSING_DT) AS CANCEL_CHECK,
    LAG(TRANS_RSN_DESC) OVER (PARTITION BY QCN ORDER BY REINSTATEMENT_PROCESSING_DT) AS NON_PYMT_CHECK,
    LAG(CANC_EFF_DT) OVER (PARTITION BY QCN ORDER BY REINSTATEMENT_PROCESSING_DT) AS LAST_CANCELATION_DT
    FROM joined
    ORDER BY QCN, REINSTATEMENT_PROCESSING_DT
)

SELECT *
FROM lag_functions
WHERE TRANS_TYP_DESC = 'Reinstate'
AND CANCEL_CHECK = 'Cancel'
AND NON_PYMT_CHECK = 'Non-Payment'