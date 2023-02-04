SELECT * FROM `s&p_500_data`.ceo_data_pay_merged_sp500;

#Cleaning the data
#1.Removing the dollar( $) sign and comma(,) from the median_worker_pay and convert to integer
UPDATE `s&p_500_data`.ceo_data_pay_merged_sp500
SET median_worker_pay = REPLACE(REPLACE(median_worker_pay, ',',''),'$','');
#converrt to integer

#2.Removing the dollar( $) sign and comma(,) from the salary and convert to integer
UPDATE `s&p_500_data`.ceo_data_pay_merged_sp500
SET salary = REPLACE(REPLACE(salary, ',',''), '$','');

#3. Remove '%' and '20' in industry section
UPDATE `s&p_500_data`.ceo_data_pay_merged_sp500
SET industry = REPLACE(REPLACE(industry ,'%', ''),'20','');

#Droping the Pay_ratio column since its not important
ALTER TABLE `s&p_500_data`.ceo_data_pay_merged_sp500
DROP COLUMN pay_ratio;

#Calculating  the highest paid worker and ceo salary from the table
SELECT company_name, ceo_name,MAX(salary) , MAX(median_worker_pay) FROM `s&p_500_data`.ceo_data_pay_merged_sp500;

#Calculate the lowest paid CEO and the lowest paid worker
SELECT company_name, ceo_name, MIN(salary) , MIN(median_worker_pay) FROM `s&p_500_data`.ceo_data_pay_merged_sp500;

#Calculate the vairiation/PERCENTAGE difference IN CEO salary vs the median worker salary 
SELECT (ABS(salary-median_worker_pay)/((salary+median_worker_pay)/2)) * 100 AS percentage_difference FROM `s&p_500_data`.ceo_data_pay_merged_sp500;

#Calculating ceo salary that is above the industry average
SELECT company_name, ceo_name,industry,salary FROM `s&p_500_data`.ceo_data_pay_merged_sp500
WHERE salary > (SELECT AVG(salary) FROM `s&p_500_data`.ceo_data_pay_merged_sp500);
#Calculating the ceo salary that is below the industry average
SELECT company_name, ceo_name,industry,salary FROM `s&p_500_data`.ceo_data_pay_merged_sp500
WHERE salary < (SELECT AVG(salary) FROM `s&p_500_data`.ceo_data_pay_merged_sp500);

#An sql statement that calculates the values above the average in the column and calculates the respective percentage that is below
WITH t AS (
  SELECT salary, AVG(salary) OVER() as avg_value
  FROM `s&p_500_data`.ceo_data_pay_merged_sp500
)
SELECT 
  SUM(CASE WHEN salary > avg_value THEN 1 ELSE 0 END) as above_avg,
  SUM(CASE WHEN salary < avg_value THEN 1 ELSE 0 END) as below_avg,
  (SUM(CASE WHEN salary < avg_value THEN 1 ELSE 0 END) * 100.0) / COUNT(*) as below_avg_percentage
FROM t;

#Calculating the ceo salary in each industry
SELECT industry , AVG(median_worker_pay) AS avg_Worker_salary, AVG (salary) AS avg_ceo_salary FROM `s&p_500_data`.ceo_data_pay_merged_sp500
GROUP BY industry;

#calculating the industry with the hightest combined salaries
SELECT company_name, ceo_name,industry,salary, MAX((salary + median_worker_pay )/2) as maximum_average FROM `s&p_500_data`.ceo_data_pay_merged_sp500




