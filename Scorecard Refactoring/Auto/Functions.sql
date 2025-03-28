------------------- Function Definitions -------------------

-- Used for RC1
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.rc1_funnel_scorecard(month_diff INT, QUOTE_DT DATE, QCN STRING)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND LENGTH(QCN) > 5 THEN 1 ELSE 0 END)
$$;

-- Used for Success 2+
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.adv_ind_funnel_scorecard(month_diff INT, QUOTE_DT DATE, SUCCESS_IND INT, CARRIERSQUOTED INT)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND CARRIERSQUOTED > 2 THEN ROUND(SUCCESS_IND, 0) ELSE 0 END)
$$;

-- Used for Failure, Success, Competitive, Win, Completed Quote, Issue, AND Bridge
CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.ind_funnel_scorecard(month_diff INT, QUOTE_DT DATE, IND INT)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff THEN ROUND(IND, 0) ELSE 0 END)
$$;

CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.get_region_scorecard(STATE STRING)
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

CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.div_ind_funnel_scorecard(month_diff INT, QUOTE_DT DATE, SUCCESS_IND INT, CARRIERSQUOTED INT, XHIG NUMBER, ANNUAL NUMBER)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND SUCCESS_IND = 1 AND CARRIERSQUOTED > 2
    THEN NULLIFZERO(ANNUAL/XHIG) ELSE NULL END
$$;

CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.one_cond_scorecard(month_diff INT, QUOTE_DT DATE, IND STRING, VAL STRING, RETURN_NUM NUMBER, RVSE BOOLEAN DEFAULT FALSE)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$ 
    CASE WHEN RVSE THEN
        SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND IND <> VAL THEN RETURN_NUM ELSE 0 END)
    ELSE
        SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND IND = VAL THEN RETURN_NUM ELSE 0 END)
    END
$$;

CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.two_cond_scorecard(month_diff INT, QUOTE_DT DATE, IND STRING, VAL STRING, IND2 STRING, VAL2 STRING, RETURN_NUM NUMBER, RVSE BOOLEAN DEFAULT FALSE)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    CASE WHEN RVSE THEN
        SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND IND <> VAL AND IND2 = VAL2 THEN RETURN_NUM ELSE 0 END)
    ELSE
        SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff AND IND = VAL AND IND2 = VAL2 THEN RETURN_NUM ELSE 0 END)
    END
$$;

CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.zero_cond_scorecard(month_diff INT, QUOTE_DT DATE, RETURN_NUM NUMBER)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$ 
    SUM(CASE WHEN DATEDIFF(MONTH, QUOTE_DT, SYSDATE()) = month_diff THEN RETURN_NUM ELSE 0 END) 
$$;

CREATE OR REPLACE FUNCTION DSC_PLBI_DB.APP_AUTO_DEV.perst_calc_scorecard(monthdiff INT, POL_EFF_DT DATE, CANCEL INT, ATR INT)
RETURNS NUMBER(13, 0)
LANGUAGE SQL
AS
$$
    1 - DIV0NULL(SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = monthdiff THEN CANCEL ELSE 0 END), 
                 SUM(CASE WHEN DATEDIFF(MONTH, POL_EFF_DT, SYSDATE()) = monthdiff THEN ATR ELSE 0 END))
$$;

------------------- Validation Query -------------------

WITH orig AS 
(
    SELECT * FROM TABLE(RESULT_SCAN('01bb4474-0513-2e00-005a-dd0351732ecb'))
),

refactored AS 
(
    SELECT * FROM TABLE(RESULT_SCAN('01bb4475-0513-2e00-005a-dd03517353d3'))
)

-- Compare the results
SELECT * FROM 
(SELECT * FROM orig
EXCEPT
SELECT * FROM refactored)
UNION 
(SELECT * FROM refactored
EXCEPT
SELECT * FROM orig);