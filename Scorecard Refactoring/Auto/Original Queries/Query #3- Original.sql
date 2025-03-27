 (SELECT
  concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_30 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_30 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_30 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_30 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_30 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_30 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_30 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_30 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_30 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_30 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_30 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_30 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_30 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_30 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_30 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_30 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_30 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_30 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_30 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

  
  
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
------------------------   
union all       
 (SELECT
  concat((case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'
       when RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
       when RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
       when RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_30 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_30 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_30 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_30 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_30 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_30 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_30 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_30 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_30 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_30 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_30 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_30 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_30 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_30 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_30 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_30 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_30 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_30 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_30 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
Union all 

 (SELECT
   concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+30 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_30 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_30 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_30 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_30 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_30 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_30 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_30 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_30 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_30 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_30 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_30 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_30 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_30 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_30 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_30 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_30 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_30 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_30 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_30 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Union all 
 (SELECT
   concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+60 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_60 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_60 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_60 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_60 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_60 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_60 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_60 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_60 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_60 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_60 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_60 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_60 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_60 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_60 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_60 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_60 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_60 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_60 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_60 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
------------------------   
union all       
 (SELECT
  concat((case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'
       when RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
       when RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
       when RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+60 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_60 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_60 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_60 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_60 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_60 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_60 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_60 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_60 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_60 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_60 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_60 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_60 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_60 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_60 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_60 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_60 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_60 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_60 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_60 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
Union all 

 (SELECT
  concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+60 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_60 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_60 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_60 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_60 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_60 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_60 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_60 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_60 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_60 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_60 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_60 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_60 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_60 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_60 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_60 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_60 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_60 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_60 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_60 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_60 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Union all 
 (SELECT
  concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+90 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_90 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_90 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_90 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_90 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_90 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_90 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_90 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_90 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_90 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_90 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_90 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_90 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_90 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_90 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_90 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_90 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_90 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_90 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_90 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
------------------------   
union all       
 (SELECT
  concat((case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'
       when RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
       when RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
       when RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 'Unknown' end),BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+90 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_90 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_90 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_90 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_90 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_90 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_90 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_90 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_90 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_90 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_90 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_90 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_90 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_90 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_90 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_90 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_90 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_90 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_90 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_90 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)
Union all 

 (SELECT
  concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,'E+90 NB') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_90 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_90 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_90 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_90 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_90 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_90 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_90 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_90 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_90 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_90 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_90 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_90 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_90 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_90 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_90 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_90 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_90 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_90 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_90 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_90 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'N' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1  GROUP BY Key)

----------------------
Union all Select 

Concat(STATE_ABBR,BUS_UNIT_ABBR,NEWCO_IND,
'Inforce') as Key,
  sum(case when Datediff(month,ME_DT,sysdate())=18 THEN POL_INFORCE_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,ME_DT,sysdate())=17 THEN POL_INFORCE_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,ME_DT,sysdate())=16 THEN POL_INFORCE_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,ME_DT,sysdate())=15 THEN POL_INFORCE_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,ME_DT,sysdate())=14 THEN POL_INFORCE_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,ME_DT,sysdate())=13 THEN POL_INFORCE_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,ME_DT,sysdate())=12 THEN POL_INFORCE_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,ME_DT,sysdate())=11 THEN POL_INFORCE_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,ME_DT,sysdate())=10 THEN POL_INFORCE_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,ME_DT,sysdate())=9 THEN POL_INFORCE_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,ME_DT,sysdate())=8 THEN POL_INFORCE_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,ME_DT,sysdate())=7 THEN POL_INFORCE_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,ME_DT,sysdate())=6 THEN POL_INFORCE_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,ME_DT,sysdate())=5 THEN POL_INFORCE_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,ME_DT,sysdate())=4 THEN POL_INFORCE_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,ME_DT,sysdate())=3 THEN POL_INFORCE_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,ME_DT,sysdate())=2 THEN POL_INFORCE_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,ME_DT,sysdate())=1 THEN POL_INFORCE_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,ME_DT,sysdate())=0 THEN POL_INFORCE_CNT ELSE 0 END) AS "0",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
