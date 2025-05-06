WITH state_aq_response AS -- State Response Count for Auto Quote
(
	SELECT CONCAT('Response','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, RESP_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, RESP_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, RESP_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, RESP_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, RESP_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, RESP_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, RESP_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, RESP_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, RESP_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, RESP_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, RESP_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, RESP_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, RESP_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, RESP_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, RESP_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, RESP_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, RESP_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, RESP_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, RESP_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	GROUP BY Key
),

region_aq_response AS -- Regional Response Count for Auto Quote
(
	SELECT CONCAT('Response','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, RESP_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, RESP_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, RESP_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, RESP_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, RESP_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, RESP_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, RESP_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, RESP_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, RESP_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, RESP_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, RESP_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, RESP_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, RESP_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, RESP_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, RESP_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, RESP_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, RESP_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, RESP_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, RESP_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	GROUP BY Key
),

cw_aq_response AS -- CW Response Count for Auto Quote
(
	SELECT CONCAT('Response','NewCo','CW',BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, RESP_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, RESP_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, RESP_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, RESP_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, RESP_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, RESP_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, RESP_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, RESP_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, RESP_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, RESP_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, RESP_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, RESP_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, RESP_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, RESP_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, RESP_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, RESP_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, RESP_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, RESP_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, RESP_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	GROUP BY Key
),

state_scdi_response AS -- State Response Count for Auto SCDI
(
	SELECT CONCAT('Response','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN RESPONSE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT'
	GROUP BY Key
),

region_scdi_response AS -- Regional Response Count for Auto SCDI
(
	SELECT CONCAT('Response','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN RESPONSE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT'
	GROUP BY Key
),

cw_scdi_response AS -- CW Response Count for Auto SCDI
(
	SELECT CONCAT('Response','NowCo','CW',BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN RESPONSE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT'
	GROUP BY Key
),

state_aq_phone AS -- State Phone Response Count for Auto Quote
(
	SELECT CONCAT('Phone Response','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, RESP_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, RESP_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, RESP_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, RESP_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, RESP_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, RESP_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, RESP_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, RESP_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, RESP_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, RESP_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, RESP_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, RESP_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, RESP_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, RESP_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, RESP_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, RESP_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, RESP_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, RESP_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, RESP_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

region_aq_phone AS -- Regional Phone Response Count for Auto Quote
(
	SELECT CONCAT('Phone Response','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, RESP_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, RESP_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, RESP_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, RESP_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, RESP_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, RESP_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, RESP_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, RESP_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, RESP_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, RESP_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, RESP_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, RESP_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, RESP_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, RESP_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, RESP_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, RESP_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, RESP_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, RESP_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, RESP_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

cw_aq_phone AS -- CW Phone Response Count for Auto Quote
(
	SELECT CONCAT('Phone Response','NewCo','CW',BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, RESP_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, RESP_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, RESP_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, RESP_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, RESP_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, RESP_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, RESP_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, RESP_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, RESP_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, RESP_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, RESP_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, RESP_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, RESP_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, RESP_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, RESP_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, RESP_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, RESP_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, RESP_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, RESP_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

state_scdi_phone AS -- State Phone Response Count for Auto SCDI
(
	SELECT CONCAT('Phone Response','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN RESPONSE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

region_scdi_phone AS -- Regional Phone Response Count for Auto SCDI
(
	SELECT CONCAT('Phone Response','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN RESPONSE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

cw_scdi_phone AS -- CW Phone Response Count for Auto SCDI
(
	SELECT CONCAT('Phone Response','NowCo','CW',BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, RESPONSE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN RESPONSE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

state_aq_phone_cq AS -- State Phone Completed Quote Count for Auto Quote
(
	SELECT CONCAT('Phone Completed Quote','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN COMPL_QTE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

region_aq_phone_cq AS -- Regional Phone Completed Quote Count for Auto Quote
(
	SELECT CONCAT('Phone Completed Quote','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN COMPL_QTE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

cw_aq_phone_cq AS -- CW Phone Completed Quote Count for Auto Quote
(
	SELECT CONCAT('Phone Completed Quote','NewCo','CW',BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, COMPL_QTE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN COMPL_QTE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

state_scdi_phone_cq AS -- State Phone Completed Quote Count for Auto SCDI
(
	SELECT CONCAT('Phone Completed Quote','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

region_scdi_phone_cq AS -- Regional Phone Completed Quote Count for Auto SCDI
(
	SELECT CONCAT('Phone Completed Quote','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

cw_scdi_phone_cq AS -- CW Phone Completed Quote Count for Auto SCDI
(
	SELECT CONCAT('Phone Completed Quote','NowCo','CW',BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

state_aq_issue AS -- State Issue Count for Auto Quote
(
	SELECT CONCAT('Issue','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	GROUP BY Key
),

region_aq_issue AS -- Regional Issue Count for Auto Quote
(
	SELECT CONCAT('Issue','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	GROUP BY Key
),

cw_aq_issue AS -- CW Issue Count for Auto Quote
(
	SELECT CONCAT('Issue','NewCo','CW',BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	GROUP BY Key
),

state_scdi_issue AS -- State Issue Count for Auto SCDI
(
	SELECT CONCAT('Issue','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT'
	GROUP BY Key
),

region_scdi_issue AS -- Regional Issue Count for Auto SCDI
(
	SELECT CONCAT('Issue','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT'
	GROUP BY Key
),

cw_scdi_issue AS -- CW Issue Count for Auto SCDI
(
	SELECT CONCAT('Issue','NowCo','CW',BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT'
	GROUP BY Key
),

state_aq_phone_issue AS -- State Phone Issue Count for Auto Quote
(
	SELECT CONCAT('Phone Issue','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

region_aq_phone_issue AS -- Regional Phone Issue Count for Auto Quote
(
	SELECT CONCAT('Phone Issue','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

cw_aq_phone_issue AS -- CW Phone Issue Count for Auto Quote
(
	SELECT CONCAT('Phone Issue','NewCo','CW',BU_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, TRANS_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, TRANS_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, TRANS_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, TRANS_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, TRANS_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, TRANS_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, TRANS_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, TRANS_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, TRANS_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, TRANS_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, TRANS_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, TRANS_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, TRANS_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, TRANS_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, TRANS_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, TRANS_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, TRANS_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, TRANS_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, TRANS_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ORIG_QTE_CNTCT_METH_CD = 'P'
	GROUP BY Key
),

state_scdi_phone_issue AS -- State Phone Issue Count for Auto SCDI
(
	SELECT CONCAT('Phone Issue','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

region_scdi_phone_issue AS -- Regional Phone Issue Count for Auto SCDI
(
	SELECT CONCAT('Phone Issue','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

cw_scdi_phone_issue AS -- CW Phone Issue Count for Auto SCDI
(
	SELECT CONCAT('Phone Issue','NowCo','CW',BUS_UNIT_ABBR) as Key,
	TRUNC(zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "18",
	TRUNC(zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "17",
	TRUNC(zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "16",
	TRUNC(zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "15",
	TRUNC(zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "14",
	TRUNC(zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "13",
	TRUNC(zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "12",
	TRUNC(zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "11",
	TRUNC(zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "10",
	TRUNC(zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "9",
	TRUNC(zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "8",
	TRUNC(zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "7",
	TRUNC(zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "6",
	TRUNC(zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "5",
	TRUNC(zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "4",
	TRUNC(zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "3",
	TRUNC(zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "2",
	TRUNC(zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "1",
	TRUNC(zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ISSUE_IND_CNT), 0) AS "0",
	TRUNC(SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ISSUE_IND_CNT ELSE 0 END), 0) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

state_aq_aip AS -- State AIP for Auto Quote
(
	SELECT CONCAT('AIP','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "18",
	zero_cond_scorecard(17, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "17",
	zero_cond_scorecard(16, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "16",
	zero_cond_scorecard(15, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "15",
	zero_cond_scorecard(14, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "14",
	zero_cond_scorecard(13, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "13",
	zero_cond_scorecard(12, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "12",
	zero_cond_scorecard(11, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "11",
	zero_cond_scorecard(10, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "10",
	zero_cond_scorecard(9, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "9",
	zero_cond_scorecard(8, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "8",
	zero_cond_scorecard(7, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "7",
	zero_cond_scorecard(6, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "6",
	zero_cond_scorecard(5, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "5",
	zero_cond_scorecard(4, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "4",
	zero_cond_scorecard(3, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "3",
	zero_cond_scorecard(2, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "2",
	zero_cond_scorecard(1, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "1",
	zero_cond_scorecard(0, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN POL_TTL_BILL_PREM_AMT * 2 ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ISSUE_IND = 'Y'
	GROUP BY Key
),

region_aq_aip AS -- Regional AIP for Auto Quote
(
	SELECT CONCAT('AIP','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "18",
	zero_cond_scorecard(17, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "17",
	zero_cond_scorecard(16, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "16",
	zero_cond_scorecard(15, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "15",
	zero_cond_scorecard(14, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "14",
	zero_cond_scorecard(13, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "13",
	zero_cond_scorecard(12, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "12",
	zero_cond_scorecard(11, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "11",
	zero_cond_scorecard(10, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "10",
	zero_cond_scorecard(9, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "9",
	zero_cond_scorecard(8, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "8",
	zero_cond_scorecard(7, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "7",
	zero_cond_scorecard(6, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "6",
	zero_cond_scorecard(5, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "5",
	zero_cond_scorecard(4, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "4",
	zero_cond_scorecard(3, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "3",
	zero_cond_scorecard(2, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "2",
	zero_cond_scorecard(1, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "1",
	zero_cond_scorecard(0, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN POL_TTL_BILL_PREM_AMT * 2 ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ISSUE_IND = 'Y'
	GROUP BY Key
),

cw_aq_aip AS -- CW AIP for Auto Quote
(
	SELECT CONCAT('AIP','NewCo','CW',BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "18",
	zero_cond_scorecard(17, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "17",
	zero_cond_scorecard(16, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "16",
	zero_cond_scorecard(15, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "15",
	zero_cond_scorecard(14, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "14",
	zero_cond_scorecard(13, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "13",
	zero_cond_scorecard(12, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "12",
	zero_cond_scorecard(11, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "11",
	zero_cond_scorecard(10, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "10",
	zero_cond_scorecard(9, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "9",
	zero_cond_scorecard(8, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "8",
	zero_cond_scorecard(7, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "7",
	zero_cond_scorecard(6, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "6",
	zero_cond_scorecard(5, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "5",
	zero_cond_scorecard(4, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "4",
	zero_cond_scorecard(3, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "3",
	zero_cond_scorecard(2, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "2",
	zero_cond_scorecard(1, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "1",
	zero_cond_scorecard(0, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN POL_TTL_BILL_PREM_AMT * 2 ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE ISSUE_IND = 'Y'
	GROUP BY Key
),

state_scdi_aip AS -- State AIP for Auto SCDI
(
	SELECT CONCAT('AIP','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ISSUE_IND = 'Y'
	GROUP BY Key
),

region_scdi_aip AS -- Regional AIP for Auto SCDI
(
	SELECT CONCAT('AIP','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ISSUE_IND = 'Y'
	GROUP BY Key
),

cw_scdi_aip AS -- CW AIP for Auto SCDI
(
	SELECT CONCAT('AIP','NowCo','CW',BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND ISSUE_IND = 'Y'
	GROUP BY Key
),

state_aq_cq AS -- State Completed Quote Count for Auto Quote
(
	SELECT CONCAT('Completed Quotes','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, COMPL_QTE_IND_CNT) AS "18",
	zero_cond_scorecard(17, TRANS_DT, COMPL_QTE_IND_CNT) AS "17",
	zero_cond_scorecard(16, TRANS_DT, COMPL_QTE_IND_CNT) AS "16",
	zero_cond_scorecard(15, TRANS_DT, COMPL_QTE_IND_CNT) AS "15",
	zero_cond_scorecard(14, TRANS_DT, COMPL_QTE_IND_CNT) AS "14",
	zero_cond_scorecard(13, TRANS_DT, COMPL_QTE_IND_CNT) AS "13",
	zero_cond_scorecard(12, TRANS_DT, COMPL_QTE_IND_CNT) AS "12",
	zero_cond_scorecard(11, TRANS_DT, COMPL_QTE_IND_CNT) AS "11",
	zero_cond_scorecard(10, TRANS_DT, COMPL_QTE_IND_CNT) AS "10",
	zero_cond_scorecard(9, TRANS_DT, COMPL_QTE_IND_CNT) AS "9",
	zero_cond_scorecard(8, TRANS_DT, COMPL_QTE_IND_CNT) AS "8",
	zero_cond_scorecard(7, TRANS_DT, COMPL_QTE_IND_CNT) AS "7",
	zero_cond_scorecard(6, TRANS_DT, COMPL_QTE_IND_CNT) AS "6",
	zero_cond_scorecard(5, TRANS_DT, COMPL_QTE_IND_CNT) AS "5",
	zero_cond_scorecard(4, TRANS_DT, COMPL_QTE_IND_CNT) AS "4",
	zero_cond_scorecard(3, TRANS_DT, COMPL_QTE_IND_CNT) AS "3",
	zero_cond_scorecard(2, TRANS_DT, COMPL_QTE_IND_CNT) AS "2",
	zero_cond_scorecard(1, TRANS_DT, COMPL_QTE_IND_CNT) AS "1",
	zero_cond_scorecard(0, TRANS_DT, COMPL_QTE_IND_CNT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND = 'Y'
	GROUP BY Key
),

region_aq_cq AS -- Regional Completed Quote Count for Auto Quote
(
	SELECT CONCAT('Completed Quotes','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, COMPL_QTE_IND_CNT) AS "18",
	zero_cond_scorecard(17, TRANS_DT, COMPL_QTE_IND_CNT) AS "17",
	zero_cond_scorecard(16, TRANS_DT, COMPL_QTE_IND_CNT) AS "16",
	zero_cond_scorecard(15, TRANS_DT, COMPL_QTE_IND_CNT) AS "15",
	zero_cond_scorecard(14, TRANS_DT, COMPL_QTE_IND_CNT) AS "14",
	zero_cond_scorecard(13, TRANS_DT, COMPL_QTE_IND_CNT) AS "13",
	zero_cond_scorecard(12, TRANS_DT, COMPL_QTE_IND_CNT) AS "12",
	zero_cond_scorecard(11, TRANS_DT, COMPL_QTE_IND_CNT) AS "11",
	zero_cond_scorecard(10, TRANS_DT, COMPL_QTE_IND_CNT) AS "10",
	zero_cond_scorecard(9, TRANS_DT, COMPL_QTE_IND_CNT) AS "9",
	zero_cond_scorecard(8, TRANS_DT, COMPL_QTE_IND_CNT) AS "8",
	zero_cond_scorecard(7, TRANS_DT, COMPL_QTE_IND_CNT) AS "7",
	zero_cond_scorecard(6, TRANS_DT, COMPL_QTE_IND_CNT) AS "6",
	zero_cond_scorecard(5, TRANS_DT, COMPL_QTE_IND_CNT) AS "5",
	zero_cond_scorecard(4, TRANS_DT, COMPL_QTE_IND_CNT) AS "4",
	zero_cond_scorecard(3, TRANS_DT, COMPL_QTE_IND_CNT) AS "3",
	zero_cond_scorecard(2, TRANS_DT, COMPL_QTE_IND_CNT) AS "2",
	zero_cond_scorecard(1, TRANS_DT, COMPL_QTE_IND_CNT) AS "1",
	zero_cond_scorecard(0, TRANS_DT, COMPL_QTE_IND_CNT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND = 'Y'
	GROUP BY Key
),

cw_aq_cq AS -- CW Completed Quote Count for Auto Quote
(
	SELECT CONCAT('Completed Quotes','NewCo','CW',BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, COMPL_QTE_IND_CNT) AS "18",
	zero_cond_scorecard(17, TRANS_DT, COMPL_QTE_IND_CNT) AS "17",
	zero_cond_scorecard(16, TRANS_DT, COMPL_QTE_IND_CNT) AS "16",
	zero_cond_scorecard(15, TRANS_DT, COMPL_QTE_IND_CNT) AS "15",
	zero_cond_scorecard(14, TRANS_DT, COMPL_QTE_IND_CNT) AS "14",
	zero_cond_scorecard(13, TRANS_DT, COMPL_QTE_IND_CNT) AS "13",
	zero_cond_scorecard(12, TRANS_DT, COMPL_QTE_IND_CNT) AS "12",
	zero_cond_scorecard(11, TRANS_DT, COMPL_QTE_IND_CNT) AS "11",
	zero_cond_scorecard(10, TRANS_DT, COMPL_QTE_IND_CNT) AS "10",
	zero_cond_scorecard(9, TRANS_DT, COMPL_QTE_IND_CNT) AS "9",
	zero_cond_scorecard(8, TRANS_DT, COMPL_QTE_IND_CNT) AS "8",
	zero_cond_scorecard(7, TRANS_DT, COMPL_QTE_IND_CNT) AS "7",
	zero_cond_scorecard(6, TRANS_DT, COMPL_QTE_IND_CNT) AS "6",
	zero_cond_scorecard(5, TRANS_DT, COMPL_QTE_IND_CNT) AS "5",
	zero_cond_scorecard(4, TRANS_DT, COMPL_QTE_IND_CNT) AS "4",
	zero_cond_scorecard(3, TRANS_DT, COMPL_QTE_IND_CNT) AS "3",
	zero_cond_scorecard(2, TRANS_DT, COMPL_QTE_IND_CNT) AS "2",
	zero_cond_scorecard(1, TRANS_DT, COMPL_QTE_IND_CNT) AS "1",
	zero_cond_scorecard(0, TRANS_DT, COMPL_QTE_IND_CNT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND = 'Y'
	GROUP BY Key
),

state_scdi_cq AS -- State Completed Quote Count for Auto SCDI
(
	SELECT CONCAT('Completed Quotes','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND COMPL_QUOTE_IND = 'Y'
	GROUP BY Key
),

region_scdi_cq AS -- Regional Completed Quote Count for Auto SCDI
(
	SELECT CONCAT('Completed Quotes','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND COMPL_QUOTE_IND = 'Y'
	GROUP BY Key
),

cw_scdi_cq AS -- CW Completed Quote Count for Auto SCDI
(
	SELECT CONCAT('Completed Quotes','NowCo','CW',BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, COMPL_QUOTE_IND_CNT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND COMPL_QUOTE_IND = 'Y'
	GROUP BY Key
),

state_aq_higsrp AS -- State HIGSRP for Auto Quote
(
	SELECT CONCAT('HIGSRP','NewCo',RISK_ST_ABBR,BU_ABBR) AS Key,
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=18 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "18",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=17 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "17",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=16 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "16",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=15 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "15",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=14 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "14",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=13 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "13",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=12 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "12",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=11 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "11",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=10 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "10",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 9 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "9",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 8 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "8",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 7 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "7",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 6 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "6",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 5 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "5",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 4 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "4",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 3 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "3",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 2 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "2",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 1 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "1",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 0 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "0",
	AVG(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE())= 0 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND_CNT = 1 AND PCARR_POL_TERM_MO_CNT = 6
	AND PCARR_POL_ANNL_PREM_AMT > 249 AND PCARR_POL_ANNL_PREM_AMT < 6000
	AND POL_ANNL_TTL_BILL_PREM_AMT > 200 AND  CNTCT_METH_CD = 'P'
	GROUP BY Key
),

region_aq_higsrp AS -- Regional HIGSRP for Auto Quote
(
	SELECT CONCAT('HIGSRP','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) AS Key,
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=18 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "18",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=17 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "17",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=16 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "16",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=15 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "15",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=14 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "14",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=13 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "13",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=12 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "12",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=11 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "11",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=10 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "10",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 9 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "9",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 8 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "8",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 7 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "7",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 6 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "6",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 5 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "5",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 4 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "4",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 3 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "3",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 2 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "2",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 1 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "1",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 0 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "0",
	AVG(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE())= 0 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND_CNT = 1 AND PCARR_POL_TERM_MO_CNT = 6
	AND PCARR_POL_ANNL_PREM_AMT > 249 AND PCARR_POL_ANNL_PREM_AMT < 6000
	AND POL_ANNL_TTL_BILL_PREM_AMT > 200 AND  CNTCT_METH_CD = 'P'
	GROUP BY Key
),

cw_aq_higsrp AS -- CW HIGSRP for Auto Quote
(
	SELECT CONCAT('HIGSRP','NewCo','CW',BU_ABBR) AS Key,
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=18 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "18",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=17 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "17",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=16 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "16",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=15 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "15",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=14 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "14",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=13 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "13",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=12 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "12",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=11 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "11",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())=10 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "10",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 9 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "9",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 8 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "8",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 7 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "7",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 6 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "6",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 5 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "5",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 4 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "4",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 3 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "3",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 2 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "2",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 1 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "1",
	AVG(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE())= 0 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "0",
	AVG(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE())= 0 THEN POL_ANNL_TTL_BILL_PREM_AMT / PCARR_POL_ANNL_PREM_AMT ELSE NULL END) as "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND_CNT = 1 AND PCARR_POL_TERM_MO_CNT = 6
	AND PCARR_POL_ANNL_PREM_AMT > 249 AND PCARR_POL_ANNL_PREM_AMT < 6000
	AND POL_ANNL_TTL_BILL_PREM_AMT > 200 AND  CNTCT_METH_CD = 'P'
	GROUP BY Key
),

state_scdi_higsrp AS -- State HIGSRP for Auto SCDI
(
	SELECT CONCAT('HIGSRP','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) AS Key,
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=18 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "18",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=17 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "17",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=16 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "16",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=15 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "15",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=14 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "14",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=13 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "13",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=12 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "12",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=11 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "11",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=10 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "10",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 9 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "9",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 8 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "8",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 7 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "7",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 6 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "6",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 5 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "5",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 4 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "4",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 3 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "3",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 2 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "2",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 1 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "1",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 0 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "0",
	AVG(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 0 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR = 'AARP' AND COMPL_QUOTE_IND_CNT = 1
	AND PRIOR_CARR_POL_ANNUAL_PREM_AMT >= 250 AND ANNUALIZED_PREM_AMT > 300
	AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

region_scdi_higsrp AS -- Regional HIGSRP for Auto SCDI
(
	SELECT CONCAT('HIGSRP','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) AS Key,
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=18 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "18",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=17 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "17",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=16 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "16",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=15 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "15",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=14 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "14",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=13 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "13",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=12 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "12",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=11 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "11",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=10 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "10",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 9 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "9",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 8 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "8",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 7 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "7",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 6 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "6",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 5 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "5",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 4 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "4",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 3 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "3",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 2 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "2",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 1 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "1",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 0 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "0",
	AVG(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 0 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR = 'AARP' AND COMPL_QUOTE_IND_CNT = 1
	AND PRIOR_CARR_POL_ANNUAL_PREM_AMT >= 250 AND ANNUALIZED_PREM_AMT > 300
	AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

cw_scdi_higsrp AS -- CW HIGSRP for Auto SCDI
(
	SELECT CONCAT('HIGSRP','NowCo','CW',BUS_UNIT_ABBR) AS Key,
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=18 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "18",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=17 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "17",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=16 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "16",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=15 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "15",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=14 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "14",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=13 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "13",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=12 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "12",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=11 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "11",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())=10 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "10",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 9 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "9",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 8 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "8",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 7 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "7",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 6 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "6",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 5 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "5",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 4 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "4",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 3 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "3",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 2 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "2",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 1 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "1",
	AVG(CASE WHEN DATEDIFF(MONTH, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 0 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "0",
	AVG(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE())= 0 THEN ANNUALIZED_PREM_AMT / PRIOR_CARR_POL_ANNUAL_PREM_AMT ELSE NULL END) as "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR = 'AARP' AND COMPL_QUOTE_IND_CNT = 1
	AND PRIOR_CARR_POL_ANNUAL_PREM_AMT >= 250 AND ANNUALIZED_PREM_AMT > 300
	AND ORIG_QUOTE_PROCESS_METH_CD = 'T'
	GROUP BY Key
),

state_aq_aqp AS -- State AQP for Auto Quote
(
	SELECT CONCAT('AQP','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "18",
	zero_cond_scorecard(17, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "17",
	zero_cond_scorecard(16, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "16",
	zero_cond_scorecard(15, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "15",
	zero_cond_scorecard(14, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "14",
	zero_cond_scorecard(13, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "13",
	zero_cond_scorecard(12, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "12",
	zero_cond_scorecard(11, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "11",
	zero_cond_scorecard(10, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "10",
	zero_cond_scorecard(9, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "9",
	zero_cond_scorecard(8, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "8",
	zero_cond_scorecard(7, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "7",
	zero_cond_scorecard(6, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "6",
	zero_cond_scorecard(5, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "5",
	zero_cond_scorecard(4, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "4",
	zero_cond_scorecard(3, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "3",
	zero_cond_scorecard(2, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "2",
	zero_cond_scorecard(1, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "1",
	zero_cond_scorecard(0, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN POL_TTL_BILL_PREM_AMT * 2 ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND_CNT = '1'
	GROUP BY Key
),

region_aq_aqp AS -- Regional AQP for Auto Quote
(
	SELECT CONCAT('AQP','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "18",
	zero_cond_scorecard(17, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "17",
	zero_cond_scorecard(16, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "16",
	zero_cond_scorecard(15, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "15",
	zero_cond_scorecard(14, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "14",
	zero_cond_scorecard(13, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "13",
	zero_cond_scorecard(12, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "12",
	zero_cond_scorecard(11, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "11",
	zero_cond_scorecard(10, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "10",
	zero_cond_scorecard(9, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "9",
	zero_cond_scorecard(8, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "8",
	zero_cond_scorecard(7, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "7",
	zero_cond_scorecard(6, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "6",
	zero_cond_scorecard(5, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "5",
	zero_cond_scorecard(4, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "4",
	zero_cond_scorecard(3, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "3",
	zero_cond_scorecard(2, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "2",
	zero_cond_scorecard(1, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "1",
	zero_cond_scorecard(0, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN POL_TTL_BILL_PREM_AMT * 2 ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND_CNT = '1'
	GROUP BY Key
),

cw_aq_aqp AS -- CW AQP for Auto Quote
(
	SELECT CONCAT('AQP','NewCo','CW',BU_ABBR) as Key,
	zero_cond_scorecard(18, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "18",
	zero_cond_scorecard(17, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "17",
	zero_cond_scorecard(16, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "16",
	zero_cond_scorecard(15, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "15",
	zero_cond_scorecard(14, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "14",
	zero_cond_scorecard(13, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "13",
	zero_cond_scorecard(12, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "12",
	zero_cond_scorecard(11, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "11",
	zero_cond_scorecard(10, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "10",
	zero_cond_scorecard(9, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "9",
	zero_cond_scorecard(8, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "8",
	zero_cond_scorecard(7, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "7",
	zero_cond_scorecard(6, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "6",
	zero_cond_scorecard(5, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "5",
	zero_cond_scorecard(4, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "4",
	zero_cond_scorecard(3, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "3",
	zero_cond_scorecard(2, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "2",
	zero_cond_scorecard(1, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "1",
	zero_cond_scorecard(0, TRANS_DT, POL_TTL_BILL_PREM_AMT * 2) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN POL_TTL_BILL_PREM_AMT * 2 ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"
	WHERE COMPL_QTE_IND_CNT = '1'
	GROUP BY Key
),

state_scdi_aqp AS -- State AQP for Auto SCDI
(
	SELECT CONCAT('AQP','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND COMPL_QUOTE_IND_CNT = '1'
	GROUP BY Key
),

region_scdi_aqp AS -- Regional AQP for Auto SCDI
(
	SELECT CONCAT('AQP','NowCo',GET_REGION_SCORECARD(RISK_STATE_ABBR),BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND COMPL_QUOTE_IND_CNT = '1'
	GROUP BY Key
),

cw_scdi_aqp AS -- CW AQP for Auto SCDI
(
	SELECT CONCAT('AQP','NowCo','CW',BUS_UNIT_ABBR) as Key,
	zero_cond_scorecard(18, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "18",
	zero_cond_scorecard(17, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "17",
	zero_cond_scorecard(16, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "16",
	zero_cond_scorecard(15, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "15",
	zero_cond_scorecard(14, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "14",
	zero_cond_scorecard(13, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "13",
	zero_cond_scorecard(12, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "12",
	zero_cond_scorecard(11, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "11",
	zero_cond_scorecard(10, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "10",
	zero_cond_scorecard(9, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "9",
	zero_cond_scorecard(8, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "8",
	zero_cond_scorecard(7, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "7",
	zero_cond_scorecard(6, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "6",
	zero_cond_scorecard(5, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "5",
	zero_cond_scorecard(4, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "4",
	zero_cond_scorecard(3, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "3",
	zero_cond_scorecard(2, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "2",
	zero_cond_scorecard(1, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "1",
	zero_cond_scorecard(0, QUOTE_LAST_TRANSACTION_DT, ANNUALIZED_PREM_AMT) AS "0",
	SUM(CASE WHEN DATEDIFF(YEAR, QUOTE_LAST_TRANSACTION_DT, SYSDATE()) = 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW"
	WHERE BUS_UNIT_ABBR <> 'CDRT' AND COMPL_QUOTE_IND_CNT = '1'
	GROUP BY Key
),

state_aq_ulm AS -- State ULM from Auto Quote
(
	SELECT CONCAT('ULM','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 18 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 18 THEN RESP_IND_CNT ELSE 0 END)) AS "18",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 17 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 17 THEN RESP_IND_CNT ELSE 0 END)) AS "17",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 16 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 16 THEN RESP_IND_CNT ELSE 0 END)) AS "16",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 15 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 15 THEN RESP_IND_CNT ELSE 0 END)) AS "15",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 14 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 14 THEN RESP_IND_CNT ELSE 0 END)) AS "14",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 13 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 13 THEN RESP_IND_CNT ELSE 0 END)) AS "13",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 12 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 12 THEN RESP_IND_CNT ELSE 0 END)) AS "12",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 11 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 11 THEN RESP_IND_CNT ELSE 0 END)) AS "11",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 10 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 10 THEN RESP_IND_CNT ELSE 0 END)) AS "10",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 9 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 9 THEN RESP_IND_CNT ELSE 0 END)) AS "9",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 8 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 8 THEN RESP_IND_CNT ELSE 0 END)) AS "8",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 7 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 7 THEN RESP_IND_CNT ELSE 0 END)) AS "7",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 6 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 6 THEN RESP_IND_CNT ELSE 0 END)) AS "6",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 5 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 5 THEN RESP_IND_CNT ELSE 0 END)) AS "5",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 4 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 4 THEN RESP_IND_CNT ELSE 0 END)) AS "4",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 3 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 3 THEN RESP_IND_CNT ELSE 0 END)) AS "3",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 2 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 2 THEN RESP_IND_CNT ELSE 0 END)) AS "2",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 1 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 1 THEN RESP_IND_CNT ELSE 0 END)) AS "1",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 0 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END)) AS "0",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END)) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" t1
	LEFT JOIN (SELECT INPUT_QUOTENUMBER, TREATMENTDECISION
			   FROM "DSC_PLBI_DB"."APP_AUTO_DEV"."AUTO_ULM_QUOTE_VW"
			   GROUP BY INPUT_QUOTENUMBER, TREATMENTDECISION) t2
	ON t1.QCN = t2.INPUT_QUOTENUMBER
	WHERE ORIG_QTE_CNTCT_METH_CD = 'I' AND TREATMENTDECISION IN (0, 1)
	GROUP BY Key
),

region_aq_ulm AS -- Regional ULM from Auto Quote
(
	SELECT CONCAT('ULM','NewCo',GET_REGION_SCORECARD(RISK_ST_ABBR),BU_ABBR) as Key,
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 18 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 18 THEN RESP_IND_CNT ELSE 0 END)) AS "18",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 17 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 17 THEN RESP_IND_CNT ELSE 0 END)) AS "17",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 16 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 16 THEN RESP_IND_CNT ELSE 0 END)) AS "16",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 15 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 15 THEN RESP_IND_CNT ELSE 0 END)) AS "15",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 14 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 14 THEN RESP_IND_CNT ELSE 0 END)) AS "14",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 13 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 13 THEN RESP_IND_CNT ELSE 0 END)) AS "13",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 12 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 12 THEN RESP_IND_CNT ELSE 0 END)) AS "12",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 11 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 11 THEN RESP_IND_CNT ELSE 0 END)) AS "11",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 10 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 10 THEN RESP_IND_CNT ELSE 0 END)) AS "10",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 9 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 9 THEN RESP_IND_CNT ELSE 0 END)) AS "9",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 8 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 8 THEN RESP_IND_CNT ELSE 0 END)) AS "8",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 7 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 7 THEN RESP_IND_CNT ELSE 0 END)) AS "7",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 6 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 6 THEN RESP_IND_CNT ELSE 0 END)) AS "6",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 5 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 5 THEN RESP_IND_CNT ELSE 0 END)) AS "5",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 4 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 4 THEN RESP_IND_CNT ELSE 0 END)) AS "4",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 3 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 3 THEN RESP_IND_CNT ELSE 0 END)) AS "3",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 2 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 2 THEN RESP_IND_CNT ELSE 0 END)) AS "2",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 1 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 1 THEN RESP_IND_CNT ELSE 0 END)) AS "1",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 0 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END)) AS "0",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END)) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" t1
	LEFT JOIN (SELECT INPUT_QUOTENUMBER, TREATMENTDECISION
			   FROM "DSC_PLBI_DB"."APP_AUTO_DEV"."AUTO_ULM_QUOTE_VW"
			   GROUP BY INPUT_QUOTENUMBER, TREATMENTDECISION) t2
	ON t1.QCN = t2.INPUT_QUOTENUMBER
	WHERE ORIG_QTE_CNTCT_METH_CD = 'I' AND TREATMENTDECISION IN (0, 1)
	GROUP BY Key
),

cw_aq_ulm AS -- CW ULM from Auto Quote
(
	SELECT CONCAT('ULM','NewCo','CW',BU_ABBR) as Key,
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 18 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 18 THEN RESP_IND_CNT ELSE 0 END)) AS "18",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 17 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 17 THEN RESP_IND_CNT ELSE 0 END)) AS "17",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 16 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 16 THEN RESP_IND_CNT ELSE 0 END)) AS "16",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 15 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 15 THEN RESP_IND_CNT ELSE 0 END)) AS "15",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 14 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 14 THEN RESP_IND_CNT ELSE 0 END)) AS "14",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 13 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 13 THEN RESP_IND_CNT ELSE 0 END)) AS "13",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 12 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 12 THEN RESP_IND_CNT ELSE 0 END)) AS "12",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 11 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 11 THEN RESP_IND_CNT ELSE 0 END)) AS "11",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 10 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 10 THEN RESP_IND_CNT ELSE 0 END)) AS "10",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 9 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 9 THEN RESP_IND_CNT ELSE 0 END)) AS "9",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 8 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 8 THEN RESP_IND_CNT ELSE 0 END)) AS "8",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 7 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 7 THEN RESP_IND_CNT ELSE 0 END)) AS "7",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 6 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 6 THEN RESP_IND_CNT ELSE 0 END)) AS "6",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 5 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 5 THEN RESP_IND_CNT ELSE 0 END)) AS "5",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 4 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 4 THEN RESP_IND_CNT ELSE 0 END)) AS "4",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 3 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 3 THEN RESP_IND_CNT ELSE 0 END)) AS "3",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 2 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 2 THEN RESP_IND_CNT ELSE 0 END)) AS "2",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 1 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 1 THEN RESP_IND_CNT ELSE 0 END)) AS "1",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 0 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(MONTH, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END)) AS "0",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 AND TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END), 
			 SUM(CASE WHEN DATEDIFF(YEAR, TRANS_DT, SYSDATE()) = 0 THEN RESP_IND_CNT ELSE 0 END)) AS "0",
	TO_CHAR(SYSDATE(),'MM-DD-YYYY') as AS_OF
	FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" t1
	LEFT JOIN (SELECT INPUT_QUOTENUMBER, TREATMENTDECISION
			   FROM "DSC_PLBI_DB"."APP_AUTO_DEV"."AUTO_ULM_QUOTE_VW"
			   GROUP BY INPUT_QUOTENUMBER, TREATMENTDECISION) t2
	ON t1.QCN = t2.INPUT_QUOTENUMBER
	WHERE ORIG_QTE_CNTCT_METH_CD = 'I' AND TREATMENTDECISION IN (0, 1)
	GROUP BY Key
)

SELECT * FROM
(
	SELECT * FROM state_aq_response
	UNION ALL
	SELECT * FROM region_aq_response
	UNION ALL
	SELECT * FROM cw_aq_response
	UNION ALL
	SELECT * FROM state_scdi_response
	UNION ALL
	SELECT * FROM region_scdi_response
	UNION ALL
	SELECT * FROM cw_scdi_response
	UNION ALL
	SELECT * FROM state_aq_phone
	UNION ALL
	SELECT * FROM region_aq_phone
	UNION ALL
	SELECT * FROM cw_aq_phone
	UNION ALL
	SELECT * FROM state_scdi_phone
	UNION ALL
	SELECT * FROM region_scdi_phone
    UNION ALL
    SELECT * FROM cw_scdi_phone
	UNION ALL
	SELECT * FROM state_aq_phone_cq
	UNION ALL
	SELECT * FROM region_aq_phone_cq
	UNION ALL
	SELECT * FROM cw_aq_phone_cq
	UNION ALL
	SELECT * FROM state_scdi_phone_cq
	UNION ALL
	SELECT * FROM region_scdi_phone_cq
	UNION ALL
	SELECT * FROM cw_scdi_phone_cq
	UNION ALL
	SELECT * FROM state_aq_issue
	UNION ALL
	SELECT * FROM region_aq_issue
	UNION ALL
	SELECT * FROM cw_aq_issue
	UNION ALL
	SELECT * FROM state_scdi_issue
	UNION ALL
	SELECT * FROM region_scdi_issue
	UNION ALL
	SELECT * FROM cw_scdi_issue
	UNION ALL
	SELECT * FROM state_aq_phone_issue
	UNION ALL
	SELECT * FROM region_aq_phone_issue
	UNION ALL
	SELECT * FROM cw_aq_phone_issue
	UNION ALL
	SELECT * FROM state_scdi_phone_issue
	UNION ALL
	SELECT * FROM region_scdi_phone_issue
	UNION ALL
	SELECT * FROM cw_scdi_phone_issue
	UNION ALL
	SELECT * FROM state_aq_aip
	UNION ALL
	SELECT * FROM region_aq_aip
	UNION ALL
	SELECT * FROM cw_aq_aip
	UNION ALL
	SELECT * FROM state_scdi_aip
	UNION ALL
	SELECT * FROM region_scdi_aip
	UNION ALL
	SELECT * FROM cw_scdi_aip
	UNION ALL
	SELECT * FROM state_aq_cq
	UNION ALL
	SELECT * FROM region_aq_cq
	UNION ALL
	SELECT * FROM cw_aq_cq
	UNION ALL
	SELECT * FROM state_scdi_cq
	UNION ALL
	SELECT * FROM region_scdi_cq
	UNION ALL
	SELECT * FROM cw_scdi_cq
	UNION ALL
	SELECT * FROM state_aq_higsrp
	UNION ALL
	SELECT * FROM region_aq_higsrp
	UNION ALL
	SELECT * FROM cw_aq_higsrp
	UNION ALL
	SELECT * FROM state_scdi_higsrp
	UNION ALL
	SELECT * FROM region_scdi_higsrp
	UNION ALL
	SELECT * FROM cw_scdi_higsrp
	UNION ALL
	SELECT * FROM state_aq_aqp
	UNION ALL
	SELECT * FROM region_aq_aqp
	UNION ALL
	SELECT * FROM cw_aq_aqp
	UNION ALL
	SELECT * FROM state_scdi_aqp
	UNION ALL
	SELECT * FROM region_scdi_aqp
	UNION ALL
	SELECT * FROM cw_scdi_aqp
	UNION ALL
	SELECT * FROM state_aq_ulm
	UNION ALL
	SELECT * FROM region_aq_ulm
	UNION ALL
	SELECT * FROM cw_aq_ulm
)
ORDER BY KEY