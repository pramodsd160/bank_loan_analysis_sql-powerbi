

-- Loan Applications

--Total Loan Applications
SELECT COUNT(*) total_loan_application FROM bank_loan_data;
-- 38576


-- MTD Loan Applications
-- Counts all loan applications issued in December 2021.

SELECT
   COUNT(*) AS mtd_december_applications
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-12-01'
   AND issue_date < DATE '2022-01-01';
-- 4314

 
--PMTD Loan Applications
SELECT
   COUNT(*) AS mtd_november_applications
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-11-01'
   AND issue_date < DATE '2021-12-01';
-- 4035
  
-----------------------


/* MoM change and percentage change in loan application 

MoM Change = Current Month Value ? Previous Month Value

MoM % Change = (Current ? Previous)/ Previous × 100
(4314 - 4035) / 4035 x 100 = 6.91
*/


-- MoM change in November and December

SELECT
  dec_cnt - nov_cnt AS mom_change,
  ROUND((dec_cnt - nov_cnt) / nov_cnt * 100, 2) AS mom_change_pct
FROM (
  SELECT
    COUNT(CASE
            WHEN ISSUE_DATE >= DATE '2021-12-01'
             AND ISSUE_DATE <  DATE '2022-01-01'
            THEN 1
          END) AS dec_cnt,
    COUNT(CASE
            WHEN ISSUE_DATE >= DATE '2021-11-01'
             AND ISSUE_DATE <  DATE '2021-12-01'
            THEN 1
          END) AS nov_cnt
  FROM bank_loan_data
);


--------------------------------------
-- Total Funded Amount


SELECT
   SUM(loan_amount) AS total_funded_amount
FROM
   bank_loan_data;
-- 435757075


-- MTD Total Funded Amount
-- Month to Date (MTD) total loan given by bank for dec
SELECT
   SUM(loan_amount) AS mtd_dec_loan_amt
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-12-01'
   AND issue_date < DATE '2022-01-01';
-- 53981425


-- PMTD Total Funded Amount
-- Previous Month to Date (PMTD) loan amount (nov)
SELECT
   SUM(loan_amount) AS pmtd_nov_loan_amt
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-11-01'
   AND issue_date < DATE '2021-12-01';
-- 47754825


--------------------------------------
-- Total Amount Received

SELECT
   SUM(total_payment) AS total_amount_collected
FROM
   bank_loan_data;
-- 473070933


-- Total amount of Loan given by bank


-- Total loan Received / recovered  from customers
SELECT
   SUM(total_payment) AS total_amt_received
FROM
   bank_loan_data;
-- 473070933


-- Month to Date (MTD) total loan Amt Received -- December
SELECT
   SUM(total_payment) AS mtd_total_amt_rcv_dec
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-12-01'
   AND issue_date < DATE '2022-01-01';
-- 58074380


-- Previous Month to Date (PMTD) total loan Amt Received - November
SELECT
   SUM(total_payment) AS pmtd_total_amt_rcv_dec
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-11-01'
   AND issue_date < DATE '2021-12-01';
-- 50132030



-------------------------------------
--Average Interest Rate

-- Avg interest rate
SELECT
   AVG(int_rate) AS avg_interst_rate
FROM
   bank_loan_data;
--0.1204883139776026545002073828287017834923


SELECT
   AVG(int_rate) * 100 AS avg_interst_rate
FROM
   bank_loan_data;
-- 12.04883139776026545002073828287017834923

SELECT
   round(AVG(int_rate) * 100, 2) AS avg_interst_rate
FROM
   bank_loan_data;
-- 12.05


-- MTD Average Interest
-- Month to Date (MTD) Avg interest rate for December
SELECT
   round(AVG(int_rate) * 100, 2) AS mtd_avg_interst_rate
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-12-01'
   AND issue_date < DATE '2022-01-01';
-- 12.36

--PMTD Average Interest
-- Previous Month to Date (PMTD) Avg interest rate for November
SELECT
   round(AVG(int_rate) * 100, 2) AS pmtd_avg_interst_rate
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-11-01'
   AND issue_date < DATE '2021-12-01';
-- 11.94



---------------------------------

-- Avg DTI
-- Avg Debt-to-Income (DTI)

SELECT
   round(AVG(dti) * 100, 2) as Avg_DTI
FROM
   bank_loan_data;
-- 13.33
 
-- MTD Avg DTI
 -- Month-to-Date (MTD) Avg Debt-to-Income (DTI) for December
SELECT
   round(AVG(dti * 100), 2) AS mtd_avg_dti
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-12-01'
   AND issue_date < DATE '2022-01-01';
-- 13.67

-- PMTD Avg DTI
-- Previous Month-to-Date (PMTD) Avg Debt-to-Income (DTI) for November
SELECT
   round(AVG(dti * 100), 2) AS pmtd_avg_dti
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-11-01'
   AND issue_date < DATE '2021-12-01';
-- 13.3



-------------------------------
-- Good loan issued

-- Types of Loan Status 
SELECT DISTINCT
   ( loan_status )
FROM
   bank_loan_data;


