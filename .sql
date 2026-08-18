SELECT *
FROM `hr-analytics-505906.hr_analytics_db.hr_employees` 
LIMIT 5
-- Q1: What is the overall attrition rate across the organization?
SELECT 
    COUNT(*) AS total_employees,
    COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees`
-- Q2: Which departments suffer from the highest employee turnover?
SELECT Department,
 COUNT(*) AS total_employees,
    COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees`
GROUP BY Department
ORDER BY attrition_rate_percentage DESC;
-- Q3: How does mandatory or frequent OverTime impact attrition rates?
SELECT OverTime,
COUNT(*) AS total_employees,
    COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees`
GROUP BY OverTime
ORDER BY attrition_rate_percentage DESC;
-- Q4: What is the salary gap between employees who leave versus those who stay across different Job Roles?
SELECT JobRole,
 ROUND(COUNT(PercentSalaryHike)*100.0/SUM(PercentSalaryHike),2) AS salary_gap_percent
FROM `hr-analytics-505906.hr_analytics_db.hr_employees`
GROUP BY JobRole
ORDER BY salary_gap_percent DESC;
-- Q5: Does the distance from home strongly correlate with employee turnover?
SELECT DistanceFromHome,
 COUNT(*) AS total_employees,
    COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees`
GROUP BY DistanceFromHome
ORDER BY attrition_rate_percentage DESC;
-- Q6: Which Age Groups experience the highest vulnerability to leaving?
SELECT AgeGroup,
 COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees` 
GROUP BY AgeGroup
ORDER BY attrition_rate_percentage DESC;
-- Q7: How do Job Satisfaction and Environment Satisfaction scores drive employee retention?
SELECT EnvironmentSatisfaction,JobSatisfaction,
 COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees` 
GROUP BY EnvironmentSatisfaction,JobSatisfaction
ORDER BY attrition_rate_percentage DESC;
-- Q8: Does Stock Option Level effectively incentivize employees to stay?
SELECT StockOptionLevel,
 COUNTIF(Attrition = false) AS total_stay,
    ROUND(COUNTIF(Attrition =false) * 100.0 / COUNT(*), 2) AS stay_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees` 
GROUP BY StockOptionLevel
ORDER BY stay_rate_percentage DESC;
-- Q9: How does career stagnation (Years Since Last Promotion) impact attrition?
SELECT YearsSinceLastPromotion,
COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition =true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees` 
GROUP BY YearsSinceLastPromotion
ORDER BY attrition_rate_percentage DESC;
-- Q10: What is the attrition risk profile based on Business Travel frequency?
SELECT BusinessTravel,
 COUNTIF(Attrition = true) AS total_attrition,
    ROUND(COUNTIF(Attrition = true) * 100.0 / COUNT(*), 2) AS attrition_rate_percentage
FROM `hr-analytics-505906.hr_analytics_db.hr_employees` 
GROUP BY BusinessTravel
ORDER BY attrition_rate_percentage DESC;
