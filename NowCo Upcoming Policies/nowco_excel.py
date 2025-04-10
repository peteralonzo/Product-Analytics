## Importing necessary packages
import configparser
import snowflake.connector
import os
from datetime import date, timedelta
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives.asymmetric import dsa
from cryptography.hazmat.primitives import serialization
import pandas as pd
import numpy as np
import copy

## Setting up Snowflake Connection
config = configparser.ConfigParser()

config.read('/tech/appl/default/user/pa08042e/toad.cfg')
snowflake_pass = config['SNOWFLAKE']['secret_passphrase']

with open("/tech/appl/default/user/pa08042e/rsa_snow.p8", "rb") as key:
    private_key= serialization.load_pem_private_key(
        key.read(),
        password= snowflake_pass.encode(),
        backend=default_backend()
    )

pkb = private_key.private_bytes(
    encoding=serialization.Encoding.DER,
    format=serialization.PrivateFormat.PKCS8,
    encryption_algorithm=serialization.NoEncryption())

ctx = snowflake.connector.connect(
    user='pa08042',
    account='hfsg_prod.us-east-1',
    private_key=pkb,
    database='user_db',
    schema='AD1_PA08042'
    )

start_date = '\'' + (date.today() + timedelta(days=42)).strftime('%Y-%m-%d') + '\''
end_date = '\'' + (date.today() + timedelta(days=48)).strftime('%Y-%m-%d') + '\''
billing_date = '\'' + (date.today() - timedelta(days=9)).strftime('%Y-%m-%d') + '\''

# # For one-time run
# start_date = '\'2025-04-14\''
# end_date = '\'2025-05-18\''
# billing_date = '\'2025-02-22\''

query = f"""
SELECT POLICY_ID, TO_DATE(CAST(POL_EFF_DT AS VARCHAR),'YYYYMMDD') AS POL_EFF_DT,
STATE_ABBR, BUS_UNIT_ABBR, ACCT_CR_IND, HH_COMP, INS_SCORE_GRP, INSURED_AGE, 
POL_NEW_RNW_CD, RATE_PLAN_CD, INS_SCORE_CD, YEARS_WITH_HIG, 
CLEAN_DIRTY, POL_LATST_INCID_MO_AGE_GRP, FLAT_CANCEL_FLAG,
MIN_COLL_DED, MAX_COLL_DED, MIN_COMP_DED, MAX_COLL_DED, PUP_IND,
PREV_TERM_LATEST_PREMIUM, FRST_TRANS_PREM,
FRST_TRANS_PREM - PREV_TERM_LATEST_PREMIUM AS PREM_INCREASE,
FRST_TRANS_PREM / PREV_TERM_LATEST_PREMIUM - 1 AS OFFERED_PREMIUM_CHANGE,
FROM "DSC_PLBI_DB"."APP_AUTO_PRD"."AUTO_PERSISTENCY_NOWCO"
WHERE TO_DATE(CAST(POL_EFF_DT AS varchar),'yyyymmdd') BETWEEN {start_date} AND {end_date}
AND POL_NEW_RNW_CD = 'R'
AND ACCT_CR_IND = 1
AND BUS_UNIT_ABBR <> 'AGCY'
AND POLICY_ID NOT IN
(
    SELECT POL_NBR FROM "PRD_OPS_DB"."APP_BIPL_DLV"."TABSPL_FCT_PAYMENT_METHOD_TS"
    WHERE PAYMENT_DATE >= {billing_date} AND BILLNG_LOB_DESC = 'PERSONAL AUTOMOBILE'
    AND INVOICE_TYPE = 'DOWN PAYMENT - RENEWAL'
)
AND PREV_TERM_LATEST_PREMIUM >= 300
AND (STATE_ABBR IS NULL OR LOWER(STATE_ABBR) IN (
      'ak', 'al', 'ar', 'az', 'co', 'ct', 'dc', 'de', 'fl', 'ga', 'ia', 'id', 'il', 
      'in', 'ks', 'ky', 'la', 'md', 'me', 'mi', 'mn', 'mo', 'ms', 'mt', 'nd', 'ne', 
      'nh', 'nj', 'nm', 'oh', 'ok', 'or', 'pa', 'ri', 'sc', 'sd', 'tn', 'tx', 'ut', 
      'va', 'vt', 'wi', 'wv', 'wy'))
AND (POL_LATST_INCID_MO_AGE_GRP IS NULL OR LOWER(POL_LATST_INCID_MO_AGE_GRP) IN ('0', '13-24', '25-36', '37', '38-60', '61'))
AND FLAT_CANCEL_FLAG = 0
AND OFFERED_PREMIUM_CHANGE >= 0.4
ORDER BY POL_EFF_DT;
"""

