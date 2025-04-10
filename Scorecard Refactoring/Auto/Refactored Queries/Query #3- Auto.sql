WITH state_e_30_nb AS -- Persistency calculations for State E+30 NB
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

region_e_30_nb AS -- Persistency calculations for Region E+30 NB
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

cw_e_30_nb AS -- Persistency calculations for Countrywide E+30 NB
(
	SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

state_e_60_nb AS -- Persistency calculations for State E+60 NB
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+60 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

region_e_60_nb AS -- Persistency calculations for Region E+60 NB
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+60 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

cw_e_60_nb AS -- Persistency calculations for Countrywide E+60 NB
(
	SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+60 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

state_e_90_nb AS -- Persistency calculations for State E+90 NB
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+90 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

region_e_90_nb AS -- Persistency calculations for Region E+90 NB
(
	SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+90 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

cw_e_90_nb AS -- Persistency calculations for Countrywide E+90 NB
(
	SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+90 NB') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
    WHERE POL_NEW_RENEW_CD = 'N' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
    GROUP BY Key
),

state_pol_count AS -- Policy Inforce Counts by State
(
	SELECT CONCAT(STATE_ABBR,BUS_UNIT_ABBR,NEWCO_IND,'Inforce') as Key,
	zero_cond_scorecard(18, ME_DT, POL_INFORCE_CNT) AS "18",
	zero_cond_scorecard(17, ME_DT, POL_INFORCE_CNT) AS "17",
	zero_cond_scorecard(16, ME_DT, POL_INFORCE_CNT) AS "16",
	zero_cond_scorecard(15, ME_DT, POL_INFORCE_CNT) AS "15",
	zero_cond_scorecard(14, ME_DT, POL_INFORCE_CNT) AS "14",
	zero_cond_scorecard(13, ME_DT, POL_INFORCE_CNT) AS "13",
	zero_cond_scorecard(12, ME_DT, POL_INFORCE_CNT) AS "12",
	zero_cond_scorecard(11, ME_DT, POL_INFORCE_CNT) AS "11",
	zero_cond_scorecard(10, ME_DT, POL_INFORCE_CNT) AS "10",
	zero_cond_scorecard(9, ME_DT, POL_INFORCE_CNT) AS "9",
	zero_cond_scorecard(8, ME_DT, POL_INFORCE_CNT) AS "8",
	zero_cond_scorecard(7, ME_DT, POL_INFORCE_CNT) AS "7",
	zero_cond_scorecard(6, ME_DT, POL_INFORCE_CNT) AS "6",
	zero_cond_scorecard(5, ME_DT, POL_INFORCE_CNT) AS "5",
	zero_cond_scorecard(4, ME_DT, POL_INFORCE_CNT) AS "4",
	zero_cond_scorecard(3, ME_DT, POL_INFORCE_CNT) AS "3",
	zero_cond_scorecard(2, ME_DT, POL_INFORCE_CNT) AS "2",
	zero_cond_scorecard(1, ME_DT, POL_INFORCE_CNT) AS "1",
	zero_cond_scorecard(0, ME_DT, POL_INFORCE_CNT) AS "0",
	TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
	WHERE BUS_UNIT_ABBR IN ('AARP','AGCY') 
	AND CONCAT(STATE_ABBR,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1',
	'MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP',
	'NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

state_wp AS -- Written Premium by State
(
	SELECT CONCAT(STATE_ABBR,BUS_UNIT_ABBR,NEWCO_IND,'Written Premium') as Key,
	zero_cond_scorecard(18, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "18",
	zero_cond_scorecard(17, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "17",
	zero_cond_scorecard(16, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "16",
	zero_cond_scorecard(15, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "15",
	zero_cond_scorecard(14, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "14",
	zero_cond_scorecard(13, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "13",
	zero_cond_scorecard(12, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "12",
	zero_cond_scorecard(11, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "11",
	zero_cond_scorecard(10, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "10",
	zero_cond_scorecard(9, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "9",
	zero_cond_scorecard(8, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "8",
	zero_cond_scorecard(7, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "7",
	zero_cond_scorecard(6, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "6",
	zero_cond_scorecard(5, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "5",
	zero_cond_scorecard(4, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "4",
	zero_cond_scorecard(3, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "3",
	zero_cond_scorecard(2, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "2",
	zero_cond_scorecard(1, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "1",
	zero_cond_scorecard(0, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "0",
	TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
	WHERE BUS_UNIT_ABBR IN ('AARP','AGCY') 
	AND CONCAT(STATE_ABBR,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1',
	'MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP',
	'NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

cw_pol_count AS -- CW Policy Inforce Counts
(
	SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_IND,'Inforce') as Key,
	zero_cond_scorecard(18, ME_DT, POL_INFORCE_CNT) AS "18",
	zero_cond_scorecard(17, ME_DT, POL_INFORCE_CNT) AS "17",
	zero_cond_scorecard(16, ME_DT, POL_INFORCE_CNT) AS "16",
	zero_cond_scorecard(15, ME_DT, POL_INFORCE_CNT) AS "15",
	zero_cond_scorecard(14, ME_DT, POL_INFORCE_CNT) AS "14",
	zero_cond_scorecard(13, ME_DT, POL_INFORCE_CNT) AS "13",
	zero_cond_scorecard(12, ME_DT, POL_INFORCE_CNT) AS "12",
	zero_cond_scorecard(11, ME_DT, POL_INFORCE_CNT) AS "11",
	zero_cond_scorecard(10, ME_DT, POL_INFORCE_CNT) AS "10",
	zero_cond_scorecard(9, ME_DT, POL_INFORCE_CNT) AS "9",
	zero_cond_scorecard(8, ME_DT, POL_INFORCE_CNT) AS "8",
	zero_cond_scorecard(7, ME_DT, POL_INFORCE_CNT) AS "7",
	zero_cond_scorecard(6, ME_DT, POL_INFORCE_CNT) AS "6",
	zero_cond_scorecard(5, ME_DT, POL_INFORCE_CNT) AS "5",
	zero_cond_scorecard(4, ME_DT, POL_INFORCE_CNT) AS "4",
	zero_cond_scorecard(3, ME_DT, POL_INFORCE_CNT) AS "3",
	zero_cond_scorecard(2, ME_DT, POL_INFORCE_CNT) AS "2",
	zero_cond_scorecard(1, ME_DT, POL_INFORCE_CNT) AS "1",
	zero_cond_scorecard(0, ME_DT, POL_INFORCE_CNT) AS "0",
	TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
	WHERE BUS_UNIT_ABBR IN ('AARP','AGCY') 
	AND CONCAT(STATE_ABBR,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1',
	'MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP',
	'NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

cw_wp AS -- CW Written Premium
(
	SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_IND,'Written Premium') as Key,
	zero_cond_scorecard(18, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "18",
	zero_cond_scorecard(17, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "17",
	zero_cond_scorecard(16, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "16",
	zero_cond_scorecard(15, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "15",
	zero_cond_scorecard(14, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "14",
	zero_cond_scorecard(13, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "13",
	zero_cond_scorecard(12, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "12",
	zero_cond_scorecard(11, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "11",
	zero_cond_scorecard(10, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "10",
	zero_cond_scorecard(9, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "9",
	zero_cond_scorecard(8, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "8",
	zero_cond_scorecard(7, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "7",
	zero_cond_scorecard(6, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "6",
	zero_cond_scorecard(5, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "5",
	zero_cond_scorecard(4, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "4",
	zero_cond_scorecard(3, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "3",
	zero_cond_scorecard(2, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "2",
	zero_cond_scorecard(1, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "1",
	zero_cond_scorecard(0, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "0",
	TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
	WHERE BUS_UNIT_ABBR IN ('AARP','AGCY') 
	AND CONCAT(STATE_ABBR,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1',
	'MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP',
	'NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

region_pol_count AS -- Regional Policy Inforce Counts
(
	SELECT CONCAT(GET_REGION_SCORECARD(STATE_ABBR),BUS_UNIT_ABBR,NEWCO_IND,'Inforce') as Key,
	zero_cond_scorecard(18, ME_DT, POL_INFORCE_CNT) AS "18",
	zero_cond_scorecard(17, ME_DT, POL_INFORCE_CNT) AS "17",
	zero_cond_scorecard(16, ME_DT, POL_INFORCE_CNT) AS "16",
	zero_cond_scorecard(15, ME_DT, POL_INFORCE_CNT) AS "15",
	zero_cond_scorecard(14, ME_DT, POL_INFORCE_CNT) AS "14",
	zero_cond_scorecard(13, ME_DT, POL_INFORCE_CNT) AS "13",
	zero_cond_scorecard(12, ME_DT, POL_INFORCE_CNT) AS "12",
	zero_cond_scorecard(11, ME_DT, POL_INFORCE_CNT) AS "11",
	zero_cond_scorecard(10, ME_DT, POL_INFORCE_CNT) AS "10",
	zero_cond_scorecard(9, ME_DT, POL_INFORCE_CNT) AS "9",
	zero_cond_scorecard(8, ME_DT, POL_INFORCE_CNT) AS "8",
	zero_cond_scorecard(7, ME_DT, POL_INFORCE_CNT) AS "7",
	zero_cond_scorecard(6, ME_DT, POL_INFORCE_CNT) AS "6",
	zero_cond_scorecard(5, ME_DT, POL_INFORCE_CNT) AS "5",
	zero_cond_scorecard(4, ME_DT, POL_INFORCE_CNT) AS "4",
	zero_cond_scorecard(3, ME_DT, POL_INFORCE_CNT) AS "3",
	zero_cond_scorecard(2, ME_DT, POL_INFORCE_CNT) AS "2",
	zero_cond_scorecard(1, ME_DT, POL_INFORCE_CNT) AS "1",
	zero_cond_scorecard(0, ME_DT, POL_INFORCE_CNT) AS "0",
	TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
	WHERE BUS_UNIT_ABBR IN ('AARP','AGCY') 
	AND CONCAT(STATE_ABBR,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1',
	'MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP',
	'NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

region_wp AS -- Regional Written Premium
(
	SELECT CONCAT(GET_REGION_SCORECARD(STATE_ABBR),BUS_UNIT_ABBR,NEWCO_IND,'Written Premium') as Key,
	zero_cond_scorecard(18, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "18",
	zero_cond_scorecard(17, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "17",
	zero_cond_scorecard(16, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "16",
	zero_cond_scorecard(15, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "15",
	zero_cond_scorecard(14, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "14",
	zero_cond_scorecard(13, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "13",
	zero_cond_scorecard(12, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "12",
	zero_cond_scorecard(11, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "11",
	zero_cond_scorecard(10, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "10",
	zero_cond_scorecard(9, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "9",
	zero_cond_scorecard(8, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "8",
	zero_cond_scorecard(7, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "7",
	zero_cond_scorecard(6, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "6",
	zero_cond_scorecard(5, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "5",
	zero_cond_scorecard(4, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "4",
	zero_cond_scorecard(3, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "3",
	zero_cond_scorecard(2, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "2",
	zero_cond_scorecard(1, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "1",
	zero_cond_scorecard(0, ME_DT, POL_ANNL_TTL_BILL_PREM_AMT) AS "0",
	TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
	FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND"
	WHERE BUS_UNIT_ABBR IN ('AARP','AGCY') 
	AND CONCAT(STATE_ABBR,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1',
	'MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP',
	'NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

state_e_30_r AS -- Persistency calculations for State E+30 R
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 R') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

state_e_0_r AS -- Persistency calculations for State E+0 R
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+0 R') as Key,
    perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "18",
    perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "17",
    perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "16",
    perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "15",
    perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "14",
    perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "13",
    perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "12",
    perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "11",
    perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "10",
    perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "9",
    perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "8",
    perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "7",
    perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "6",
    perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "5",
    perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "4",
    perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "3",
    perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "2",
    perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "1",
    perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

state_e_ult_r AS -- Persistency calculations for State E+Ult R
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+Ult R') as Key,
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN ULT_ATR_CNT ELSE 0 END)) AS "18",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN ULT_ATR_CNT ELSE 0 END)) AS "17",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN ULT_ATR_CNT ELSE 0 END)) AS "16",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN ULT_ATR_CNT ELSE 0 END)) AS "15",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN ULT_ATR_CNT ELSE 0 END)) AS "14",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN ULT_ATR_CNT ELSE 0 END)) AS "13",					 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN ULT_ATR_CNT ELSE 0 END)) AS "12",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN ULT_ATR_CNT ELSE 0 END)) AS "11",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN ULT_ATR_CNT ELSE 0 END)) AS "10",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN ULT_ATR_CNT ELSE 0 END)) AS "9",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN ULT_ATR_CNT ELSE 0 END)) AS "8",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN ULT_ATR_CNT ELSE 0 END)) AS "7",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN ULT_ATR_CNT ELSE 0 END)) AS "6",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN ULT_ATR_CNT ELSE 0 END)) AS "5",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN ULT_ATR_CNT ELSE 0 END)) AS "4",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN ULT_ATR_CNT ELSE 0 END)) AS "3",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN ULT_ATR_CNT ELSE 0 END)) AS "2",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN ULT_ATR_CNT ELSE 0 END)) AS "1",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN ULT_ATR_CNT ELSE 0 END)) AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

state_prem_change AS -- Premium Changes by State
(
    SELECT CONCAT(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'PremiumChange') as Key,
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "18",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "17",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "16",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "15",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "14",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "13",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "12",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "11",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "10",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "9",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "8",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "7",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "6",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "5",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "4",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "3",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "2",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "1",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

cw_e_30_r AS -- Persistency calculations for CW E+30 R
(
    SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 R') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

cw_e_0_r AS -- Persistency calculations for CW E+0 R
(
    SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+0 R') as Key,
    perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "18",
    perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "17",
    perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "16",
    perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "15",
    perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "14",
    perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "13",
    perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "12",
    perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "11",
    perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "10",
    perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "9",
    perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "8",
    perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "7",
    perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "6",
    perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "5",
    perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "4",
    perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "3",
    perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "2",
    perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "1",
    perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

cw_e_ult_r AS -- Persistency calculations for CW E+Ult R
(
    SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+Ult R') as Key,
    1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN ULT_ATR_CNT ELSE 0 END)) AS "18",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN ULT_ATR_CNT ELSE 0 END)) AS "17",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN ULT_ATR_CNT ELSE 0 END)) AS "16",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN ULT_ATR_CNT ELSE 0 END)) AS "15",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN ULT_ATR_CNT ELSE 0 END)) AS "14",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN ULT_ATR_CNT ELSE 0 END)) AS "13",					 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN ULT_ATR_CNT ELSE 0 END)) AS "12",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN ULT_ATR_CNT ELSE 0 END)) AS "11",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN ULT_ATR_CNT ELSE 0 END)) AS "10",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN ULT_ATR_CNT ELSE 0 END)) AS "9",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN ULT_ATR_CNT ELSE 0 END)) AS "8",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN ULT_ATR_CNT ELSE 0 END)) AS "7",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN ULT_ATR_CNT ELSE 0 END)) AS "6",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN ULT_ATR_CNT ELSE 0 END)) AS "5",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN ULT_ATR_CNT ELSE 0 END)) AS "4",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN ULT_ATR_CNT ELSE 0 END)) AS "3",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN ULT_ATR_CNT ELSE 0 END)) AS "2",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN ULT_ATR_CNT ELSE 0 END)) AS "1",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN ULT_ATR_CNT ELSE 0 END)) AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

