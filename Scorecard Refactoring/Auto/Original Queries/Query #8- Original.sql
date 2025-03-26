(SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Ins Score Decile',(
    case when (NEWCO_INS_SCR_CD) in (000,0,999)  then 'NHNS'
         when (NEWCO_INS_SCR_CD) <=386 then 'Decile 10 Worst'
         when (NEWCO_INS_SCR_CD) <=460 then 'Decile 09'
         when (NEWCO_INS_SCR_CD) <=539 then 'Decile 08'
         when (NEWCO_INS_SCR_CD) <=617 then 'Decile 07'
         when (NEWCO_INS_SCR_CD) <=679 then 'Decile 06'
         when (NEWCO_INS_SCR_CD) <=724 then 'Decile 05'
         when (NEWCO_INS_SCR_CD) <=756 then 'Decile 04'
         when (NEWCO_INS_SCR_CD) <=782 then 'Decile 03'
         when (NEWCO_INS_SCR_CD) <=809 then 'Decile 02'
         when (NEWCO_INS_SCR_CD) <=980 then 'Decile 01 Best' else 'NHNS' end
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'HH Comp',(
case when (HH_COMP)  in ('SC1D') then 'a. single vehicle, 1 driver'
    when  (HH_COMP)  in ('MC C=D') then 'd. multi vehicle, vehicle = driver'
    when  HH_COMP  in ('SCMT1D') then 'b. single vehicle, more than 1 driver' 
    when  HH_COMP  in ('MCMCTD') then 'c. multi vehicle, vehicle > drivers' 
    when  HH_COMP  in ('MCMDTC') then 'e. multi vehicle, vehicle < drivers' 
    when  HH_COMP  in ('0 CARS') then 'f. 0 vehicle'
    else 'g. other' end
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'CLEAN DIRTY DESC',(
CLEAN_DIRTY_DESC
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Max Age Group',(
case when POL_MAX_DRVR_AGE <50 then '50'
    when POL_MAX_DRVR_AGE <=59 then '50-59' 
    when POL_MAX_DRVR_AGE <=69 then '50-69' 
    when POL_MAX_DRVR_AGE <=79 then '70-79' 
    when POL_MAX_DRVR_AGE <=130 then '80+' else 'Unknown' end
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Min Age Group',(
case when POL_MIN_DRVR_AGE <50 then '50'
    when POL_MIN_DRVR_AGE <=59 then '50-59' 
    when POL_MIN_DRVR_AGE <=69 then '50-69' 
    when POL_MIN_DRVR_AGE <=79 then '70-79' 
    when POL_MIN_DRVR_AGE <=130 then '80+' else 'Unknown' end
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
     -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Max Minus Min Age Group',(
case when ((POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) = 0 ) then 'a. 0' 
     when ( 1 <= (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) and (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) <= 2 ) then 'b. 1-2' 
     when ( 3 <= (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) and (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) <= 6 ) then 'c. 3-6' 
     when ( 7 <= (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) and (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) <= 20 ) then 'd. 7-20'
     when ( (POL_MAX_DRVR_AGE - POL_MIN_DRVR_AGE) >= 21 ) then 'e. 21+' 
     else 'f. n/a' end
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
      -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'PCARR YR CNT',(
case when PCARR_YR_CNT =0.5 then 'a 0.5'
    when PCARR_YR_CNT =1.0 then 'b 1' 
    when PCARR_YR_CNT =2.0 then 'c 2' 
    when PCARR_YR_CNT =3.0 then 'd 3' 
    when PCARR_YR_CNT =4.0 then 'e 4' 
    when PCARR_YR_CNT =5.0 then 'f 5+' 
 else 'g Unknown' end
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
       -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'POL ACCT CR IND',(
ACCT_CR_IND
        )) as Key,


count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
        -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'POL COV PKG CD',(
case when POL_COV_PKG_CD is null then 'Unknown' when POL_COV_PKG_CD = 'NO COV' then 'Unknown' else POL_COV_PKG_CD end
        )) as Key,


count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
         -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Prior Carrier',(
    CASE when PCARR_DESC IN ('STATE FARM INSURANCE') THEN 'STATE FARM'                                                                                                                                                                                                                                                                                                                                                                                           
when PCARR_DESC IN ('IMPERIAL FIRE AND CA','SAFE AUTO INS CO','ALLSTATE CTY MUTUAL','ALLSTATE FIRE CAS IN','ALLSTATE INDEMNITY C','ALLSTATE INSURANCE C','ALLSTATE OF NEW JERS','ALLSTATE PROPERTY','ANJP C INS CO','CENTURY NATIONAL INS','CENTURY-NATIONAL INS','DIRECT GENERAL INS','DIRECT GENERAL INSUR','DIRECT INSURANCE CO','DIRECT INSURANCE COM','DIRECT NATIONAL INSU','ENCOM H A INS COMP','ENCOM INDEPENDENT IN','ENCOM INS CO OF NJ','ENCOM P C COMP','ENCOMPASS INDEMNITY','ENCOMPASS INS OF AM','ENCOMPASS INSURANCE','ENCOMPASS P C OF NJ','ESURANCE INS CO','ESURANCE INS CO NJ','ESURANCE PROP CAS','IMPERIAL FIRE CASU','INTEGON CASUALTY INS','INTEGON GENERAL INSU','INTEGON INDEMNITY CO','INTEGON NATIONAL','INTEGON NATIONAL INS','INTEGON PREFERRED IN','MIC GENERAL INSURANC','MS-DIRECT GENERAL IN','NATIONAL FARMERS UNI','NATIONAL GENERAL ASS','NATIONAL GENERAL INS','NATIONAL GENERAL PRE','NEW SOUTH INSURANCE','NORTHBROOK INSURANCE','STANDARD PROPERTY AN') THEN 'ALLSTATE'                                                                                                                                                                                                                                                                                                                                                                                       
when PCARR_DESC IN ('GEICO ADVANTAGE INS','GEICO CASUALTY COMP','GEICO CHOICE INS CO','GEICO COUNTY MTL','GEICO GENERAL INS CO','GEICO INDEMNITY COMP','GEICO SECURE INS CO','GEICOTXCOUNTYMUTUAL','GOVERNMENT EMP INSCO','SOUTHERN COUNTY') THEN 'GEICO'                                                                                                                                                                                                                                                                                                                                                                                    
when PCARR_DESC IN ('PROGRESSIVE GROUPS') THEN 'PROGRESSIVE'                                                                                                                                                                                                                                                                                                                                                                                        
when PCARR_DESC IN ('EMPLOYERS INSURANCE','FIRST NAT INS CO AME','GENERAL INS CO AMER','LIB MUTUAL PERSONAL','LIBERTY COUNTY MUTUA','LIBERTY INSURANCE CO','LIBERTY MUTUAL FIRE','LIBERTY MUTUAL INSUR','LIBERTY MUTUAL MID A','LIBERTY PERSONAL INS','LM GENERAL INSURANCE','LM INSURANCE CORPORA','MERIDIAN SECURITY','MERIDIAN SECURITY IN','MILBANK INSURANCE CO','MONTGOMERY MUTUAL IN','PATRONS MUTUAL INS C','PEERLESS INDEMNITY I','SAFECO INS CO AMER','SAFECO INSUR CO ILL','SAFECO INSUR CO IND','SAFECO INSUR CO ORE','SAFECO LLOYDS INS CO','SAFECO NAT INSUR CO','SAIC OF OHIO','SAIC OF WISCONSIN','STATE AUTO MUTUAL','STATE AUTO P C INS','STATE AUTO PROP C','STATE AUTOMOBILE MUT','THE FIRST LIBERTY IN','THE NETHERLANDS INSU','WAUSAU UNDERWRITERS','AMER ECONOMY INS CO','AMER STATES INSUR CO','AMER STATES PREF INS','AMERICA FIRST INSURA','CONSOLIDATED INSURAN') THEN 'LIBERTY'                                                                                                                                                                                                                                                                                                                                                                                     
when PCARR_DESC IN ('FID GUAR INS UNDRS','PHOENIX INSURANCE CO','ST PAUL PROTECTIVE I','STANDARD FIRE INS CO','TRAVCO INSURANCE CO','TRAVELERS CAS CONN','TRAVELERS COMMERCIAL','TRAVELERS HOME MAR','TRAVELERS INDEM AMER','TRAVELERS INDEM CONN','TRAVELERS INDEMNITY','TRAVELERS P C INS CO','TRAVELERS P C OF AM','TRAVELERS PERSON SEC','TRAVELERS PERSONAL','AUTO INS CO OF HARTF','CHARTER OAK FIRE INS','FIRST FLORIDIAN A H') THEN 'TRAVELERS'                                                                                                                                                                                                                                                                                                                                                                                    
when PCARR_DESC in ('AMFAM CONNECT INS',             'AMFAM CONNECT PC',               'AMFAM INS CO',                'AMER FAMILY MUTUAL',              'AMERICAN STD INS OH',            'THE GENERAL AUTOMOBI',      'MIDVALE INDEMNITY',     'AFMICSI',           'AMER STANDARD INS',                'AMERICAN FAM INS OH',           'AMERIPRISE INSURANCE',    'HOMESITE INSURANCE C',       'IDS PROPERTY CASUALT',         'MSAA', 'MSAA INSURANCE CO',                'MSAPIC',            'NGM INSURANCE CO',               'ODIC') THEN 'AMERICAN FAMILY'                                                                                                         
when PCARR_DESC in ('USAA GENERAL IND CO',          'USAA CASUALTY INS CO',          'USAA',  'GARRISON PROP CAS',     'GAR') then 'USAA'                                                                                                                                                                                                                                                                                                                          
when PCARR_DESC in ('COLONIAL COUNTY MUT',       'ALLIED PROP CAS',       'ALLIED P C INS CO',      'COLONIAL COUNTY MUT', 'CRESTBROOK INSURANCE',    'DEPOSITORS INS CO', 'NATIONWIDE AG INS CO',                'NATIONWIDE AGRI INS',            'NATIONWIDE GENERAL',           'NATIONWIDE INS CO', 'NATIONWIDE INS OF AM', 'NATIONWIDE MUT FIRE',            'NATIONWIDE MUT INS',              'NATIONWIDE MUTUAL IN',        'VICTORIA FIRE CASU',        'VICTORIA SPECIALTY I',              'AMCO INSURANCE CO',             'ALLIED P C INS CO',                'HARLEYSVILLEIC',         'HARLEYSVILLEPREFIC',              'NATIONWIDE AFFINITY',            'NATIONWIDE GENERAL',         'NATIONWIDE MUTUAL',             'NATIONWIDE PROP CAS',         'VICTORIA SELECT INSU') then 'Nationwide'
when PCARR_DESC IS NULL  THEN 'NULL'                                                                                                                                                                                                                                                                                                                                                                                        
when PCARR_DESC IN ( 'NOT PRESENTLY INSURED') THEN 'NOT PRESENTLY INSURED'                                                                                                                                                                                                                                                                                                                                                                                           
when PCARR_DESC IN ( 'OTHER-NON STANDARD' , 'OTHER - NON STANDARD' ) THEN 'OTHER - NON STANDARD'                                                                                                                                                                                                                                                                                                                                                                                                 
when PCARR_DESC IN ( 'UNKNOWN') THEN 'UNKNOWN'                                                                                                                                                                                                                                                                                                                                                                                        
when PCARR_DESC IN ('NO PRIOR INSURANCE') THEN 'NO PRIOR INSURANCE'                                                                                                                                                                                                                                                                                                                                                                                        
else 'OTHER' END                                                                                                                                                                                                                                                                                                                                                                                           
        )) as Key,                                                                                                                                                                                                                                                                                                                                                                                      
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
         -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Insured Age Group',(
