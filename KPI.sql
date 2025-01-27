select * from finance_1;
select * from finance_2;

-- Total Loan Amount
select sum(loan_amnt) from finance_1;
select concat(round(sum(loan_amnt) / 1000000,0), 'M') as total_loan_amount from finance_1;

-- Total Fund Amount
select sum(funded_amnt) from finance_1;
select concat(round(sum(funded_amnt) / 1000000,0), 'M') as total_fund_amount from finance_1;

-- Total Revol Balance

select sum(revol_bal) from finance_2;
select concat(round(sum(revol_bal) / 1000000,0), 'M') as total_revol_amount from finance_2;

-- Total Number Of Loan issued

select count(id) from finance_1;
select concat(round(count(id) / 1000,1), 'K') as No_of_loan_issued from finance_1;

-- Average intrest Rate

select avg(int_rate) as avg_int_rate from finance_1;
select concat(round(avg(int_rate),2), '%') as Avg_int_rate from finance_1;

-- Grade wise loan amount

select grade, concat(round(sum(loan_amnt) / 10000000,2), 'Cr') as Total_loan_amount from finance_1
group by grade
order by grade;

--- Home ownership wise number of total loan issued 
select home_ownership, count(id) as Total_loan_issued from finance_1
group by home_ownership
order by home_ownership;

---- Year Wise Loan Amount Stats

select year(issue_d) as year_of_issued_date,
concat(round(sum(loan_amnt) / 1000000,0), 'M') as Total_loan_amount from finance_1
group by year_of_issued_date
order by year_of_issued_date asc ;


---- Grade and sub grade wise revol_bal

select grade, sub_grade, concat(round(sum(revol_bal) / 1000000,0), 'M')  as total_revol_balance
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade, sub_grade
order by grade, sub_grade;


---- Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status, 
concat(round(sum(total_pymnt) / 1000000,0), 'M') as total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status;



--- State wise and month wise loan status

select addr_state, monthname(issue_d) as Month_Name, loan_status,
count(*) As status_count
from finance_1
group by addr_state, monthname(issue_d),loan_status
order by addr_state, monthname(issue_d),loan_status;



--- Home ownership Vs last payment date stats

	select home_ownership, 
	count(issue_d) as total_count
	from finance_1 inner join finance_2
	on(finance_1.id = finance_2.id)
	group by home_ownership;

------ Top  5 State For Loan Amount

select addr_state, sum(loan_amnt) as Total_loan_amount
from finance_1
group by addr_state
order by Total_loan_amount desc
limit 5;








