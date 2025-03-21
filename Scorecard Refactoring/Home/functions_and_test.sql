-- Test Query
WITH orig AS 
(
    SELECT * FROM TABLE(RESULT_SCAN('01bb2987-0513-276f-005a-dd034a249727'))
),

refactored AS 
(
    SELECT * FROM TABLE(RESULT_SCAN('01bb2987-0513-276f-005a-dd034a249727'))
)

-- Compare the results
SELECT * FROM orig
UNION
SELECT * FROM refactored