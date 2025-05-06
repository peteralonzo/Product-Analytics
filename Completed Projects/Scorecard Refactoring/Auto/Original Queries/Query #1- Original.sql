(SELECT
  concat('Response','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN RESP_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN RESP_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN RESP_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN RESP_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN RESP_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN RESP_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN RESP_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN RESP_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN RESP_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "YTD", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" GROUP BY Key)
-- ------------------------
UNION ALL
------------------------
(SELECT
  concat('Response',
         'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN RESP_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN RESP_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN RESP_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN RESP_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN RESP_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN RESP_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN RESP_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN RESP_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN RESP_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(Year,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "YTD",

  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Response','NewCo','CW',BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN RESP_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN RESP_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN RESP_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN RESP_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN RESP_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN RESP_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN RESP_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN RESP_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN RESP_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(year,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" GROUP BY Key)

Union All
-------------------------------------------------------------------------------------------------------------NOWCO Response----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Response','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(year,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "YTD", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Response',
         'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Response','NowCo','CW',BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(year,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' GROUP BY Key)
union all
-----------------------------------------------------------------------------------------------------------NEWCO Phone Response----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Phone Response','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN RESP_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN RESP_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN RESP_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN RESP_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN RESP_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN RESP_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN RESP_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN RESP_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN RESP_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(year,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "ytd",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Response','NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN RESP_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN RESP_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN RESP_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN RESP_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN RESP_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN RESP_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN RESP_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN RESP_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN RESP_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(year,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "ytd",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Phone Response','NewCo','CW',BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN RESP_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN RESP_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN RESP_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN RESP_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN RESP_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN RESP_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN RESP_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN RESP_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN RESP_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN RESP_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)

Union All
-----------------------------------------------------------------------------------------------------------NOWCO Phone Response----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Phone Response','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Response','NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and ORIG_QUOTE_PROCESS_METH_CD = 'T'GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Phone Response','NowCo','CW',BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
Union all
-----------------------------------------------------------------------------------------------------------NEWCO Phone Completed Quote----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Phone Completed Quote','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(year,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Completed Quote', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)
----------------------
UNION ALL
------------------------
(SELECT
  concat('Phone Completed Quote','NewCo','CW',BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)

Union All
-----------------------------------------------------------------------------------------------------------NOWCO Phone Completed Quote----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Phone Completed Quote','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Completed Quote', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and ORIG_QUOTE_PROCESS_METH_CD = 'T'GROUP BY Key)
----------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Completed Quote','NowCo','CW',BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
Union All
----------------------------------------------------------------------------------------------------------- NEWCO Issue Count----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Issue','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Issue', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Issue','NewCo','CW',BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" GROUP BY Key)

Union All
-----------------------------------------------------------------------------------------------------------NOWCO Phone Completed Quote----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Issue','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Issue', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('Issue','NowCo','CW',BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' GROUP BY Key)
Union all 
----------------------------------------------------------------------------------------------------------- NEWCO Phone Issue Count----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Phone Issue','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Issue', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",  
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)
----------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Issue','NewCo','CW',BU_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ORIG_QTE_CNTCT_METH_CD = 'P' GROUP BY Key)

Union All
-----------------------------------------------------------------------------------------------------------NOWCO Phone Completed Quote----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Phone Issue','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",  
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and ORIG_QUOTE_PROCESS_METH_CD = 'T'GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Issue', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and ORIG_QUOTE_PROCESS_METH_CD = 'T'GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Phone Issue','NowCo','CW',BUS_UNIT_ABBR) as Key,
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "18",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "17",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "16",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "15",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "14",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "13",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "12",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "11",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "10",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "9",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "8",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "7",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "6",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "5",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "4",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "3",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "2",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "1",
  TRUNC(sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "0",
  TRUNC(sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and ORIG_QUOTE_PROCESS_METH_CD = 'T'GROUP BY Key)
Union All
----------------------------------------------------------------------------------------------------------- NEWCO AIP----------------------------------------------------------------------------------------------------------
(SELECT
  concat('AIP','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ISSUE_IND = 'Y' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('AIP', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ISSUE_IND = 'Y' GROUP BY Key)
----------------------
UNION ALL
------------------------
(SELECT
  concat('AIP','NewCo','CW',BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where ISSUE_IND = 'Y' GROUP BY Key)
Union All
-----------------------------------------------------------------------------------------------------------NOWCO AIP----------------------------------------------------------------------------------------------------------
(SELECT
  concat('AIP','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",  
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ISSUE_IND = 'Y' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('AIP', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ISSUE_IND = 'Y' GROUP BY Key)
----------------------
UNION ALL
----------------------
(SELECT
  concat('AIP','NowCo','CW',BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and ISSUE_IND = 'Y' GROUP BY Key)

Union all
-----------------------------------------------------------------------------------------------------------NEWCO Completed Quote----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Completed Quotes','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where COMPL_QTE_IND = 'Y' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Completed Quotes', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where COMPL_QTE_IND = 'Y' GROUP BY Key)
----------------------
UNION ALL
------------------------
(SELECT
  concat('Completed Quotes','NewCo','CW',BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())=9 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())=8 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())=7 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())=6 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())=5 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())=4 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())=3 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())=2 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())=1 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())=0 THEN COMPL_QTE_IND_CNT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" Where COMPL_QTE_IND = 'Y' GROUP BY Key)

Union All
-----------------------------------------------------------------------------------------------------------NOWCO Completed Quote----------------------------------------------------------------------------------------------------------
(SELECT
  concat('Completed Quotes','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'and COMPL_QUOTE_IND = 'Y' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Completed Quotes', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "YTD",  
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'and COMPL_QUOTE_IND = 'Y' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('Completed Quotes','NowCo','CW',BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=9 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=8 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=7 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=6 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=5 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=4 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=3 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=2 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=1 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())=0 THEN COMPL_QUOTE_IND_CNT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'and COMPL_QUOTE_IND = 'Y' GROUP BY Key)
Union all
-----------------------------------------------------------------------------------------------------------NEWCO HIG/SRP----------------------------------------------------------------------------------------------------------
(SELECT
  concat('HIGSRP','NewCo',RISK_ST_ABBR,BU_ABBR) as Key, 
 nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=18 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "18",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=17 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "17",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=16 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "16",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=15 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "15",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=14 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "14",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=13 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "13",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=12 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "12",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=11 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "11",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=10 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "10",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 9 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "9",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 8 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "8",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 7 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "7",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 6 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "6",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 5 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "5",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 4 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "4",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 3 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "3",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 2 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "2",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 1 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "1",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 0 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "0",
nullifzero(Avg((case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "YTD", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where COMPL_QTE_IND_CNT = 1 AND PCARR_POL_TERM_MO_CNT = 6 AND PCARR_POL_ANNL_PREM_AMT > 249 AND PCARR_POL_ANNL_PREM_AMT < 6000 AND POL_ANNL_TTL_BILL_PREM_AMT > 200 AND  CNTCT_METH_CD = 'P' GROUP BY Key)
----------------------
UNION ALL
----------------------
(SELECT
  concat('HIGSRP', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=18 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "18",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=17 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "17",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=16 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "16",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=15 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "15",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=14 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "14",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=13 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "13",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=12 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "12",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=11 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "11",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=10 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "10",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 9 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "9",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 8 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "8",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 7 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "7",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 6 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "6",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 5 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "5",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 4 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "4",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 3 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "3",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 2 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "2",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 1 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "1",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 0 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "0",
nullifzero(Avg((case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where COMPL_QTE_IND_CNT = 1 AND PCARR_POL_TERM_MO_CNT = 6 AND PCARR_POL_ANNL_PREM_AMT > 249 AND PCARR_POL_ANNL_PREM_AMT < 6000 AND POL_ANNL_TTL_BILL_PREM_AMT > 200 AND  CNTCT_METH_CD = 'P' GROUP BY Key)
----------------------
UNION ALL
----------------------
(SELECT
  concat('HIGSRP','NewCo','CW',BU_ABBR) as Key,
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=18 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "18",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=17 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "17",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=16 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "16",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=15 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "15",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=14 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "14",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=13 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "13",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=12 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "12",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=11 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "11",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())=10 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "10",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 9 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "9",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 8 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "8",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 7 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "7",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 6 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "6",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 5 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "5",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 4 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "4",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 3 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "3",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 2 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "2",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 1 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "1",
nullifzero(Avg((case when Datediff(month,TRANS_DT,sysdate())= 0 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "0",
nullifzero(Avg((case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN (POL_ANNL_TTL_BILL_PREM_AMT/PCARR_POL_ANNL_PREM_AMT) else null end))) as "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where COMPL_QTE_IND_CNT = 1 AND PCARR_POL_TERM_MO_CNT = 6 AND PCARR_POL_ANNL_PREM_AMT > 249 AND PCARR_POL_ANNL_PREM_AMT < 6000 AND POL_ANNL_TTL_BILL_PREM_AMT > 200 AND  CNTCT_METH_CD = 'P' GROUP BY Key)

Union All
-----------------------------------------------------------------------------------------------------------NOWCO HIG/SRP----------------------------------------------------------------------------------------------------------
(SELECT
  concat('HIGSRP','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key, 
 nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "18",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "17",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "16",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "15",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "14",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "13",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "12",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "11",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "10",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "9",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "8",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "7",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "6",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "5",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "4",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "3",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "2",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "1",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "0",
nullifzero(Avg((case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and COMPL_QUOTE_IND_CNT = 1 AND PRIOR_CARR_POL_ANNUAL_PREM_AMT >= 250 AND ANNUALIZED_PREM_AMT > 300and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('HIGSRP', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "18",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "17",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "16",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "15",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "14",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "13",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "12",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "11",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "10",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "9",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "8",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "7",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "6",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "5",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "4",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "3",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "2",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "1",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "0",
nullifzero(Avg((case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "YTD", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and COMPL_QUOTE_IND_CNT = 1 AND PRIOR_CARR_POL_ANNUAL_PREM_AMT >= 250 AND ANNUALIZED_PREM_AMT > 300and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
----------------------
UNION ALL
----------------------

(SELECT
  concat('HIGSRP','NowCo','CW',BUS_UNIT_ABBR) as Key,
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "18",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "17",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "16",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "15",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "14",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "13",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "12",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "11",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "10",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "9",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "8",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "7",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "6",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "5",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "4",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "3",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "2",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "1",
nullifzero(Avg((case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "0",
nullifzero(Avg((case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN (ANNUALIZED_PREM_AMT/PRIOR_CARR_POL_ANNUAL_PREM_AMT) else null end))) as "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and COMPL_QUOTE_IND_CNT = 1 AND PRIOR_CARR_POL_ANNUAL_PREM_AMT >= 250 AND ANNUALIZED_PREM_AMT > 300and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key)
Union All
----------------------------------------------------------------------------------------------------------- NEWCO AQP----------------------------------------------------------------------------------------------------------
(SELECT
  concat('AQP','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"   Where COMPL_QTE_IND_CNT = '1' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('AQP', 'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "YTD",  
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"  Where  COMPL_QTE_IND_CNT = '1' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('AQP','NewCo','CW',BU_ABBR) as Key,
  sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "18",
  sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "17",
  sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "16",
  sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "15",
  sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "14",
  sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "13",
  sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "12",
  sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "11",
  sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "10",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "9",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "8",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "7",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "6",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "5",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "4",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "3",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "2",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "1",
  sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN POL_TTL_BILL_PREM_AMT*2 ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW"   Where COMPL_QTE_IND_CNT = '1' GROUP BY Key)
Union All
-----------------------------------------------------------------------------------------------------------NOWCO AIP----------------------------------------------------------------------------------------------------------
(SELECT
  concat('AQP','NowCo',RISK_STATE_ABBR,BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and COMPL_QUOTE_IND_CNT = '1' GROUP BY Key)
------------------------
UNION ALL
----------------------
(SELECT
  concat('AQP', 'NowCo',
         (case when RISK_STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT'  and COMPL_QUOTE_IND_CNT = '1' GROUP BY Key)
------------------------
UNION ALL
------------------------
(SELECT
  concat('AQP','NowCo','CW',BUS_UNIT_ABBR) as Key,
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=18 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "18",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=17 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "17",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=16 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "16",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=15 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "15",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=14 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "14",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=13 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "13",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=12 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "12",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=11 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "11",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())=10 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "10",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 9 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "9",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 8 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "8",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 7 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "7",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 6 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "6",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 5 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "5",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 4 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "4",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 3 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "3",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 2 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "2",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 1 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "1",
  sum(case when Datediff(month,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "0",
  sum(case when Datediff(YEAR,QUOTE_LAST_TRANSACTION_DT,sysdate())= 0 THEN ANNUALIZED_PREM_AMT ELSE 0 END) AS "YTD",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR <> 'CDRT' and COMPL_QUOTE_IND_CNT = '1' GROUP BY Key)

Union all 
-------------------------------------------------------------------------------------------------------------NEWCO ULM----------------------------------------------------------------------------------------------------------
(SELECT
  concat('ULM','NewCo',RISK_ST_ABBR,BU_ABBR) as Key,

 
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=18 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END)))) AS "18",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=17 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END)))) AS "17",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=16 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END)))) AS "16",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=15 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END)))) AS "15",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=14 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END)))) AS "14",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=13 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END)))) AS "13",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=12 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END)))) AS "12",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=11 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END)))) AS "11",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=10 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END)))) AS "10",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 9 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN RESP_IND_CNT ELSE 0 END)))) AS "9",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 8 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN RESP_IND_CNT ELSE 0 END)))) AS "8",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 7 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN RESP_IND_CNT ELSE 0 END)))) AS "7",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 6 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN RESP_IND_CNT ELSE 0 END)))) AS "6",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 5 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN RESP_IND_CNT ELSE 0 END)))) AS "5",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 4 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN RESP_IND_CNT ELSE 0 END)))) AS "4",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 3 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN RESP_IND_CNT ELSE 0 END)))) AS "3",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 2 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN RESP_IND_CNT ELSE 0 END)))) AS "2",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 1 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN RESP_IND_CNT ELSE 0 END)))) AS "1",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 0 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN RESP_IND_CNT ELSE 0 END)))) AS "0",
   (Div0null((sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN RESP_IND_CNT ELSE 0 END)))) AS "0", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" t1


 left join (select INPUT_QUOTENUMBER, TREATMENTDECISION
          from "DSC_PLBI_DB"."APP_AUTO_DEV"."AUTO_ULM_QUOTE_VW"
          group by INPUT_QUOTENUMBER, TREATMENTDECISION) t2
          on t1.QCN=t2.INPUT_QUOTENUMBER 
 
  where ORIG_QTE_CNTCT_METH_CD = 'I' and TREATMENTDECISION in(1,0)