# Get data from Snowflake
cs = ctx.cursor()
try:
    cs.execute(query)
    df = cs.fetch_pandas_all()
finally:
    cs.close()
ctx.close()

import openpyxl
formatted_date = date.today().strftime("%m%d%y")
excel_filename = f'NowCo_Auto_Upcoming_Renewals_{formatted_date}.xlsx'
# excel_filename = f'NowCo_Auto_Upcoming_Renewals_0414_to_0518.xlsx'
df.to_excel(excel_filename, index=False)
wb = openpyxl.load_workbook(excel_filename)
ws = wb["Sheet1"]

# Iterate through all columns in the worksheet, use the column_dimensions property to get the column object, and set the auto_size attribute to True for automatic column width adjustment
for col in ws.columns:
    ws.column_dimensions[col[0].column_letter].auto_size = True

# Use the save method to save the modified Excel file
wb.save(excel_filename)

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.multipart import MIMEBase
from email import encoders
from openpyxl import load_workbook

formatted_start = start_date[6:8] + "/" + start_date[9:11] + "/" + start_date[1:5]
formatted_end = end_date[6:8] + "/" + end_date[9:11] + "/" + end_date[1:5]
formatted_billing = billing_date[6:8] + "/" + billing_date[9:11] + "/" + billing_date[1:5]

# Create the root message and fill in the from, to, and subject headers
msg = MIMEMultipart('related')
msg['Subject'] = f'NowCo Auto Upcoming Renewals: {formatted_start} - {formatted_end}'
msg['From'] = 'ProductAnalytics'
msg['To'] = 'peter.alonzo@thehartford.com'
msg['X-MSMail-Priority'] = 'High'

# Create the body with HTML
html = f"""\
<html>
  <body>
    <p>Please see the attached Excel file containing upcoming NowCo Auto Renewals.</p>
    <p>The following filters are being applied:</p>
    <br>
    <p>POL_EFF_DT: {formatted_start} to {formatted_end}</p>
    <p>POL_NEW_RNW_CD = R</p>
    <p>STATE_ABBR IN [ak,al,ar,az,co,ct,dc,de,fl,ga,ia,id,il,in,ks,ky,la,md,me,mi,mn,mo,ms,mt,nd,ne,nh,nj,nm,oh,ok,or,pa,ri,sc,sd,tn,tx,ut,va,vt,wi,wv,wy,null]</p>
    <p>OFFERED_PREMIUM_CHANGE >= 0.4</p>
    <p>POL_LATST_INCID_MO_AGE_GRP IN [0,13-24,25-36,37,38-60,61,null]</p>
    <p>FLAT_CANCEL_FLAG = 0</p>
    <p>BUS_UNIT_ABBR <> AGCY</p>
    <p>ACCT_CR_IND = 1</p>
    <p>PREV_TERM_LATEST_PREMIUM >= 300</p>
    <br>
    <p>Note: Eligible policyholders who made a down payment for their upcoming NowCo renewal on or after {formatted_billing} have been excluded</p>
    <br>
    <p>If you wish to make edits to the applied filters, add someone or remove yourself from the automatic email system, or have any clarifying questions,</p>
    <p>please reach out to Peter Alonzo or Kevin Bodie directly via email or Teams.</p>
  </body>
</html>
"""

part1 = MIMEText(html, 'html')
msg.attach(part1)

with open(excel_filename, 'rb') as attachment:
    part = MIMEBase('application', 'octet-stream')
    part.set_payload(attachment.read())
    encoders.encode_base64(part)
    part.add_header(
        'Content-Disposition',
        f'attachment; filename= {excel_filename}',
    )
    msg.attach(part)

email_list = ['peter.alonzo@thehartford.com', 'kevin.bodie@thehartford.com', 'caitlin.hart@thehartford.com',
              'jonathan.stahl@thehartford.com', 'todd.bertsch@thehartford.com', 'ashley.martin@thehartford.com',
              'james.capece@thehartford.com', 'jennifer.crawford1@thehartford.com', 'patricia.kovarik@thehartford.com',
              'melissa.huelsman@thehartford.com']

# Send the message via our own SMTP server, but don't include the envelope header
s = smtplib.SMTP('localhost')
s.sendmail('DoNotReply', email_list, msg.as_string())
s.quit()