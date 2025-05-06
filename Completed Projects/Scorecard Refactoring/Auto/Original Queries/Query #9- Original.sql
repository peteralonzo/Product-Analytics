Select Key, sum("90days") as "90Day",   TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from


(SELECT concat('Response',RISK_ST_ABBR) as Key,
  TRUNC(sum(case when Datediff(DAY,TRANS_DT,sysdate())<=90 THEN RESP_IND_CNT ELSE 0 END),0) AS "90days",
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" Where BU_ABBR ='AARP' and RISK_ST_ABBR is not null and ORIG_QTE_CNTCT_METH_CD = 'P'  GROUP BY Key
Union all

SELECT  concat('Response',RISK_STATE_ABBR) as Key,
  TRUNC(sum(case when Datediff(DAY,QUOTE_LAST_TRANSACTION_DT,sysdate())<=90 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "90days",
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key) 

group by Key, AS_OF
------------------------

Union all 

Select Key, sum("90days") as "90Day",   TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from


(SELECT concat('Issues',RISK_ST_ABBR) as Key,
  TRUNC(sum(case when Datediff(DAY,TRANS_DT,sysdate())<=90 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "90days",
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" Where BU_ABBR ='AARP' and RISK_ST_ABBR is not null and ORIG_QTE_CNTCT_METH_CD = 'P'  GROUP BY Key
Union all

SELECT  concat('Issues',RISK_STATE_ABBR) as Key,
  TRUNC(sum(case when Datediff(DAY,QUOTE_LAST_TRANSACTION_DT,sysdate())<=90 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "90days",
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key) 

group by Key, AS_OF

Union all 


Select Key, sum("90days") as "90Day",   TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from


(SELECT concat('Response','CW') as Key,
  TRUNC(sum(case when Datediff(DAY,TRANS_DT,sysdate())<=90 THEN RESP_IND_CNT ELSE 0 END),0) AS "90days",
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" Where BU_ABBR ='AARP' and RISK_ST_ABBR is not null and ORIG_QTE_CNTCT_METH_CD = 'P'  GROUP BY Key
Union all

SELECT  concat('Response','CW') as Key,
  TRUNC(sum(case when Datediff(DAY,QUOTE_LAST_TRANSACTION_DT,sysdate())<=90 THEN RESPONSE_IND_CNT ELSE 0 END),0) AS "90days",
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key) 

group by Key, AS_OF
------------------------

Union all 

Select Key, sum("90days") as "90Day",   TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from


(SELECT concat('Issues','CW') as Key,
  TRUNC(sum(case when Datediff(DAY,TRANS_DT,sysdate())<=90 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "90days",
FROM "PRD_PL_DB"."APP_DCPA_DM"."AUTO_QUOTE_LATST_VW" Where BU_ABBR ='AARP' and RISK_ST_ABBR is not null and ORIG_QTE_CNTCT_METH_CD = 'P'  GROUP BY Key
Union all

SELECT  concat('Issues','CW') as Key,
  TRUNC(sum(case when Datediff(DAY,QUOTE_LAST_TRANSACTION_DT,sysdate())<=90 THEN ISSUE_IND_CNT ELSE 0 END),0) AS "90days",
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_QUOTE_FLOW_SCDI_MODEL_VW" Where BUS_UNIT_ABBR = 'AARP' and ORIG_QUOTE_PROCESS_METH_CD = 'T' GROUP BY Key) 

group by Key, AS_OF


Union all 

SELECT
  Concat('E+60 R',RISK_STATE) as Key,
  1-(Div0null((sum(case when Datediff(Day,POL_EFF_DT,sysdate())<=150 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(Day,POL_EFF_DT,sysdate())<=150 THEN ATR_E_60 ELSE 0 END)))) AS "18",  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R'and BUS_UNIT_ABBR = 'AARP' and LOB = 'AUTO' and ATR_E_60 = 1
group by Key, AS_OF


Union all 

SELECT
  Concat('E+60 R','CW') as Key,
  1-(Div0null((sum(case when Datediff(Day,POL_EFF_DT,sysdate())<=150 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(Day,POL_EFF_DT,sysdate())<=150 THEN ATR_E_60 ELSE 0 END)))) AS "18",  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R'and BUS_UNIT_ABBR = 'AARP' and LOB = 'AUTO' and ATR_E_60 = 1
group by Key, AS_OF

order by Key;