GROUP BY Key)

 Union All 
 
(SELECT
  concat('ULM','NewCo','CW',BU_ABBR) as Key,

 
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=18 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END)))) AS "18",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=17 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END)))) AS "17",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=16 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END)))) AS "16",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=15 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END)))) AS "15",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=14 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END)))) AS "14",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=13 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END)))) AS "13",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=12 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END)))) AS "12",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=11 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END)))) AS "11",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=10 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END)))) AS "10",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 9 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN RESP_IND_CNT ELSE 0 END)))) AS "9",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 8 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN RESP_IND_CNT ELSE 0 END)))) AS "8",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 7 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN RESP_IND_CNT ELSE 0 END)))) AS "7",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 6 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN RESP_IND_CNT ELSE 0 END)))) AS "6",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 5 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN RESP_IND_CNT ELSE 0 END)))) AS "5",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 4 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN RESP_IND_CNT ELSE 0 END)))) AS "4",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 3 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN RESP_IND_CNT ELSE 0 END)))) AS "3",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 2 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN RESP_IND_CNT ELSE 0 END)))) AS "2",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 1 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN RESP_IND_CNT ELSE 0 END)))) AS "1",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 0 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN RESP_IND_CNT ELSE 0 END)))) AS "0",
   (Div0null((sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN RESP_IND_CNT ELSE 0 END)))) AS "YTD", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" t1


 left join (select INPUT_QUOTENUMBER, TREATMENTDECISION
          from "DSC_PLBI_DB"."APP_AUTO_DEV"."AUTO_ULM_QUOTE_VW"
          group by INPUT_QUOTENUMBER, TREATMENTDECISION) t2
          on t1.QCN=t2.INPUT_QUOTENUMBER 
 
  where ORIG_QTE_CNTCT_METH_CD = 'I' and TREATMENTDECISION in(1,0)
