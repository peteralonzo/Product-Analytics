import pandas as pd
import configparser
import snowflake.connector
from snowflake.connector.pandas_tools import write_pandas
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization

with open("/etc/security/snowflake/rsa_plbiap01dy.p8", "rb") as key:
    p_key= serialization.load_pem_private_key(
        key.read(),
        password='snowflake'.encode(),
        backend=default_backend()
    )

pkb = p_key.private_bytes(
    encoding=serialization.Encoding.DER,
    format=serialization.PrivateFormat.PKCS8,
    encryption_algorithm=serialization.NoEncryption())


ctx = snowflake.connector.connect(
    user='plbiap01dy',
    account='hfsg_prod.us-east-1.privatelink',
    private_key=pkb,
    warehouse='DSC_PLBI_DEV_MFG_WHS',
    database='DSC_PLBI_DB',
    schema='APP_HOME_DEV',
    role='plbiap01dy_dev_pii_role'
    )

############################################ Function ############################################
## Used for Query #6
ind_funnel = """
-- Used for Failure, Success, Competitive, Win, Completed Quote, Issue, AND Bridge
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_HOME_DEV.ind_funnel_scorecard(month_diff INT, QUOTE_DT DATE, IND INT)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff THEN ROUND(IND, 0) ELSE 0 END)
$$;
"""

div_ind_funnel = """
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_HOME_DEV.div_ind_funnel_scorecard(month_diff INT, QUOTE_DT DATE, SUCCESS_IND INT, CARRIERSQUOTED INT, XHIG NUMBER, ANNUAL NUMBER)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND SUCCESS_IND = 1 AND CARRIERSQUOTED > 2
    THEN NULLIFZERO(ANNUAL/XHIG) ELSE NULL END
$$;
"""

## Used for Query #5
zero_cond = """
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_HOME_DEV.zero_cond_scorecard(month_diff INT, QUOTE_DT DATE, RETURN_NUM NUMBER)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$ 
    SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff THEN RETURN_NUM ELSE 0 END) 
$$;
"""

one_cond = """
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_HOME_DEV.one_cond_scorecard(month_diff INT, QUOTE_DT DATE, IND STRING, VAL STRING, RETURN_NUM NUMBER, RETURN_NULL BOOLEAN DEFAULT FALSE)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$ 
    CASE WHEN RETURN_NULL THEN
        SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND IND = VAL THEN RETURN_NUM ELSE NULL END)
    ELSE
        SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND IND = VAL THEN RETURN_NUM ELSE 0 END)
    END
$$;
"""

region_funnel = """
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_HOME_DEV.get_region_scorecard(STATE STRING)
RETURNS STRING
LANGUAGE SQL
AS
$$
    CASE WHEN STATE IN ('MS','TN','AL','AR','FL','IN','KY','NC','WV','GA','SC','DC','LA') THEN 'Southeast' 
         WHEN STATE IN ('IA','KS','NE','OK','TX','MO','IL','MI','MN','WI','NM','CO') THEN 'Central'
         WHEN STATE IN ('DE','ME','NH','RI','VT','NY','NJ','CT','MA','PA','OH','VA','MD') THEN 'Northeast'
         WHEN STATE IN ('AK','HI','MT','ND','SD','WY','CA','AZ','NV','WA','OR','ID','UT') THEN 'West' 
    ELSE 'Unknown' END
$$;
"""

perst_calc = """
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_HOME_DEV.perst_calc_scorecard(monthdiff INT, POL_EFF_DT DATE, CANCEL INT, ATR INT)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = monthdiff THEN CANCEL ELSE 0 END), 
                 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = monthdiff THEN ATR ELSE 0 END))
$$;
"""

## Function Creation
cs = ctx.cursor()
try:
    cs.execute(ind_funnel)
    cs.execute(div_ind_funnel)
    cs.execute(zero_cond)
    cs.execute(one_cond)
    cs.execute(region_funnel)
    cs.execute(perst_calc)
finally:
    cs.close()

############################################ Loading Query Files ############################################

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #1- Home.sql', 'r') as query1:
    query_1 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_FLOW_EXCEL AS \n" + query1.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #2- Home.sql', 'r') as query2:
    query_2 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_PERSISTENCY_EXCEL AS \n" + query2.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #3- Home.sql', 'r') as query3:
    query_3 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_SEG_NEWCO AS \n" + query3.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #4- Home.sql', 'r') as query4:
    query_4 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_INFORCE_EXCEL AS \n" + query4.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #5- Home.sql', 'r') as query5:
    query_5 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_SEG_NOWCO AS \n" + query5.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #6- Home.sql', 'r') as query6:
    query_6 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_NEW_FUNNEL AS \n" + query6.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #7- Home.sql', 'r') as query7:
    query_7 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_SEG_CW_NEWCO AS \n" + query7.read()

with open('/tech/appl/default/user/pa08042e/home_scorecard/queries/Query #8- Home.sql', 'r') as query8:
    query_8 = "CREATE OR REPLACE TRANSIENT TABLE DSC_PLBI_DB.APP_HOME_DEV.SCORECARD_HOME_SEG_CW_NOWCO AS \n" + query8.read()
    
cs = ctx.cursor()
try:
    cs.execute(query_1)
    cs.execute(query_2)
    cs.execute(query_3)
    cs.execute(query_4)
    cs.execute(query_5)
    cs.execute(query_6)
    cs.execute(query_7)
    cs.execute(query_8)
finally:
    cs.close()

############################################ Validation Check ############################################
query_dict = {'SCORECARD_HOME_FLOW_EXCEL': query_1, 'SCORECARD_HOME_PERSISTENCY_EXCEL': query_2, 'SCORECARD_HOME_SEG_NEWCO': query_3,
              'SCORECARD_HOME_INFORCE_EXCEL': query_4, 'SCORECARD_HOME_SEG_NOWCO': query_5, 'SCORECARD_NEW_FUNNEL': query_6,
              'SCORECARD_HOME_SEG_CW_NEWCO': query_7, 'SCORECARD_HOME_SEG_CW_NOWCO': query_8}

cs = ctx.cursor()
try:
    for table, query_file in query_dict.items():
        cs.execute(f'SELECT COUNT(*) FROM DSC_PLBI_DB.APP_HOME_DEV.{table}')
        row_cnt = cs.fetchone()[0]
        if row_cnt <= 1:
            cs.execute(query_file)
finally:
    cs.close()
ctx.close()