case when   (INSURED_AGE) <=49  then 'a. 25-49'
     when   (INSURED_AGE) <=54  then 'b. 50-54'
     when   (INSURED_AGE) <=59  then 'c. 55-59'
     when   (INSURED_AGE) <=64  then 'd. 60-64'
     when   (INSURED_AGE) <=69  then 'e. 65-69'
     when   (INSURED_AGE) <=74  then 'f. 70-74'
     when   (INSURED_AGE) <=79  then 'g. 75-79'
     when   (INSURED_AGE) <=120  then 'h. 80+'
     else 'i. null' end 
        )) as Key,
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
          -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'POL PPV CNT',(
case when POL_PPV_CNT =1 then 'b 1' 
    when POL_PPV_CNT =2 then 'c 2' 
    when POL_PPV_CNT =3 then 'd 3' 
    when POL_PPV_CNT =4 then 'e 4' 
    when POL_PPV_CNT =5 then 'f 5+' 
 else 'g Unknown' end
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
           -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'YOUTH OPER DRVR IND',(
YOUTH_OPER_DRVR_IND
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
            -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'GARAGE SUBSTATE',(
case when STATE_ABBR in ('IA') and left(STATE_ABBR,2)=left(GARAGE_SUBSTATE,2) then GARAGE_SUBSTATE when  
  left(STATE_ABBR,2)=left(GARAGE_SUBSTATE,2) then GARAGE_SUBSTATE else 'Out of State Mail' end
        )) as Key,


count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Prior BI Per Person',(
case when (PCARR_BI_PERS_LMT_CD)  < (50) then 'a. Less than 50'                                   
    when  (PCARR_BI_PERS_LMT_CD)  < (100) then 'b. 50-99'                                      
    when  PCARR_BI_PERS_LMT_CD  < (250) then 'c. 100-249'                                    
    when  PCARR_BI_PERS_LMT_CD  < (3000) then 'd. 250+'                                        
    when  PCARR_BI_PERS_LMT_CD  is null then 'f. Unknown/No Insurance'                                      
    else 'e. other' end                                       
        )) as Key,                                      
