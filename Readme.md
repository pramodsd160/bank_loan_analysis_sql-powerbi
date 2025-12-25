# 🏦 **Bank Loan Analysis Dashboard (Power BI)**

## 📌 **Overview**
This project focuses on building **interactive Power BI dashboards** to analyze and monitor **bank loan performance**.  
The solution provides key KPIs with **MTD and MoM analysis**, differentiates **Good vs Bad loans**, and delivers insights across **time, geography, and borrower attributes**.  
These dashboards help stakeholders track **portfolio health**, identify **trends**, and support **data-driven lending and risk decisions**.

---

## 📑 **Table of Contents**
- [Overview](#-overview)
- [Project Structure](#-project-structure)
- [Tools and Technologies](#-tools-and-technologies)
- [Dataset](#-dataset)
- [Problem Statement](#-problem-statement)
- [Dashboard Requirements & Visuals](#-dashboard-requirements--visuals)
  - [Summary Dashboard](#1-summary-dashboard)
  - [Overview Dashboard](#2-overview-dashboard)
  - [Details Dashboard](#3-details-dashboard)
- [Key Learnings](#-key-learnings)
- [Conclusion](#-conclusion)
- [How to Run the Project](#-how-to-run-the-project)
- [Author & Contact](#author-&-contact)

---

## 📂 **Project Structure**
```
bank_loan_analysis
	├── dashboard
	├── dataset
	├── images
	├── other_resources
	├── script
	├── Readme.md
```
---

## 🔨 **Tools and Technologies**
- **Power BI** – Dashboard creation & data modeling  
- **DAX** – KPI calculations and time intelligence  
- **CSV** – Raw dataset  
- **Oracle SQL 11g** – Data validation & insights  
- **GitHub** – Version control & repository management  

---

## 📊 **Dataset**
- Dataset available in the **dataset** folder:  
  `bank_loan_analysis.csv` 

  **_Note: Data cleaning not required_**
- Other reference documents available in **other_resources** folder:
  - Bank Loan Domain Knowledge  
  - Data Validation Queries and DAX Measures  

---

## 🔍 **Problem Statement**
The bank lacks a **centralized and interactive reporting system** to effectively monitor loan portfolio performance.  
Key metrics such as **Loan Applications, Funded Amount, Repayments, Interest Rates, and Borrower Risk (DTI)** are not available in a consolidated, time-driven, and comparative format.

The objective of this project is to design dashboards that provide:
- Visibility into **overall lending performance**
- **MTD and MoM trend analysis**
- **Good vs Bad loan** comparison
- Regional and borrower-level insights  
to support **data-driven decision-making and risk assessment**.

---

## 📈 **Dashboard Requirements & Visuals**

### 1. **Summary Dashboard**
**Requirements**
- Overall loan performance at a glance  
- Total Loan Applications, Funded Amount, Amount Received  
- MTD values and MoM changes  
- Portfolio risk using Avg Interest Rate and Avg DTI  
- Good vs Bad loan comparison  
- Loan status–wise breakdown  

**Visuals Used**
- KPI Cards  
- Donut Charts (Good Loan % vs Bad Loan %)  
- Tabular Grid (Loan Status Analysis)  

![Dashboard Preview](Link)

---

### 2. **Overview Dashboard**
**Requirements**
- Monthly lending trends & seasonality  
- State-wise loan performance  
- Loan distribution by term  
- Impact of employment length  
- Loan purpose & home ownership analysis  

**Visuals Used**
- Line Chart (Funded Amount by Month)  
- Filled Map (Loan Applications by State)  
- Donut Chart (Loan Term)  
- Bar Charts (Employment Length, Loan Purpose)  
- Tree Map (Home Ownership)  

![Dashboard Preview](Link)

---

### 3. **Details Dashboard**
**Requirements**
- Loan-level detailed analysis  
- Drill-down and data validation  
- Filtering by State, Grade, and Loan Quality  
- Borrower, loan, and repayment details  

**Visuals Used**
- Detailed Table / Grid  
- Slicers (State, Grade, Good vs Bad Loan)  

![Dashboard Preview](Link)

---

## 📚 **Key Learnings**
- Built **end-to-end Power BI dashboards** for bank loan analysis  
- Created **business-driven KPIs** using DAX with MTD and MoM logic  
- Analyzed **Good vs Bad loans** for portfolio quality and risk  
- Performed **trend, regional, and borrower-level analysis**  
- Strengthened understanding of **lending metrics** (Interest Rate, DTI, Funded Amount)  
- Designed dashboards aligned with **real business requirements**

---

## ✅ **Conclusion**
The **Bank Loan Analysis Dashboard** provides a clear and actionable view of lending performance, borrower risk, and portfolio health.  
By combining high-level KPIs with detailed drill-down analysis, the solution enables effective **monitoring, risk management, and strategic planning**.

---

## ▶️ **How to Run the Project**

### 1. **Oracle SQL Developer**
- Import `bank_loan_analysis.csv` into Oracle database  
- Open `bank_loan_analysis.sql`  
- Run business validation queries  

---

### 2. **Connect Oracle SQL to Power BI**
**Power BI → Get Data → More → Oracle Database**

Use:
- `localhost:1521` (Oracle 11g default)
- Enter database username & password  
or
---

### **Import CSV Directly into Power BI**
- Power BI → Get Data → Text/CSV → `bank_loan_analysis.csv`  
- Build dashboards using measures, charts, and slicers  

📌 Reference Power BI file:  
`bank_loan_analysis_dashboard.pbix` (available in **dashboard** folder)

---

## **Author & Contact**
👤 **Author:** Pramod Dhamane (Data Analyst)
  - **[Email](pramodsd160@gmail.com)**
  - **[LinkedIn](www.linkedin.com/in/pramoddhamane)**
  - **[GitHub](https://github.com/pramodsd160)** # bank_loan_analysis_sql-powerbi
