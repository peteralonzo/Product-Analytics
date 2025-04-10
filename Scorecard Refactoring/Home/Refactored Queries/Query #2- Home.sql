WITH state_e_30 AS -- State E+30 Persistency
(
	SELECT CONCAT(RISK_STATE, 'E+30 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_30 = 1
	GROUP BY Key
),

state_e_60 AS -- State E+60 Persistency
(
	SELECT CONCAT(RISK_STATE, 'E+60 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_60 = 1
	GROUP BY Key
),

state_e_90 AS -- State E+90 Persistency
(
	SELECT CONCAT(RISK_STATE, 'E+90 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_90 = 1
	GROUP BY Key
),

state_e_30_form_cd AS -- State Form Code E+30 Persistency
(
	SELECT CONCAT(RISK_STATE, 'E+30 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_30 = 1
	GROUP BY Key
),

state_e_60_form_cd AS -- State Form Code E+60 Persistency
(
	SELECT CONCAT(RISK_STATE, 'E+60 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_60 = 1
	GROUP BY Key
),

state_e_90_form_cd AS -- State Form Code E+90 Persistency
(
	SELECT CONCAT(RISK_STATE, 'E+90 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_90 = 1
	GROUP BY Key
),

cw_e_30 AS -- CW E+30 Persistency
(
	SELECT CONCAT('CW', 'E+30 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_30 = 1
	GROUP BY Key
),

cw_e_60 AS -- CW E+60 Persistency
(
	SELECT CONCAT('CW', 'E+60 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_60 = 1
	GROUP BY Key
),

cw_e_90 AS -- CW E+90 Persistency
(
	SELECT CONCAT('CW', 'E+90 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_90 = 1
	GROUP BY Key
),

cw_e_30_form_cd AS -- CW Form Code E+30 Persistency
(
	SELECT CONCAT('CW', 'E+30 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_30 = 1
	GROUP BY Key
),

cw_e_60_form_cd AS -- CW Form Code E+60 Persistency
(
	SELECT CONCAT('CW', 'E+60 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_60 = 1
	GROUP BY Key
),

cw_e_90_form_cd AS -- CW Form Code E+90 Persistency
(
	SELECT CONCAT('CW', 'E+90 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_90 = 1
	GROUP BY Key
),

region_e_30 AS -- Regional E+30 Persistency
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE), 'E+30 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_30 = 1
	GROUP BY Key
),

region_e_60 AS -- Regional E+60 Persistency
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE), 'E+60 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_60 = 1
	GROUP BY Key
),

region_e_90 AS -- Regional E+90 Persistency
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE), 'E+90 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,'Total') as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_90 = 1
	GROUP BY Key
),

region_e_30_form_cd AS -- Regional Form Code E+30 Persistency
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE), 'E+30 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_30, ATR_E_30) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_30 = 1
	GROUP BY Key
),

region_e_60_form_cd AS -- Regional Form Code E+60 Persistency
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE), 'E+60 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_60, ATR_E_60) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_60 = 1
	GROUP BY Key
),

region_e_90_form_cd AS -- Regional Form Code E+90 Persistency
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE), 'E+90 NB', BUS_UNIT_ABBR, CASE WHEN NEWCO_INDICATOR='Y' THEN 'Newco' ELSE 'nowco' END,
	(CASE WHEN POL_FORM_CD IN ('HO3','HO5','3','5','HO7') THEN 'Bldg'
		  WHEN POL_FORM_CD IN ('HO4','HO6','4','6') THEN 'T/C'
		  ELSE 'Other' END)) as Key,
	perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "18",
	perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "17",
	perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "16",
	perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "15",
	perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "14",
	perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "13",
	perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "12",
	perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "11",
	perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "10",
	perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "9",
	perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "8",
	perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "7",
	perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "6",
	perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "5",
	perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "4",
	perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "3",
	perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "2",
	perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "1",
	perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_90, ATR_E_90) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01'
	AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'HOME' AND ATR_E_90 = 1
	GROUP BY Key
)

SELECT * FROM
(
	SELECT * FROM state_e_30
	UNION ALL
	SELECT * FROM state_e_60
	UNION ALL
	SELECT * FROM state_e_90
	UNION ALL
	SELECT * FROM state_e_30_form_cd
	UNION ALL
	SELECT * FROM state_e_60_form_cd
	UNION ALL
	SELECT * FROM state_e_90_form_cd
	UNION ALL
	SELECT * FROM cw_e_30
	UNION ALL
	SELECT * FROM cw_e_60
	UNION ALL
	SELECT * FROM cw_e_90
	UNION ALL
	SELECT * FROM cw_e_30_form_cd
	UNION ALL
	SELECT * FROM cw_e_60_form_cd
	UNION ALL
	SELECT * FROM cw_e_90_form_cd
	UNION ALL
	SELECT * FROM region_e_30
	UNION ALL
	SELECT * FROM region_e_60
	UNION ALL
	SELECT * FROM region_e_90
	UNION ALL
	SELECT * FROM region_e_30_form_cd
	UNION ALL
	SELECT * FROM region_e_60_form_cd
	UNION ALL
	SELECT * FROM region_e_90_form_cd
)
ORDER BY KEY