Where BUS_UNIT_ABBR in ('AARP','AGCY') 
and concat(STATE_ABBR,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all Select
Concat(STATE_ABBR,BUS_UNIT_ABBR,NEWCO_IND,
'Written Premium') as Key,
 sum(case when Datediff(month,ME_DT,sysdate())=18 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "18",
 sum(case when Datediff(month,ME_DT,sysdate())=17 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "17",
 sum(case when Datediff(month,ME_DT,sysdate())=16 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "16",
 sum(case when Datediff(month,ME_DT,sysdate())=15 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "15",
 sum(case when Datediff(month,ME_DT,sysdate())=14 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "14",
 sum(case when Datediff(month,ME_DT,sysdate())=13 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "13",
 sum(case when Datediff(month,ME_DT,sysdate())=12 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "12",
 sum(case when Datediff(month,ME_DT,sysdate())=11 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "11",
 sum(case when Datediff(month,ME_DT,sysdate())=10 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "10",
 sum(case when Datediff(month,ME_DT,sysdate())=9 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "9",
 sum(case when Datediff(month,ME_DT,sysdate())=8 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "8",
 sum(case when Datediff(month,ME_DT,sysdate())=7 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "7",
 sum(case when Datediff(month,ME_DT,sysdate())=6 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "6",
 sum(case when Datediff(month,ME_DT,sysdate())=5 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "5",
 sum(case when Datediff(month,ME_DT,sysdate())=4 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "4",
 sum(case when Datediff(month,ME_DT,sysdate())=3 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "3",
 sum(case when Datediff(month,ME_DT,sysdate())=2 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "2",
 sum(case when Datediff(month,ME_DT,sysdate())=1 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "1",
 sum(case when Datediff(month,ME_DT,sysdate())=0 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "0",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
Where BUS_UNIT_ABBR in ('AARP','AGCY') 
and concat(STATE_ABBR,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all Select 
Concat('CW',BUS_UNIT_ABBR,NEWCO_IND,
'Inforce') as Key,
  sum(case when Datediff(month,ME_DT,sysdate())=18 THEN POL_INFORCE_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,ME_DT,sysdate())=17 THEN POL_INFORCE_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,ME_DT,sysdate())=16 THEN POL_INFORCE_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,ME_DT,sysdate())=15 THEN POL_INFORCE_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,ME_DT,sysdate())=14 THEN POL_INFORCE_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,ME_DT,sysdate())=13 THEN POL_INFORCE_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,ME_DT,sysdate())=12 THEN POL_INFORCE_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,ME_DT,sysdate())=11 THEN POL_INFORCE_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,ME_DT,sysdate())=10 THEN POL_INFORCE_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,ME_DT,sysdate())=9 THEN POL_INFORCE_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,ME_DT,sysdate())=8 THEN POL_INFORCE_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,ME_DT,sysdate())=7 THEN POL_INFORCE_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,ME_DT,sysdate())=6 THEN POL_INFORCE_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,ME_DT,sysdate())=5 THEN POL_INFORCE_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,ME_DT,sysdate())=4 THEN POL_INFORCE_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,ME_DT,sysdate())=3 THEN POL_INFORCE_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,ME_DT,sysdate())=2 THEN POL_INFORCE_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,ME_DT,sysdate())=1 THEN POL_INFORCE_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,ME_DT,sysdate())=0 THEN POL_INFORCE_CNT ELSE 0 END) AS "0",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
Where BUS_UNIT_ABBR in ('AARP','AGCY') 
and concat(STATE_ABBR,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key

Union all Select
Concat('CW',BUS_UNIT_ABBR,NEWCO_IND,
'Written Premium') as Key,
 sum(case when Datediff(month,ME_DT,sysdate())=18 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "18",
 sum(case when Datediff(month,ME_DT,sysdate())=17 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "17",
 sum(case when Datediff(month,ME_DT,sysdate())=16 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "16",
 sum(case when Datediff(month,ME_DT,sysdate())=15 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "15",
 sum(case when Datediff(month,ME_DT,sysdate())=14 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "14",
 sum(case when Datediff(month,ME_DT,sysdate())=13 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "13",
 sum(case when Datediff(month,ME_DT,sysdate())=12 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "12",
 sum(case when Datediff(month,ME_DT,sysdate())=11 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "11",
 sum(case when Datediff(month,ME_DT,sysdate())=10 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "10",
 sum(case when Datediff(month,ME_DT,sysdate())=9 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "9",
 sum(case when Datediff(month,ME_DT,sysdate())=8 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "8",
 sum(case when Datediff(month,ME_DT,sysdate())=7 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "7",
 sum(case when Datediff(month,ME_DT,sysdate())=6 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "6",
 sum(case when Datediff(month,ME_DT,sysdate())=5 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "5",
 sum(case when Datediff(month,ME_DT,sysdate())=4 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "4",
 sum(case when Datediff(month,ME_DT,sysdate())=3 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "3",
 sum(case when Datediff(month,ME_DT,sysdate())=2 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "2",
 sum(case when Datediff(month,ME_DT,sysdate())=1 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "1",
 sum(case when Datediff(month,ME_DT,sysdate())=0 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "0",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
Where BUS_UNIT_ABBR in ('AARP','AGCY') 
and concat(STATE_ABBR,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all Select 
Concat(case when STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'  
When STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
When STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
When STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 
 'Unknown' end ,BUS_UNIT_ABBR,NEWCO_IND,
'Inforce') as Key,
  sum(case when Datediff(month,ME_DT,sysdate())=18 THEN POL_INFORCE_CNT ELSE 0 END) AS "18",
  sum(case when Datediff(month,ME_DT,sysdate())=17 THEN POL_INFORCE_CNT ELSE 0 END) AS "17",
  sum(case when Datediff(month,ME_DT,sysdate())=16 THEN POL_INFORCE_CNT ELSE 0 END) AS "16",
  sum(case when Datediff(month,ME_DT,sysdate())=15 THEN POL_INFORCE_CNT ELSE 0 END) AS "15",
  sum(case when Datediff(month,ME_DT,sysdate())=14 THEN POL_INFORCE_CNT ELSE 0 END) AS "14",
  sum(case when Datediff(month,ME_DT,sysdate())=13 THEN POL_INFORCE_CNT ELSE 0 END) AS "13",
  sum(case when Datediff(month,ME_DT,sysdate())=12 THEN POL_INFORCE_CNT ELSE 0 END) AS "12",
  sum(case when Datediff(month,ME_DT,sysdate())=11 THEN POL_INFORCE_CNT ELSE 0 END) AS "11",
  sum(case when Datediff(month,ME_DT,sysdate())=10 THEN POL_INFORCE_CNT ELSE 0 END) AS "10",
  sum(case when Datediff(month,ME_DT,sysdate())=9 THEN POL_INFORCE_CNT ELSE 0 END) AS "9",
  sum(case when Datediff(month,ME_DT,sysdate())=8 THEN POL_INFORCE_CNT ELSE 0 END) AS "8",
  sum(case when Datediff(month,ME_DT,sysdate())=7 THEN POL_INFORCE_CNT ELSE 0 END) AS "7",
  sum(case when Datediff(month,ME_DT,sysdate())=6 THEN POL_INFORCE_CNT ELSE 0 END) AS "6",
  sum(case when Datediff(month,ME_DT,sysdate())=5 THEN POL_INFORCE_CNT ELSE 0 END) AS "5",
  sum(case when Datediff(month,ME_DT,sysdate())=4 THEN POL_INFORCE_CNT ELSE 0 END) AS "4",
  sum(case when Datediff(month,ME_DT,sysdate())=3 THEN POL_INFORCE_CNT ELSE 0 END) AS "3",
  sum(case when Datediff(month,ME_DT,sysdate())=2 THEN POL_INFORCE_CNT ELSE 0 END) AS "2",
  sum(case when Datediff(month,ME_DT,sysdate())=1 THEN POL_INFORCE_CNT ELSE 0 END) AS "1",
  sum(case when Datediff(month,ME_DT,sysdate())=0 THEN POL_INFORCE_CNT ELSE 0 END) AS "0",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
Where BUS_UNIT_ABBR in ('AARP','AGCY') 
and concat(STATE_ABBR,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all Select
Concat(case when STATE_ABBR in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'  
When STATE_ABBR in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
When STATE_ABBR in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
When STATE_ABBR in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 
 'Unknown' end ,BUS_UNIT_ABBR,NEWCO_IND,
'Written Premium') as Key,
 sum(case when Datediff(month,ME_DT,sysdate())=18 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "18",
 sum(case when Datediff(month,ME_DT,sysdate())=17 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "17",
 sum(case when Datediff(month,ME_DT,sysdate())=16 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "16",
 sum(case when Datediff(month,ME_DT,sysdate())=15 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "15",
 sum(case when Datediff(month,ME_DT,sysdate())=14 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "14",
 sum(case when Datediff(month,ME_DT,sysdate())=13 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "13",
 sum(case when Datediff(month,ME_DT,sysdate())=12 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "12",
 sum(case when Datediff(month,ME_DT,sysdate())=11 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "11",
 sum(case when Datediff(month,ME_DT,sysdate())=10 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "10",
 sum(case when Datediff(month,ME_DT,sysdate())=9 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "9",
 sum(case when Datediff(month,ME_DT,sysdate())=8 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "8",
 sum(case when Datediff(month,ME_DT,sysdate())=7 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "7",
 sum(case when Datediff(month,ME_DT,sysdate())=6 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "6",
 sum(case when Datediff(month,ME_DT,sysdate())=5 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "5",
 sum(case when Datediff(month,ME_DT,sysdate())=4 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "4",
 sum(case when Datediff(month,ME_DT,sysdate())=3 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "3",
 sum(case when Datediff(month,ME_DT,sysdate())=2 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "2",
 sum(case when Datediff(month,ME_DT,sysdate())=1 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "1",
 sum(case when Datediff(month,ME_DT,sysdate())=0 THEN POL_ANNL_TTL_BILL_PREM_AMT ELSE 0 END) AS "0",
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF
from "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
Where BUS_UNIT_ABBR in ('AARP','AGCY') 
and concat(STATE_ABBR,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+30 R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_30 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_30 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_30 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_30 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_30 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_30 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_30 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_30 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_30 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_30 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_30 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_30 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_30 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_30 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_30 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_30 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_30 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_30 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_30 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+0 R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_FLAT ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_FLAT ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_FLAT ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_FLAT ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_FLAT ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_FLAT ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_FLAT ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_FLAT ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_FLAT ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_FLAT ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_FLAT ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_FLAT ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_FLAT ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_FLAT ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_FLAT ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_FLAT ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_FLAT ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_FLAT ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_FLAT ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+Ult R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ULT_ATR_CNT ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ULT_ATR_CNT ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ULT_ATR_CNT ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ULT_ATR_CNT ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ULT_ATR_CNT ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ULT_ATR_CNT ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ULT_ATR_CNT ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ULT_ATR_CNT ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ULT_ATR_CNT ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ULT_ATR_CNT ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ULT_ATR_CNT ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ULT_ATR_CNT ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ULT_ATR_CNT ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ULT_ATR_CNT ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ULT_ATR_CNT ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ULT_ATR_CNT ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ULT_ATR_CNT ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ULT_ATR_CNT ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ULT_ATR_CNT ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(RISK_STATE,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'PremiumChange') as Key,
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "18",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "17",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "16",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "15",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "14",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "13",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "12",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "11",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "10",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "9",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "8",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "7",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "6",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "5", 
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "4",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "3",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "2",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "1",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
-------------------------------------
-------------------------------------
Union all SELECT
  Concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+30 R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_30 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_30 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_30 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_30 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_30 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_30 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_30 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_30 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_30 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_30 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_30 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_30 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_30 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_30 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_30 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_30 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_30 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_30 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_30 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+0 R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_FLAT ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_FLAT ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_FLAT ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_FLAT ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_FLAT ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_FLAT ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_FLAT ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_FLAT ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_FLAT ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_FLAT ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_FLAT ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_FLAT ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_FLAT ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_FLAT ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_FLAT ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_FLAT ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_FLAT ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_FLAT ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_FLAT ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+Ult R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ULT_ATR_CNT ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ULT_ATR_CNT ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ULT_ATR_CNT ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ULT_ATR_CNT ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ULT_ATR_CNT ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ULT_ATR_CNT ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ULT_ATR_CNT ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ULT_ATR_CNT ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ULT_ATR_CNT ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ULT_ATR_CNT ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ULT_ATR_CNT ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ULT_ATR_CNT ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ULT_ATR_CNT ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ULT_ATR_CNT ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ULT_ATR_CNT ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ULT_ATR_CNT ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ULT_ATR_CNT ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ULT_ATR_CNT ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ULT_ATR_CNT ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat('CW',BUS_UNIT_ABBR,NEWCO_INDICATOR,
'PremiumChange') as Key,
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "18",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "17",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "16",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "15",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "14",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "13",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "12",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "11",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "10",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "9",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "8",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "7",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "6",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "5", 
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "4",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "3",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "2",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "1",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
-------------------------------------
-------------------------------------
Union all SELECT
  Concat(case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'  
When RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
When RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
When RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 
 'Unknown' end,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+30 R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_30 ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_30 ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_30 ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_30 ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_30 ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_30 ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_30 ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_30 ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_30 ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_30 ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_30 ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_30 ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_30 ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_30 ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_30 ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_30 ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_30 ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_30 ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_30 ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_30 ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'  
When RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
When RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
When RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 
 'Unknown' end,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+0 R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ATR_E_FLAT ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ATR_E_FLAT ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ATR_E_FLAT ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ATR_E_FLAT ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ATR_E_FLAT ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ATR_E_FLAT ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ATR_E_FLAT ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ATR_E_FLAT ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ATR_E_FLAT ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ATR_E_FLAT ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ATR_E_FLAT ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ATR_E_FLAT ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ATR_E_FLAT ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ATR_E_FLAT ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ATR_E_FLAT ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ATR_E_FLAT ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ATR_E_FLAT ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ATR_E_FLAT ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN CANCEL_E_FLAT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ATR_E_FLAT ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'  
When RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
When RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
When RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 
 'Unknown' end,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'E+Ult R') as Key,
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN ULT_ATR_CNT ELSE 0 END)))) AS "18",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN ULT_ATR_CNT ELSE 0 END)))) AS "17",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN ULT_ATR_CNT ELSE 0 END)))) AS "16",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN ULT_ATR_CNT ELSE 0 END)))) AS "15",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN ULT_ATR_CNT ELSE 0 END)))) AS "14",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN ULT_ATR_CNT ELSE 0 END)))) AS "13",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN ULT_ATR_CNT ELSE 0 END)))) AS "12",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN ULT_ATR_CNT ELSE 0 END)))) AS "11",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN ULT_ATR_CNT ELSE 0 END)))) AS "10",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN ULT_ATR_CNT ELSE 0 END)))) AS "9",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN ULT_ATR_CNT ELSE 0 END)))) AS "8",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN ULT_ATR_CNT ELSE 0 END)))) AS "7",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN ULT_ATR_CNT ELSE 0 END)))) AS "6",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN ULT_ATR_CNT ELSE 0 END)))) AS "5", 
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN ULT_ATR_CNT ELSE 0 END)))) AS "4",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN ULT_ATR_CNT ELSE 0 END)))) AS "3",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN ULT_ATR_CNT ELSE 0 END)))) AS "2",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN ULT_ATR_CNT ELSE 0 END)))) AS "1",
  1-(Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ULT_CANC_CNT ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN ULT_ATR_CNT ELSE 0 END)))) AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key