count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Advanced Quote Discount',(
    case when   (ADV_QTE_DAY_CNT) in (000,0,999)  then 'A. 0 Days'
     when   (ADV_QTE_DAY_CNT) <=13  then 'B. 1-13'
     when   (ADV_QTE_DAY_CNT) <=60  then 'C. 14-60'
     when   (ADV_QTE_DAY_CNT) <=75  then 'D. 61-75'
     when   (ADV_QTE_DAY_CNT) <=99999  then 'E. 76+'
     else 'F. Unknown' end
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Min Rating Factor',(
POL_MIN_RATE_FCTR_IND
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" t1
left join (select AUTO_POL_TRANS_ID, POL_MIN_RATE_FCTR_IND from "PRD_PL_DB"."APP_DCPA_AUTO_CURATE"."AUTO_POLICY" group by AUTO_POL_TRANS_ID, POL_MIN_RATE_FCTR_IND) t2

 on t1.AUTO_POL_TRANS_ID=t2.AUTO_POL_TRANS_ID

 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'RENEW UW TIER',(
case when RENEW_UW_TIER_CD in ('BB','BC','BD','BE','BF','BG','BH','BI','BJ','BK') then RENEW_UW_TIER_CD else 'Other' end
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Max Veh Age',(
case when POL_MAX_VEH_AGE <= 3 then '0-3'      when POL_MAX_VEH_AGE <= 6 then '4-6'     when POL_MAX_VEH_AGE <= 9 then '7-9'   when POL_MAX_VEH_AGE <= 14 then '10-14'                                                                                                                                                                                      
      when POL_MAX_VEH_AGE <= 19 then '15-19'   when POL_MAX_VEH_AGE <= 24 then '20-24'                                                                                                                                                                                            
      when POL_MAX_VEH_AGE > 24 then '25+'                                                                                                                                                                                   
 else 'Other' end                              
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
  
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
   union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'POL MULTI SNGL VEH CD',(
POL_MULTI_SNGL_VEH_CD    
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" 
 
 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Mature Driving Course',(
POL_MATUR_DRVNG_COURS_CR_IND
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" t1
left join (select AUTO_POL_TRANS_ID, POL_MATUR_DRVNG_COURS_CR_IND from "PRD_PL_DB"."APP_DCPA_AUTO_CURATE"."AUTO_POLICY" group by AUTO_POL_TRANS_ID, POL_MATUR_DRVNG_COURS_CR_IND) t2

 on t1.AUTO_POL_TRANS_ID=t2.AUTO_POL_TRANS_ID

 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)

    -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Incident Free Year Count',(
POL_INCID_FREE_YR_CNT
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" t1
left join (select AUTO_POL_TRANS_ID, POL_INCID_FREE_YR_CNT from "PRD_PL_DB"."APP_DCPA_AUTO_CURATE"."AUTO_POLICY" group by AUTO_POL_TRANS_ID, POL_INCID_FREE_YR_CNT) t2

 on t1.AUTO_POL_TRANS_ID=t2.AUTO_POL_TRANS_ID

 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
     -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'NAF Accident Count',(
case when  POL_TTL_NAF_ACCID_CNT = 0 then '0'
when  POL_TTL_NAF_ACCID_CNT = 1 then '1'
when  POL_TTL_NAF_ACCID_CNT > 1 then '2+' end 
        )) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" t1

 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
      -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