GROUP BY Key)
  Union All 
 
(SELECT
  concat('ULM',
         'NewCo',
         (case when RISK_ST_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast' when RISK_ST_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
               when RISK_ST_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' when RISK_ST_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end), BU_ABBR) as Key,

 
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=18 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=18 THEN RESP_IND_CNT ELSE 0 END)))) AS "18",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=17 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=17 THEN RESP_IND_CNT ELSE 0 END)))) AS "17",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=16 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=16 THEN RESP_IND_CNT ELSE 0 END)))) AS "16",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=15 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=15 THEN RESP_IND_CNT ELSE 0 END)))) AS "15",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=14 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=14 THEN RESP_IND_CNT ELSE 0 END)))) AS "14",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=13 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=13 THEN RESP_IND_CNT ELSE 0 END)))) AS "13",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=12 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=12 THEN RESP_IND_CNT ELSE 0 END)))) AS "12",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=11 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=11 THEN RESP_IND_CNT ELSE 0 END)))) AS "11",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())=10 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())=10 THEN RESP_IND_CNT ELSE 0 END)))) AS "10",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 9 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 9 THEN RESP_IND_CNT ELSE 0 END)))) AS "9",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 8 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 8 THEN RESP_IND_CNT ELSE 0 END)))) AS "8",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 7 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 7 THEN RESP_IND_CNT ELSE 0 END)))) AS "7",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 6 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 6 THEN RESP_IND_CNT ELSE 0 END)))) AS "6",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 5 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 5 THEN RESP_IND_CNT ELSE 0 END)))) AS "5",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 4 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 4 THEN RESP_IND_CNT ELSE 0 END)))) AS "4",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 3 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 3 THEN RESP_IND_CNT ELSE 0 END)))) AS "3",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 2 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 2 THEN RESP_IND_CNT ELSE 0 END)))) AS "2",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 1 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 1 THEN RESP_IND_CNT ELSE 0 END)))) AS "1",
   (Div0null((sum(case when Datediff(month,TRANS_DT,sysdate())= 0 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(month,TRANS_DT,sysdate())= 0 THEN RESP_IND_CNT ELSE 0 END)))) AS "0",
   (Div0null((sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 and TREATMENTDECISION = 1 THEN RESP_IND_CNT ELSE 0 END)), (sum(case when Datediff(YEAR,TRANS_DT,sysdate())= 0 THEN RESP_IND_CNT ELSE 0 END)))) AS "YTD", 
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" t1


 left join (select INPUT_QUOTENUMBER, TREATMENTDECISION
          from "DSC_PLBI_DB"."APP_AUTO_DEV"."AUTO_ULM_QUOTE_VW"
          group by INPUT_QUOTENUMBER, TREATMENTDECISION) t2
          on t1.QCN=t2.INPUT_QUOTENUMBER 
 
  where ORIG_QTE_CNTCT_METH_CD = 'I' and TREATMENTDECISION in(1,0)
GROUP BY Key);