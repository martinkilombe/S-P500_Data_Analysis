<h1 align="center">
  CEO vs Worker Pay in Top 3000 US Companies [2023]
</h1

<p align="center">This dataset provides a deep dive into the pay practices of the top 3000 companies in the US, including the Russell 3000 and S&P 500 indices. The project entails cleaning the data,creating new tables and performing Analytics on the data set on  <b>SQL</b>.</p>

<b>The data table columns includes:
- Company name
- CEO name
- CEO salary
- Industry
- Company Ticker
- Median worker pay
- Pay ratio</b>

<b>Data source<b>: https://www.kaggle.com/datasets/salimwid/latest-top-3000-companies-ceo-salary-202223 (.csv also available in this repo)

<b>The following were performed on the data set :</b>
# 📒 Data cleaning
# 📊 Data Analysis and Exploration 📈




Here's a brief overview of the project goals
- Cleaning Data. 
  1. Removing the dollar( $) sign and comma(,) from the median_worker_pay,salary and convert to integer.
  2. Remove '%' and '20' in industry section (commiunication column).
  3. Droping the Pay_ratio column since its not important in calculation.
  4. Remove commas(,) and full stops(.) in company_Name field.
  
- Basic Analysis and Exploration
  1. Calculating the highest and lowest paid worker and ceo salary from the table.
  2. Calculate the vairiation/PERCENTAGE difference IN CEO salary vs the median worker salary .
  3. Calculating ceo salary that is above the industry average.
  4. Calculating the ceo salary in each industry.
  5. Calculating the ceo salary that is below the industry average.
  