union all (SELECT concat(STATE_ABBR,RATE_PLAN_CD,'Incident Month Age',POL_LATST_INCID_MO_AGE,(
case when  POL_LATST_INCID_MO_AGE >=1 and POL_LATST_INCID_MO_AGE<= 12 then '1-12'
   when  POL_LATST_INCID_MO_AGE >=13 and POL_LATST_INCID_MO_AGE<= 24 then '13-24'
   when  POL_LATST_INCID_MO_AGE >=25 and POL_LATST_INCID_MO_AGE<= 36 then '25-36'
   when  POL_LATST_INCID_MO_AGE >=37 and POL_LATST_INCID_MO_AGE<= 48 then '37-48'
   when  POL_LATST_INCID_MO_AGE >=49 and POL_LATST_INCID_MO_AGE<= 60 then '49-60'
   when  POL_LATST_INCID_MO_AGE >=61 and POL_LATST_INCID_MO_AGE<= 61 then '61'
   when  POL_LATST_INCID_MO_AGE >=0 and POL_LATST_INCID_MO_AGE<= 0 then '0' end

)) as Key,

count(POLICY_ID) as PIF
from  "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_INFORCE_MONTHEND" t1

 Where BUS_UNIT_ABBR = 'AARP' and LATEST_MONTH_IND = 'Y' and RATE_PLAN_CD = 'HDC1' Group by Key)
order by key;