------------------------------------------------------------------
Union all SELECT
  Concat(case when RISK_STATE in ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') then 'Southeast'  
When RISK_STATE in ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') then 'Central'
When RISK_STATE in ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') then 'Northeast' 
When RISK_STATE in ( 'AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') then 'West' else 
 'Unknown' end,BUS_UNIT_ABBR,NEWCO_INDICATOR,
'PremiumChange') as Key,
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=18 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "18",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=17 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "17",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=16 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "16",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=15 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "15",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=14 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "14",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=13 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "13",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=12 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "12",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=11 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "11",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())=10 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "10",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 9 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "9",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 8 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "8",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 7 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "7",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 6 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "6",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 5 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "5", 
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 4 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "4",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 3 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "3",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 2 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "2",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 1 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "1",
  (Div0null((sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN FIRST_TRANS_PREM ELSE 0 END)), (sum(case when Datediff(month,POL_EFF_DT,sysdate())= 0 THEN PRIOR_TERM_LATEST_PREM ELSE 0 END))))-1 AS "0",   
  TO_CHAR(sysdate(),'MM-DD-YYYY') as AS_OF

from  "DSC_PLBI_DB"."APP_AUTO_PRD"."PERSISTENCY_COMBINED"  where POL_NEW_RENEW_CD = 'R' and POL_EFF_DT >='2023-01-01' and BUS_UNIT_ABBR <> 'CDRT' and LOB = 'AUTO' and ATR_E_30 = 1 and concat(RISK_STATE,RATE_PLAN_CD) in ('AKHDC1','AKPL84','ALHDC1','ALPNG','ARHDC1','ARPNG','AZHDC1','AZPNG','CACARP','CAHDC1','COHDC1','COPNG','CTHDC1','CTPNG','DCHDC1','DCPNG','DEHDC1','DEPNG','FLHDC1','FLPNG','GAHDC1','GAPNG','HIHDC1','HIPL84','IAHDC1','IAPNG','IDHDC1','IDPNG','ILHDC1','ILPNG','INHDC1','INPNG','KSHDC1','KSPNG','KYHDC1','KYPNG','LAHDC1','LAPNG','MAHDC1','MAPNG','MDHDC1','MDPNG','MEHDC1','MEPNG','MIHDC1','MIPNG','MNHDC1','MNPNG','MOHDC1','MOPNG','MSHDC1','MSPNG','MTHDC1','MTPNG','NCHDC1','NCNCRP','NDHDC1','NDPNG','NEHDC1','NEPNG','NHHDC1','NHPNG','NJHDC1','NJNJRP','NMHDC1','NMPNG','NVHDC1','NVPNG','NYHDC1','NYPNG','OHHDC1','OHPNG','OKHDC1','OKPNG','ORHDC1','ORPNG','PAHDC1','PAPNG','RIHDC1','RIPNG','SCHDC1','SCPNG','SDHDC1','SDPNG','TNHDC1','TNPNG','TXHDC1','TXPNG','UTHDC1','UTPNG','VAHDC1','VAPNG','VTHDC1','VTPNG','WAHDC1','WAPNG','WIHDC1','WIPNG','WVHDC1','WVPNG','WYHDC1','WYPNG')
group by Key order by Key