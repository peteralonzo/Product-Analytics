WITH data_source AS
(
SELECT ulm.*, 
aq.POL_ID,
ap.TERM_LATST_UBI_SCORE,
ap.TLMTC_POL_BUCKET_CD
FROM DSC_PLDS_DB.APP_AUTOMATA_PRD.PREVAIL_AUTO_ULM_QUOTE_POL_AGG_NB_QUALITY ulm
JOIN PRD_PL_DB.APP_DCPA_DM.AUTO_QUOTE_LATST_VW aq
USING (QCN)
JOIN DSC_PLBI_DB.APP_AUTO_PRD.AUTO_PERSISTENCY_NEWCO ap
ON aq.POL_ID = ap.POL_ID
WHERE ulm.trans_dt BETWEEN '2022-01-01' AND '2024-09-30' 
AND issue_ind = 'Y' 
AND cf_veh_telematic_ind = 'Y'
AND ap.POL_EFF_DT <= '2024-09-30'
QUALIFY ROW_NUMBER() OVER (PARTITION BY ap.POL_ID ORDER BY ap.POL_EFF_DT DESC) = 1
),

filter_ubi AS
(
SELECT * FROM data_source WHERE TERM_LATST_UBI_SCORE >= 1
),

state_agg AS
(
SELECT *, AVG(EXPECTED_LOSS_RATIO) OVER (PARTITION BY STATE) AS STATE_AVG
FROM filter_ubi
),

add_lrr AS
(
SELECT *, EXPECTED_LOSS_RATIO / STATE_AVG AS ROW_LRR
FROM state_agg
)

-- SELECT CASE
-- WHEN PNI_AGE < 50 THEN '<50'
-- WHEN PNI_AGE >= 50 AND PNI_AGE < 60 THEN '50-59'
-- WHEN PNI_AGE >= 60 AND PNI_AGE < 70 THEN '60-69'
-- WHEN PNI_AGE >= 70 AND PNI_AGE < 80 THEN '70-79'
-- WHEN PNI_AGE >= 80 THEN '80+'
-- END AS PNI_GRP,
-- COUNT(COMPL_QTE_IND) AS CNT,
-- AVG(ROW_LRR) AS LRR
-- FROM add_lrr
-- GROUP BY PNI_GRP
-- ORDER BY PNI_GRP

-- SELECT CASE 
-- WHEN CV_PLCY_CREDITVISION_CW = 0 OR CV_PLCY_CREDITVISION_CW >= 998 THEN 'NH/NS'
-- WHEN CV_PLCY_CREDITVISION_CW > 0 AND CV_PLCY_CREDITVISION_CW <= 504 THEN 'Decile 10'
-- WHEN CV_PLCY_CREDITVISION_CW > 504 AND CV_PLCY_CREDITVISION_CW <= 603 THEN 'Decile 09'
-- WHEN CV_PLCY_CREDITVISION_CW > 603 AND CV_PLCY_CREDITVISION_CW <= 670 THEN 'Decile 08'
-- WHEN CV_PLCY_CREDITVISION_CW > 670 AND CV_PLCY_CREDITVISION_CW <= 714 THEN 'Decile 07'
-- WHEN CV_PLCY_CREDITVISION_CW > 714 AND CV_PLCY_CREDITVISION_CW <= 744 THEN 'Decile 06'
-- WHEN CV_PLCY_CREDITVISION_CW > 744 AND CV_PLCY_CREDITVISION_CW <= 766 THEN 'Decile 05'
-- WHEN CV_PLCY_CREDITVISION_CW > 766 AND CV_PLCY_CREDITVISION_CW <= 785 THEN 'Decile 04'
-- WHEN CV_PLCY_CREDITVISION_CW > 785 AND CV_PLCY_CREDITVISION_CW <= 804 THEN 'Decile 03'
-- WHEN CV_PLCY_CREDITVISION_CW > 804 AND CV_PLCY_CREDITVISION_CW <= 825 THEN 'Decile 02'
-- WHEN CV_PLCY_CREDITVISION_CW > 825 AND CV_PLCY_CREDITVISION_CW < 998 THEN 'Decile 01'
-- END AS CV_DECILE,
-- COUNT(COMPL_QTE_IND) AS CNT,
-- AVG(ROW_LRR) AS LRR
-- FROM add_lrr
-- GROUP BY CV_DECILE
-- ORDER BY CV_DECILE

SELECT CASE 
WHEN TERM_LATST_UBI_SCORE < 1 THEN '0-0.99'
WHEN TERM_LATST_UBI_SCORE >= 1 AND TERM_LATST_UBI_SCORE < 10 THEN '1-9'
WHEN TERM_LATST_UBI_SCORE >= 10 AND TERM_LATST_UBI_SCORE < 20 THEN '10-19'
WHEN TERM_LATST_UBI_SCORE >= 20 AND TERM_LATST_UBI_SCORE < 30 THEN '20-29'
WHEN TERM_LATST_UBI_SCORE >= 30 AND TERM_LATST_UBI_SCORE < 40 THEN '30-39'
WHEN TERM_LATST_UBI_SCORE >= 40 AND TERM_LATST_UBI_SCORE < 50 THEN '40-49'
WHEN TERM_LATST_UBI_SCORE >= 50 AND TERM_LATST_UBI_SCORE < 60 THEN '50-59'
WHEN TERM_LATST_UBI_SCORE >= 60 AND TERM_LATST_UBI_SCORE < 70 THEN '60-69'
WHEN TERM_LATST_UBI_SCORE >= 70 AND TERM_LATST_UBI_SCORE < 80 THEN '70-79'
WHEN TERM_LATST_UBI_SCORE >= 80 AND TERM_LATST_UBI_SCORE < 90 THEN '80-89'
WHEN TERM_LATST_UBI_SCORE >= 90 THEN '90+' END AS UBI_SCORE,
COUNT(COMPL_QTE_IND) AS CNT,
AVG(ROW_LRR) AS LRR
FROM add_lrr
GROUP BY UBI_SCORE
ORDER BY UBI_SCORE

-- SELECT CASE 
-- WHEN TLMTC_POL_BUCKET_CD IN ('Full Participation', 'Partial Participation', 'Enrollment Window') THEN TLMTC_POL_BUCKET_CD
-- WHEN TLMTC_POL_BUCKET_CD = 'Issued with TrueLane but Never Activated' THEN 'Issued with TrueLane but not active'
-- WHEN TLMTC_POL_BUCKET_CD = 'Issued with TrueLane, Activated,Valid Score, but Unenrolled' THEN 'Issued with TrueLane but not active'
-- WHEN TLMTC_POL_BUCKET_CD = 'Issued with TrueLane, Activated,No Score, but Unenrolled' THEN 'Issued with TrueLane but not active'
-- ELSE 'Not Active'
-- END AS TLMTC_BUCKET_CD,
-- COUNT(*) AS CNT,
-- AVG(ROW_LRR) AS LRR
-- FROM add_lrr
-- GROUP BY TLMTC_BUCKET_CD
-- ORDER BY TLMTC_BUCKET_CD