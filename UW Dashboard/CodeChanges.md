# February 13th Code Changes: UW Notebook

#### After meeting with Karen Pavio, Lane Coonrod, and Nick Smith on January 24th, 2025, they wanted the following changes to be made:

**Required Changes**

1. Policy Data Should be on Policy Term Level
2. Bias from Policy ID join must be removed to maintain data integrity
3. New Business needs to be added to dataset
4. Tableau Dashboard needs to change graph data, LRRs, and tables based on NB, renewals, or both
5. Only policies that have the UW Eligible fields should be included

#### The UW team was also interested in publishing the dashboard. I accomplished this by writing the data to *DSC_PLBI_DB.APP_AUTO_DEV.FULL_UW_DECOUPLING_DATA*  instead of my personal schema.
#### With this in mind, this is how each change above was implemented in the new UW Dashboard Jupyter notebook:

## 1 & 2: Policy Term Level Data and Bias Removal
#### This change was very straightforward, except for the fact that POL_PRD_ID was not populated in the *AUTO_POLICY_LATST_VW* data. To get around this, I modified Cell 6 in the notebook to join to Auto Operational Loss on both POL_ID and POL_EFF_DT for each query.

```sql
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_OPERATIONAL_LOSS" AS AUTO_OP_LOSS
JOIN DSC_PLBI_DB.APP_AUTO_DEV.POL_UW_DECOUPLING AS UW_AUTO
ON CAST(AUTO_OP_LOSS.POL_ID AS VARCHAR) = CAST(UW_AUTO.POL_ID AS VARCHAR)
AND AUTO_OP_LOSS.POL_EFF_DT = UW_AUTO.POL_EFF_DT
```

#### This effectively ensures that our data will be on the policy term level, allowing policies to switch between Clean/Clean, Clean/Dirty, and Dirty/Dirty after each term. This also removes the bias discovered by Lane during our meeting.

## 3. Adding New Business to Dataset
#### Nick Smith and Lane Coonrod were interested in pulling in New Business policies and seeing how these policies perform compared to Renewals. This change was also easy, as it only required two changes to Cell 3:

**Adding NB/Renewal Attribute**
```sql
CASE WHEN ORIG_POL_EFF_DT > DATEADD(MONTH, -6, CURRENT_DATE())
    THEN 'NB' ELSE 'Renewal' END AS POL_TYPE
```
**Pulling in New Business policies**
```sql
AND ORIG_POL_EFF_DT < {value} -- Removed filter from query
```
#### With these two changes, NB will be pulled into the dashboard and the POL_TYPE attribute will allow users to analyze these two groups separately in the dashboard.

## 4. Adding NB/Renewal to Dashboard
#### In order to add a NB/Renewal filter to the Tableau Dashboard, the following formulas were created/changed to allow users to switch between NB, Renewals, and both:
**Business Type Parameter**
```
Data Type: String
Allowable values: List
NB: NB
Renewal: Renewal
Both: Both
```
**POL Type Segment Loss Ratio**
```
IF [Business Type] = 'NB' THEN
  { FIXED [Risk St Abbr], [Chargeability/UW]: SUM(IF [POL_TYPE] = 'NB' THEN [Deriv Incur Loss Amt Xcat] END) } /
  { FIXED [Risk St Abbr], [Chargeability/UW]: SUM(IF [POL_TYPE] = 'NB' THEN [Epapr] END) }
ELSEIF [Business Type] = 'Renewal' THEN
  { FIXED [Risk St Abbr], [Chargeability/UW]: SUM(IF [POL_TYPE] = 'Renewal' THEN [Deriv Incur Loss Amt Xcat] END) } /
  { FIXED [Risk St Abbr], [Chargeability/UW]: SUM(IF [POL_TYPE] = 'Renewal' THEN [Epapr] END) }
ELSE
  { FIXED [Risk St Abbr], [Chargeability/UW]: SUM([Deriv Incur Loss Amt Xcat]) } /
  { FIXED [Risk St Abbr], [Chargeability/UW]: SUM([Epapr]) }
END
```
**POL Type State Loss Ratio**
```
IF [Business Type] = 'NB' THEN
  { FIXED [Risk St Abbr]: SUM(IF [POL_TYPE] = 'NB' THEN [Deriv Incur Loss Amt Xcat] END) } /
  { FIXED [Risk St Abbr]: SUM(IF [POL_TYPE] = 'NB' THEN [Epapr] END) }
ELSEIF [Business Type] = 'Renewal' THEN
  { FIXED [Risk St Abbr]: SUM(IF [POL_TYPE] = 'Renewal' THEN [Deriv Incur Loss Amt Xcat] END) } /
  { FIXED [Risk St Abbr]: SUM(IF [POL_TYPE] = 'Renewal' THEN [Epapr] END) }
ELSE
  { FIXED [Risk St Abbr]: SUM([Deriv Incur Loss Amt Xcat]) } /
  { FIXED [Risk St Abbr]: SUM([Epapr]) }
END
```
**POL Type LRR**
```
[POL TYPE Segment] / [POL TYPE State]
```
**Business Type Filter**
```
IF [Business Type] = 'Both' THEN TRUE
ELSE POL_TYPE = [Business Type]
END
```

#### After modifying these formulas and parameters, I had to add the Business Type parameter and Business Type filter to the dashboard. To make all the numbers on the dashboard change, I had to create a Parameter action. That parameter action can be found in *tableau_formulas.txt*.

## 5. Only Including UW Eligible Policies
#### Karen Pavio was concerned that some policies are being brought in to the dashboard that may not have the UW Eligible fields. To combat this, I made the following changes to the Cell 3 query:
**Excluding Records with NULLs in Eligible Fields**
```sql
AND UW_ELIG_POL_AFA_CNT IS NOT NULL 
AND UW_ELIG_POL_NAF_ACCID_CNT IS NOT NULL
AND UW_ELIG_POL_COMP_CLM_CNT IS NOT NULL 
AND UW_ELIG_POL_MLTRY_PRMT_CNT IS NOT NULL
AND UW_ELIG_POL_PERM_USE_ACCID_CNT IS NOT NULL 
AND UW_ELIG_RENTL_TOW_GLASS_CNT IS NOT NULL
```
**Removing ZEROIFNULL from fields themselves**
```sql
UW_ELIG_POL_AFA_CNT,
UW_ELIG_POL_NAF_ACCID_CNT,
UW_ELIG_POL_COMP_CLM_CNT,
UW_ELIG_POL_MLTRY_PRMT_CNT,
UW_ELIG_POL_PERM_USE_ACCID_CNT,
UW_ELIG_RENTL_TOW_GLASS_CNT,
(UW_ELIG_POL_AFA_CNT + UW_ELIG_POL_NAF_ACCID_CNT + 
UW_ELIG_POL_COMP_CLM_CNT + UW_ELIG_POL_MLTRY_PRMT_CNT + UW_ELIG_POL_PERM_USE_ACCID_CNT) AS DERIVED_TTL_ACCID_VIO_COMP_CNT,
```
#### These changes ensure that only policies with numeric values for **every** UW Eligible field are included in the dashboard.

## If you have any questions/concerns with the changes made, please contact me (peter.alonzo@thehartford.com)