cw_prem_change AS -- CW Premium Changes
(
    SELECT CONCAT('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'PremiumChange') as Key,
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "18",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "17",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "16",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "15",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "14",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "13",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "12",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "11",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "10",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "9",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "8",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "7",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "6",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "5",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "4",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "3",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "2",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "1",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

region_e_30_r AS -- Persistency calculations for Regional E+30 R
(
    SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 R') as Key,
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
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

region_e_0_r AS -- Persistency calculations for Regional E+0 R
(
    SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+0 R') as Key,
    perst_calc_scorecard(18, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "18",
    perst_calc_scorecard(17, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "17",
    perst_calc_scorecard(16, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "16",
    perst_calc_scorecard(15, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "15",
    perst_calc_scorecard(14, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "14",
    perst_calc_scorecard(13, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "13",
    perst_calc_scorecard(12, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "12",
    perst_calc_scorecard(11, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "11",
    perst_calc_scorecard(10, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "10",
    perst_calc_scorecard(9, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "9",
    perst_calc_scorecard(8, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "8",
    perst_calc_scorecard(7, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "7",
    perst_calc_scorecard(6, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "6",
    perst_calc_scorecard(5, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "5",
    perst_calc_scorecard(4, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "4",
    perst_calc_scorecard(3, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "3",
    perst_calc_scorecard(2, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "2",
    perst_calc_scorecard(1, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "1",
    perst_calc_scorecard(0, POL_EFF_DT, CANCEL_E_FLAT, ATR_E_FLAT) AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

region_e_ult_r AS -- Persistency calculations for Regional E+Ult R
(
    SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+Ult R') as Key,
    1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN ULT_ATR_CNT ELSE 0 END)) AS "18",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN ULT_ATR_CNT ELSE 0 END)) AS "17",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN ULT_ATR_CNT ELSE 0 END)) AS "16",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN ULT_ATR_CNT ELSE 0 END)) AS "15",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN ULT_ATR_CNT ELSE 0 END)) AS "14",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN ULT_ATR_CNT ELSE 0 END)) AS "13",					 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN ULT_ATR_CNT ELSE 0 END)) AS "12",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN ULT_ATR_CNT ELSE 0 END)) AS "11",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN ULT_ATR_CNT ELSE 0 END)) AS "10",			 
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN ULT_ATR_CNT ELSE 0 END)) AS "9",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN ULT_ATR_CNT ELSE 0 END)) AS "8",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN ULT_ATR_CNT ELSE 0 END)) AS "7",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN ULT_ATR_CNT ELSE 0 END)) AS "6",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN ULT_ATR_CNT ELSE 0 END)) AS "5",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN ULT_ATR_CNT ELSE 0 END)) AS "4",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN ULT_ATR_CNT ELSE 0 END)) AS "3",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN ULT_ATR_CNT ELSE 0 END)) AS "2",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN ULT_ATR_CNT ELSE 0 END)) AS "1",
	1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN ULT_CANC_CNT ELSE 0 END),
				 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN ULT_ATR_CNT ELSE 0 END)) AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
),

