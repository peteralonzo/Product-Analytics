WITH cbg_join AS
(
    SELECT ADL.POL_ID, ADL.PERIL_DESC, ADL.CAL_NET_EP_AMT, NET_INCUR_LOSS_AMT, DC.GEOCD_CNSUS_BLOCK_GRP_ID AS CBG
    FROM PRD_PLACT_DB.APP_ADL_DLV.HOME_EARN_PREM_LOSS_FW_VW AS ADL
    LEFT JOIN PRD_PL_DB.APP_DCPA_DM.PROP_POLICY_INFORCE_VW AS DC
    ON SUBSTR(ADL.POL_ID,2,11) = TO_VARCHAR(DC.POL_ID)
    WHERE AS_OF_DT = (SELECT MAX(AS_OF_DT) FROM PRD_PLACT_DB.APP_ADL_DLV.HOME_EARN_PREM_LOSS_FW_VW)
    AND TO_DATE(TO_VARCHAR(MO_END_SNPSHT_DT_PK_ID), 'YYYYMMDD') >= dateadd(year, -5, current_date())    
),

agg AS
(
    SELECT CBG,
    SUM(CASE WHEN PERIL_DESC = 'FIRE' THEN CAL_NET_EP_AMT END) AS "Fire Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'LIGHTNING' THEN CAL_NET_EP_AMT END) AS "Lightning Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'LIABILITY' THEN CAL_NET_EP_AMT END) AS "Liability Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'THEFT' THEN CAL_NET_EP_AMT END) AS "Theft Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'WATER - NON-WEATHER' THEN CAL_NET_EP_AMT END) AS "Water Non-Weather Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'WATER - WEATHER' THEN CAL_NET_EP_AMT END) AS "Water Weather Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'WIND' THEN CAL_NET_EP_AMT END) AS "Wind Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'HAIL' THEN CAL_NET_EP_AMT END) AS "Hail Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'OTHER' THEN CAL_NET_EP_AMT END) AS "Other Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'HURRICANE' THEN CAL_NET_EP_AMT END) AS "Hurricane Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'WILDFIRE' THEN CAL_NET_EP_AMT END) AS "Wildfire Earned Premium",
    SUM(CASE WHEN PERIL_DESC = 'UNKNOWN' THEN CAL_NET_EP_AMT END) AS "Unknown Earned Premium",
    
    SUM(CASE WHEN PERIL_DESC = 'FIRE' THEN NET_INCUR_LOSS_AMT END) AS "Fire Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'LIGHTNING' THEN NET_INCUR_LOSS_AMT END) AS "Lightning Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'LIABILITY' THEN NET_INCUR_LOSS_AMT END) AS "Liability Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'THEFT' THEN NET_INCUR_LOSS_AMT END) AS "Theft Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'WATER - NON-WEATHER' THEN NET_INCUR_LOSS_AMT END) AS "Water Non-Weather Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'WATER - WEATHER' THEN NET_INCUR_LOSS_AMT END) AS "Water Weather Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'WIND' THEN NET_INCUR_LOSS_AMT END) AS "Wind Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'HAIL' THEN NET_INCUR_LOSS_AMT END) AS "Hail Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'OTHER' THEN NET_INCUR_LOSS_AMT END) AS "Other Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'HURRICANE' THEN NET_INCUR_LOSS_AMT END) AS "Hurricane Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'WILDFIRE' THEN NET_INCUR_LOSS_AMT END) AS "Wildfire Incurred Loss",
    SUM(CASE WHEN PERIL_DESC = 'UNKNOWN' THEN NET_INCUR_LOSS_AMT END) AS "Unknown Incurred Loss",
    
    FROM cbg_join
    WHERE CBG IS NOT NULL
    GROUP BY CBG
    ORDER BY CBG
)


SELECT *,
DIV0NULL("Fire Incurred Loss", "Fire Earned Premium") as "Fire Incurred Loss Ratio",
DIV0NULL("Lightning Incurred Loss", "Lightning Earned Premium") as "Lightning Incurred Loss Ratio",
DIV0NULL("Liability Incurred Loss", "Liability Earned Premium") as "Liability Incurred Loss Ratio",
DIV0NULL("Theft Incurred Loss", "Theft Earned Premium") as "Theft Incurred Loss Ratio",
DIV0NULL("Water Non-Weather Incurred Loss", "Water Non-Weather Earned Premium") as "Water Non-Weather Incurred Loss Ratio",
DIV0NULL("Water Weather Incurred Loss", "Water Weather Earned Premium") as "Water Weather Incurred Loss Ratio",
DIV0NULL("Wind Incurred Loss", "Wind Earned Premium") as "Wind Incurred Loss Ratio",
DIV0NULL("Hail Incurred Loss", "Hail Earned Premium") as "Hail Incurred Loss Ratio",
DIV0NULL("Other Incurred Loss", "Other Earned Premium") as "Other Incurred Loss Ratio",
DIV0NULL("Hurricane Incurred Loss", "Hurricane Earned Premium") as "Hurricane Incurred Loss Ratio",
DIV0NULL("Wildfire Incurred Loss", "Wildfire Earned Premium") as "Wildfire Incurred Loss Ratio",
DIV0NULL("Unknown Incurred Loss", "Unknown Earned Premium") as "Unknown Incurred Loss Ratio"

FROM agg
ORDER BY CBG