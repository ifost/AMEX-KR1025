create view 
  my_detail_billing_data
as 
( select 
     DETAIL_BILLING_DATA.ID,

     BLANK_FILLINS.SURNAME,
     BLANK_FILLINS.FIRSTNAME,
     BLANK_FILLINS.BUSINESS_UNIT,
     BLANK_FILLINS.DEPARTMENT_ID,
     BLANK_FILLINS.DISTRIBUTION_POINT,
     BLANK_FILLINS.LOCATION,

     SIC_TO_GENERAL_LEDGER.INDUSTRY_CODE,
     SIC_TO_GENERAL_LEDGER.SIC_DESCRIPTION,
     SIC_TO_GENERAL_LEDGER.GL_CODE,
     SIC_TO_GENERAL_LEDGER.GL_DESCRIPTION,

     DETAIL_BILLING_DATA.BILLED_AMT,
     DETAIL_BILLING_DATA.BILLED_CURRENCY_CODE,
     DETAIL_BILLING_DATA.BILL_BASIC_CTL_ACCT_NAME,
     DETAIL_BILLING_DATA.BILL_BASIC_CTL_ACCT_NUM,
     DETAIL_BILLING_DATA.BILL_DATE,
     DETAIL_BILLING_DATA.BUSINESS_PROCESS_DATE,
     DETAIL_BILLING_DATA.CARDMEM_ACNT_NAME,
     DETAIL_BILLING_DATA.CARDMEM_ACNT_NUM,
     DETAIL_BILLING_DATA.CM_REF_NUM,
     DETAIL_BILLING_DATA.DESCRIPTIVE_FORMAT_INDICATOR,
     DETAIL_BILLING_DATA.EMPLOYEE_ID,
     DETAIL_BILLING_DATA.FINANCIAL_CATEGORY_CODE,
     DETAIL_BILLING_DATA.GST_AMOUNT,
     DETAIL_BILLING_DATA.GST_SUPPLIED,
     DETAIL_BILLING_DATA.LANGUAGE_PREFERENCE,
     DETAIL_BILLING_DATA.LOCAL_CURRENCY_CODE,
     DETAIL_BILLING_DATA.LOCAL_TRANS_AMT,
     DETAIL_BILLING_DATA.MASTER_CTL_ACCT,
     DETAIL_BILLING_DATA.MIS_INDUSTRY_CODE,
     DETAIL_BILLING_DATA.PO_NUM,
     DETAIL_BILLING_DATA.REQUESTING_CTL_ACCT_NAME,
     DETAIL_BILLING_DATA.REQUESTING_CTL_ACCT_NUM,
     DETAIL_BILLING_DATA.ROC_ID,
     DETAIL_BILLING_DATA.SE_ABN_NUM,
     DETAIL_BILLING_DATA.SE_CITY,
     DETAIL_BILLING_DATA.SE_CNTRY_CODE,
     DETAIL_BILLING_DATA.SE_CNTRY_NAME,
     DETAIL_BILLING_DATA.SE_NAME_1,
     DETAIL_BILLING_DATA.SE_NAME_2,
     DETAIL_BILLING_DATA.SE_NUM,
     DETAIL_BILLING_DATA.SE_POSTCODE,
     DETAIL_BILLING_DATA.SE_STATE,
     DETAIL_BILLING_DATA.SE_STREET_1,
     DETAIL_BILLING_DATA.SE_STREET_2,
     DETAIL_BILLING_DATA.SE_SUPPLY_TAX_CLASS,
     DETAIL_BILLING_DATA.SIC,
     DETAIL_BILLING_DATA.TRANS_DATE,
     DETAIL_BILLING_DATA.TRANS_DESCR_LINE_1,
     DETAIL_BILLING_DATA.TRANS_DESCR_LINE_2,
     DETAIL_BILLING_DATA.TRANS_NUM,
     DETAIL_BILLING_DATA.TRANS_TYPE_CODE
FROM
          DETAIL_BILLING_DATA , BLANK_FILLINS, SIC_TO_GENERAL_LEDGER
WHERE
     DETAIL_BILLING_DATA.CARDMEM_ACNT_NUM 
       = BLANK_FILLINS.CARDMEM_ACNT_NUM(+) 
    AND
      ('X' || DETAIL_BILLING_DATA.SIC = 'X' || SIC_TO_GENERAL_LEDGER.SIC(+))

-- -- postgresql version
--FROM
--   DETAIL_BILLING_DATA 
--left join BLANK_FILLINS 
--       on DETAIL_BILLING_DATA.CARDMEM_ACNT_NUM = BLANK_FILLINS.CARDMEM_ACNT_NUM
--left join SIC_TO_GENERAL_LEDGER
--       on DETAIL_BILLING_DATA.SIC = SIC_TO_GENERAL_LEDGER.SIC
);

GRANT ALL ON MY_DETAIL_BILLING_DATA TO employee1,employee2, etc;