region_prem_change AS -- Premium Changes by Region
(
    SELECT CONCAT(GET_REGION_SCORECARD(RISK_STATE),BUS_UNIT_ABBR,NEWCO_INDICATOR,'PremiumChange') as Key,
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 18 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "18",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 17 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "17",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 16 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "16",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 15 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "15",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 14 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "14",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 13 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "13",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 12 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "12",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 11 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "11",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 10 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "10",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 9 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "9",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 8 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "8",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 7 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "7",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 6 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "6",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 5 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "5",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 4 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "4",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 3 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "3",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 2 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "2",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 1 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "1",
	DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN FIRST_TRANS_PREM ELSE 0 END),
			 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = 0 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END)) - 1 AS "0",
    TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
    FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"
	WHERE POL_NEW_RENEW_CD = 'R' AND POL_EFF_DT >= '2023-01-01' AND BUS_UNIT_ABBR <> 'CDRT' AND LOB = 'AUTO' AND ATR_E_30 = 1
	AND CONCAT(RISK_STATE,RATE_PLAN_CD) IN ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG',
	'FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG',
	'MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1',
	'NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1',
	'TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
	GROUP BY Key
)

SELECT * FROM
(
	SELECT * FROM state_e_30_nb
	UNION ALL
	SELECT * FROM region_e_30_nb
	UNION ALL
	SELECT * FROM cw_e_30_nb
	UNION ALL
	SELECT * FROM state_e_60_nb
	UNION ALL
	SELECT * FROM region_e_60_nb
	UNION ALL
	SELECT * FROM cw_e_60_nb
	UNION ALL
	SELECT * FROM state_e_90_nb
	UNION ALL
	SELECT * FROM region_e_90_nb
	UNION ALL
	SELECT * FROM cw_e_90_nb 
	UNION ALL
	SELECT * FROM state_pol_count
	UNION ALL
	SELECT * FROM state_wp
	UNION ALL
	SELECT * FROM cw_pol_count
	UNION ALL
	SELECT * FROM cw_wp
	UNION ALL
	SELECT * FROM region_pol_count
	UNION ALL
	SELECT * FROM region_wp
	UNION ALL
	SELECT * FROM state_e_30_r
	UNION ALL
	SELECT * FROM state_e_0_r
	UNION ALL
	SELECT * FROM state_e_ult_r
	UNION ALL
	SELECT * FROM state_prem_change
	UNION ALL
	SELECT * FROM cw_e_30_r
	UNION ALL
	SELECT * FROM cw_e_0_r
	UNION ALL
	SELECT * FROM cw_e_ult_r
	UNION ALL
	SELECT * FROM cw_prem_change
	UNION ALL
	SELECT * FROM region_e_30_r
	UNION ALL
	SELECT * FROM region_e_0_r
	UNION ALL
	SELECT * FROM region_e_ult_r
	UNION ALL
	SELECT * FROM region_prem_change
)
ORDER BY KEY