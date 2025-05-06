SELECT 
    --General metrics 
    prop_policy.geocd_cnsus_block_grp_id,
    SUM(home_op_loss.ho_ee_amt) AS "Earned Exposures",
    SUM(home_op_loss.HO_EP_AMT) as "Earned Premium",
    SUM(
        home_op_loss.CAP_FIRE_ULT_CLM_AMT + 
        home_op_loss.CAP_LGHTNG_ULT_CLM_AMT +
        home_op_loss.CAP_LIAB_ULT_CLM_AMT + 
        home_op_loss.CAP_THEFT_ULT_CLM_AMT +
        home_op_loss.CAP_WTR_NWTHR_ULT_CLM_AMT +
        home_op_loss.CAP_WTR_WTHR_ULT_CLM_AMT +
        home_op_loss.CAP_WND_ULT_CLM_AMT +
        home_op_loss.CAP_OTH_ULT_CLM_AMT
    ) as "Capped Total Ult. Loss xCAT xHail",

    -- Ultimate losses by peril
    SUM(home_op_loss.CAP_FIRE_ULT_CLM_AMT) AS "Capped Fire Ult. Loss", 
    SUM(home_op_loss.CAP_LGHTNG_ULT_CLM_AMT) AS "Capped Lightning Ult. Loss",
    SUM(home_op_loss.CAP_LIAB_ULT_CLM_AMT) AS "Capped Liability Ult. Loss",
    SUM(home_op_loss.CAP_THEFT_ULT_CLM_AMT) AS "Capped Theft Ult. Loss",
    SUM(home_op_loss.CAP_WTR_NWTHR_ULT_CLM_AMT) AS "Capped Water Non-Weather Ult. Loss",
    SUM(home_op_loss.CAP_WTR_WTHR_ULT_CLM_AMT) AS "Capped Water Weather Ult. Loss",
    SUM(home_op_loss.CAP_WND_ULT_CLM_AMT) AS "Capped Wind Ult. Loss",
    SUM(home_op_loss.CAP_HAIL_ULT_CLM_AMT) AS "Capped Hail Ult. Loss",
    SUM(home_op_loss.CAP_OTH_ULT_CLM_AMT) AS "Capped Other Ult. Loss",

    -- Claim counts by peril
    SUM(home_op_loss.HO_FIRE_ULT_CLM) AS "Fire Ult. Claim Count",
    SUM(home_op_loss.HO_LIGHTNING_ULT_CLM) AS "Lightning Ult. Claim Count",
    SUM(home_op_loss.HO_LIABILITY_ULT_CLM) AS "Liability Ult. Claim Count",
    SUM(home_op_loss.HO_THEFT_ULT_CLM) AS "Theft Ult. Claim Count",
    SUM(home_op_loss.HO_WATERNONWEATHER_ULT_CLM) AS "Water Non-Weather Ult. Claim Count",
    SUM(home_op_loss.HO_WATERWEATHER_ULT_CLM) AS "Water Weather Ult. Claim Count",
    SUM(home_op_loss.HO_WIND_ULT_CLM) AS "Wind Ult. Claim Count",
    SUM(home_op_loss.HO_HAIL_ULT_CLM) AS "Hail Ult. Claim Count",
    SUM(home_op_loss.HO_OTHER_ULT_CLM) AS "Other Ult. Claim Count",
    SUM(
        zeroifnull(home_op_loss.HO_FIRE_ULT_CLM) +
        zeroifnull(home_op_loss.HO_LIGHTNING_ULT_CLM) +
        zeroifnull(home_op_loss.HO_LIABILITY_ULT_CLM) +
        zeroifnull(home_op_loss.HO_THEFT_ULT_CLM) + 
        zeroifnull(home_op_loss.HO_WATERNONWEATHER_ULT_CLM) +
        zeroifnull(home_op_loss.HO_WATERWEATHER_ULT_CLM) +
        zeroifnull(home_op_loss.HO_WIND_ULT_CLM) +
        zeroifnull(home_op_loss.HO_OTHER_ULT_CLM)
    ) AS "Total Ult. Claim Count xCAT xHail",
    
    -- Severity by peril
    CASE WHEN SUM(home_op_loss.HO_FIRE_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_FIRE_ULT_CLM_AMT ) / SUM(home_op_loss.HO_FIRE_ULT_CLM) ELSE NULL END AS "Fire Severity",
    CASE WHEN SUM(home_op_loss.HO_LIGHTNING_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_LGHTNG_ULT_CLM_AMT ) / SUM(home_op_loss.HO_LIGHTNING_ULT_CLM) ELSE NULL END AS "Lightning Severity",
    CASE WHEN SUM(home_op_loss.HO_LIABILITY_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_LIAB_ULT_CLM_AMT) / SUM(home_op_loss.HO_LIABILITY_ULT_CLM) ELSE NULL END AS "Liability Severity",
    CASE WHEN SUM(home_op_loss.HO_THEFT_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_THEFT_ULT_CLM_AMT) / SUM(home_op_loss.HO_THEFT_ULT_CLM) ELSE NULL END AS "Theft Severity",
    CASE WHEN SUM(home_op_loss.HO_WATERNONWEATHER_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_WTR_NWTHR_ULT_CLM_AMT) / SUM(home_op_loss.HO_WATERNONWEATHER_ULT_CLM) ELSE NULL END AS "Water Non-Weather Severity",
    CASE WHEN SUM(home_op_loss.HO_WATERWEATHER_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_WTR_WTHR_ULT_CLM_AMT) / SUM(home_op_loss.HO_WATERWEATHER_ULT_CLM) ELSE NULL END AS "Water Weather Severity",
    CASE WHEN SUM(home_op_loss.HO_WIND_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_WND_ULT_CLM_AMT) / SUM(home_op_loss.HO_WIND_ULT_CLM) ELSE NULL END AS "Wind Severity",
    CASE WHEN SUM(home_op_loss.HO_HAIL_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_HAIL_ULT_CLM_AMT) / SUM(home_op_loss.HO_HAIL_ULT_CLM) ELSE NULL END AS "Hail Severity",
    CASE WHEN SUM(home_op_loss.HO_OTHER_ULT_CLM) != 0 THEN SUM(home_op_loss.CAP_OTH_ULT_CLM_AMT) / SUM(home_op_loss.HO_OTHER_ULT_CLM) ELSE NULL END AS "Other Severity",
    CASE WHEN "Total Ult. Claim Count xCAT xHail" != 0 THEN "Capped Total Ult. Loss xCAT xHail" / "Total Ult. Claim Count xCAT xHail" ELSE NULL END AS "Total Severity xCAT xHail",

    -- Frequency by peril
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_FIRE_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Fire Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_LIGHTNING_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Lightning Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_LIABILITY_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Liability Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_THEFT_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Theft Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_WATERNONWEATHER_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Water Non-Weather Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_WATERWEATHER_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Water Weather Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_WIND_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Wind Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_HAIL_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Hail Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN SUM(home_op_loss.HO_OTHER_ULT_CLM) / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Other Frequency",
    CASE WHEN SUM(home_op_loss.ho_ee_amt) != 0 THEN "Total Ult. Claim Count xCAT xHail" / SUM(home_op_loss.ho_ee_amt) ELSE 0 END AS "Total Frequency xCAT xHail",

    -- Loss Cost by peril
    "Fire Frequency" * "Fire Severity" AS "Fire Loss Cost",
    "Lightning Frequency" * "Lightning Severity" AS "Lightning Loss Cost",
    "Liability Frequency" * "Liability Severity" AS "Liability Loss Cost",
    "Theft Frequency" * "Theft Severity" AS "Theft Loss Cost",
    "Water Non-Weather Frequency" * "Water Non-Weather Severity" AS "Water Non-Weather Loss Cost",
    "Water Weather Frequency" * "Water Weather Severity" AS "Water Weather Loss Cost",
    "Wind Frequency" * "Wind Severity" AS "Wind Loss Cost",
    "Hail Frequency" * "Hail Severity" AS "Hail Loss Cost",
    "Other Frequency" * "Other Severity" AS "Other Loss Cost",
    "Total Frequency xCAT xHail" * "Total Severity xCAT xHail" AS "Total Loss Cost xCAT xHail",

    -- -- Loss Ratios by peril
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_FIRE_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Fire Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_LIGHTNING_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Lightning Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_LIABILITY_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Liability Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_THEFT_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Theft Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_WATERNONWEATHER_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Water Non-Weather Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_WATERWEATHER_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Water Weather Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_WIND_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Wind Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_HAIL_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Hail Loss Ratio",
    -- CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN SUM(home_op_loss.HO_OTHER_ULT_LOSS) / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Other Loss Ratio",
    CASE WHEN SUM(home_op_loss.HO_EP_AMT) != 0 THEN "Capped Total Ult. Loss xCAT xHail" / SUM(home_op_loss.HO_EP_AMT) ELSE 0 END AS "Total Loss Ratio xCAT xHail"
FROM 
    prd_pl_db.app_dcpa_dm.prop_policy_inforce_vw prop_policy, 
    dsc_plbi_db.app_home_prd.home_operational_loss_ts home_op_loss
WHERE 
    TO_VARCHAR(home_op_loss.pol_id) = TO_VARCHAR(prop_policy.pol_id)
AND 
    TO_DATE(home_op_loss.earned_month, 'YYYYMM') >= dateadd(year, -5, current_date())
AND
    home_op_loss.GEOCD_CNSUS_BLOCK_GRP_ID is not null
AND
    home_op_loss.newco_ind = 'Y'
    
GROUP BY 
    prop_policy.geocd_cnsus_block_grp_id