-- Good Loan Percentage
-- Percentage of Good loan 
SELECT
   ( COUNT(
      CASE
         WHEN loan_status = 'Fully Paid'
              OR loan_status = 'Current' THEN
            id
      END
   ) * 100 ) / COUNT(id) AS good_loan_pct
FROM
   bank_loan_data;
-- 86.17534218166735794276233927830775611779

SELECT
   round((COUNT(
      CASE
         WHEN loan_status = 'Fully Paid'
              OR loan_status = 'Current' THEN
            id
      END
   ) * 100) / COUNT(id), 2) AS good_loan_pct
FROM
   bank_loan_data;
-- 86.18


-- Good Loan Applications
-- Number of Good load Applications
SELECT
   COUNT(loan_status) AS total_good_load_applications
FROM
   bank_loan_data
WHERE
   loan_status = 'Fully Paid'
   OR loan_status = 'Current';
-- 33243


-- Good Loan Funded Amount
SELECT
   SUM(loan_amount) AS good_loan_fund_amt
FROM
   bank_loan_data
WHERE
   loan_status = 'Fully Paid'
   OR loan_status = 'Current';
-- 370224850

SELECT
   round(SUM(loan_amount) / 1000000, 2) AS good_loan_fund_amt_in_million
FROM
   bank_loan_data
WHERE
   loan_status = 'Fully Paid'
   OR loan_status = 'Current';
-- 370.22


-- Good Loan Amount Received

SELECT
   SUM(total_payment) AS good_loan_receive_amt
FROM
   bank_loan_data
WHERE
   loan_status = 'Fully Paid'
   OR loan_status = 'Current';
-- 435786170

SELECT
   round(SUM(total_payment) / 1000000, 2) AS good_loan_receive_amt_in_mn
FROM
   bank_loan_data
WHERE
   loan_status = 'Fully Paid'
   OR loan_status = 'Current';
-- 435.79



--------------------------------------
-- BAD LOAN ISSUED

-- Bad Loan Percentage

-- Percentage of bad load

SELECT
   round((COUNT(
      CASE
         WHEN loan_status = 'Charged Off' THEN
            id
      END
   ) * 100) / COUNT(id), 2) AS bad_loan_pct
FROM
   bank_loan_data;
-- 13.824



-- Bad Loan Applications

-- Total applications of Bad loan
SELECT
   COUNT(id) AS bad_loan_applications
FROM
   bank_loan_data
WHERE
   loan_status = 'Charged Off';
-- 5333


-- Bad Loan Funded Amount
-- Given Amount to Bad loans
SELECT
   SUM(loan_amount) AS bad_loan_funded_amount
FROM
   bank_loan_data
WHERE
   loan_status = 'Charged Off';
-- 65532225


-- Bad Loan Amount Received 
-- Bad loans amount receive
SELECT
   SUM(total_payment) AS bad_loan_amount_receive
FROM
   bank_loan_data
WHERE
   loan_status = 'Charged Off';
-- 37284763


-- LOAN STATUS

-- Loan Status
SELECT
   loan_status,
   COUNT(id) AS total_loan_application,
   SUM(total_payment) AS total_amount_received,
   SUM(loan_amount) AS total_funded_amount,
   AVG(int_rate * 100) AS interest_rate,
   AVG(dti * 100) AS dti
FROM
   bank_loan_data
GROUP BY
   loan_status;


-- Month-to-Date MTD loan amount given and loan amount received
SELECT
   loan_status,
   SUM(total_payment) AS mtd_total_amount_received,
   SUM(loan_amount) AS mtd_total_funded_amount
FROM
   bank_loan_data
WHERE
   issue_date >= DATE '2021-12-01'
   AND issue_date < DATE '2022-01-01'
GROUP BY
   loan_status;


---------------------------

-- B.	BANK LOAN REPORT | OVERVIEW
  
-- Monthly Trend of Total_loan_application, Total_funded_amount, Total_amount_receive

SELECT
  EXTRACT(MONTH FROM issue_date) AS month_number,
  TO_CHAR(issue_date, 'Month')  AS month_name,
  COUNT(id)                     AS total_loan_applications,
  SUM(loan_amount)              AS total_funded_amount,
  SUM(total_payment)            AS total_amount_received
FROM bank_loan_data
GROUP BY
  EXTRACT(MONTH FROM issue_date),
  TO_CHAR(issue_date, 'Month')
ORDER BY
  month_number;



----------------------------------

-- STATE

-- State wise Total_Loan_Applications, Total_Funded_Amount, Total_Amount_Received
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state;

-- we can do with Total_Loan_Applications in Desc, Total_Funded_Amount in Desc
-- replace address_state with COUNT(id), or SUM(loan_amount) 


--------------------------------

-- TERM

-- Loan Term (months) wise Total_Loan_Applications, Total_Funded_Amount, Total_Amount_Received

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;



--------------------------------------------
-- EMPLOYEE LENGTH
-- Employees working Stability (emp_lenght) wise Total_Loan_Applications,
-- Total_Funded_Amount, Total_Amount_Received
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;









  
  







----------------------------

--PURPOSE


--- Purpose wise number of applications for loan
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) desc;



-----------------------------------------

--- HOME OWNERSHIP
-- check home ownership wise Total_Loan_Applications,
-- Total_Funded_Amount, Total_Amount_Received

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) desc;
