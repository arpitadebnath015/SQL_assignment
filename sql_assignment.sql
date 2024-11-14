#1. Create a table called employees with the following structure;
 #emp_id (integer, should not be NULL and should be a primary key)`
 #emp_name (text, should not be NULL)`
 #age (integer, should have a check constraint to ensure the age is at least 18)`
 #email (text, should be unique for each employee)`
 #salary (decimal, with a default value of 30,000).
#Write the SQL query to create the above table with all constraints.

create database Emp_details;
use Emp_details;
create table employees
(emp_id int primary KEY,
emp_name Varchar(30) not null,
age int check (age>17),
email varchar (50) unique,
salary decimal(10,2) default (30000));
#to check
select * from employees;

#2.Explain the purpose of constraints and how they help maintain data integrity i n a database. Provide examples of common types of constraints.
-- Answer- In databases,constraints help mantaining the integrity by limiting the type of data that can be inserted,updated or deleted.
-- common types of constraints- Primary key,Foreign key,unique,not null,check,default etc.

#3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.
-- Answer- Not Null constraint is used in a column if we do not want the values to be null that is there has to be some value that wll define column and show relation with other columns.
-- No, Primary key can not contain null value as primary key works as a unique identifier in a database. also it is used to establish relationship with other columns. 


#4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.
-- Answer- for adding--
-- 1. ALTER TABLE statement
-- 2. Specify table name
-- 3. Specify constraint type (e.g., PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, NOT NULL)
-- 4. Define constraint details (e.g., columns, referenced table)
-- example-
-- CREATE TABLE customers (
--  customer_id INT,
--  name VARCHAR(95)
-- );

-- ALTER TABLE customers
-- ADD CONSTRAINT pk_customer_id PRIMARY KEY (customer_id);
-- for removing-
-- 1. ALTER TABLE statement
-- 2. Specify table name
-- 3. Specify constraint type (e.g., PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
-- 4. Specify constraint name (if known) or use system-generated name
-- example-
-- ALTER TABLE customers
-- DROP CONSTRAINT pk_customer_id;



#6. You created a products table without constraints as follows:
#CREATE TABLE products (
# product_id INT,
# product_name VARCHAR(50),
# price DECIMAL(10, 2));  
#Now, you realise that;The product_id should be a primary key.The price should have a default value of 50.00.

CREATE TABLE products (
product_id INT,
product_name VARCHAR(50),
price DECIMAL(10, 2));

alter table products change column product_id int product_id primary KEY;
alter table products change column price decimal(10,2) price default(50);

#7.
select s.student_name , c.class_name from students as s inner join classes as c on s.class_is = c.class_id;

#8.
 select o.order_id, c.customer_name, p.product_name 
from orders as o inner join customers as c 
on o.customer_id = c,customer_id
left join products as p
 on p.order_id = o.order_id;

#9.
select sum(amount),product_name
from sales s join products p
on s.product_id=p.product_id
group by product_id;


#10.
select o.order_id, c.name, od.quantity
 from orders as o inner join customer as c 
 on o.customer_id = c.customer_id
inner join order_details as od 
on od.order_id = o.order_id;


#sql commands

-- 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences

--   Table Name                 Primary Key                      Foreign Key
--   ===========             ==========================         ===================================================
-- 1.  actor						actor_id						Not Present
-- 2.  actor_award					actor_award_id					actor_id
-- 3.  address						address_id						city_id
-- 4.  advisor						advisor_id						Not Present
-- 5.  category						category_id						Not Present
-- 6.  country						country_id						Not Present
-- 7.  city							city_id							country_id
-- 8.  customer						customer_id						store_id , address_id
-- 9.  film							film_id							language_id
-- 10. film_actor					Not Present						actor_id , film_id
-- 11. film_category				film_id							category_id
-- 12. film_text					film_id							Not Present
-- 13. inventory					inventory_id					film_id, store_id
-- 14. language						language_id						Not Present
-- 15. payment 						payment_id						customer_id, staff_id , rental_id
-- 16. rental						rental_id						customer_id, staff_id, inventory_id
-- 17. staff						staff_id						address_id, store_id
-- 18. store						store_id						address_id

-- Differences between Primary key and Foreign Key
-- 1. The primary key is a unique identifier within its table, whereas a foreign key is a reference in one table to a primary key in another. 
-- 2. Primary key can not be null but foreign key can be null

-- =======================================================================================================================

-- 2- List all details of actors
Select * from mavenmovies.actor;

-- 3 -List all customer information from DB.
select * from mavenmovies.customer;

-- 4 -List different countries.
select * from mavenmovies.country;

-- 5 -Display all active customers.
select * from mavenmovies.customer where active=1;

-- 6 -List of all rental IDs for customer with ID 1.
select * from mavenmovies.rental where customer_id=1;

-- 7 - Display all the films whose rental duration is greater than 5 .
SELECT * FROM mavenmovies.film where rental_duration > 5;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT * FROM mavenmovies.film where replacement_cost between 15 and 20;

-- 9 - Display the count of unique first names of actors.
select count(distinct(first_name)) from mavenmovies.actor;

-- 10- Display the first 10 records from the customer table
select * from mavenmovies.customer limit 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from mavenmovies.customer where first_name like 'b%' limit 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
SELECT title FROM mavenmovies.film where rating='G' limit 5;

-- 13-Find all customers whose first name starts with "a".
select * from mavenmovies.customer where first_name like 'a%';

-- 14- Find all customers whose first name ends with "a"
select * from mavenmovies.customer where first_name like '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
select * from mavenmovies.customer where first_name like 'a%a';

-- 16- Find all customers whose first name have "NI" in any position.
select * from mavenmovies.customer where first_name like '%NI%';

-- 17- Find all customers whose first name have "r" in the second position .
select * from mavenmovies.customer where first_name like '_r%';

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
select * from mavenmovies.customer where first_name like 'a%' and length(first_name) >=5;

-- 19- Find all customers whose first name starts with "a" and ends with "o".
select * from mavenmovies.customer where first_name like 'a%o';

-- 20 - Get the films with pg and pg-13 rating using IN operator.
select title ,rating from mavenmovies.film where rating in ('PG' ,'PG-13');

-- 21 - Get the films with length between 50 to 100 using between operator.
select title ,length from mavenmovies.film where length between 50 and 100;

-- 22 - Get the top 50 actors using limit operator.
select * from mavenmovies.actor limit 50;
-- 
-- 23 - Get the distinct film ids from inventory table.
select distinct film_id from mavenmovies.inventory;



#Function
#Basic Aggregate Functions:

#Question 1: Retrieve the total number of rentals made in the Sakila database.

use sakila;
select * from rental;
select count(rental_id) as total_rents
from rental;

#Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.

select avg(datediff(return_date,rental_date)) average_duration
from rental
group by rental_date
order by average_duration desc;

#String Functions:
#Question 3: Display the first name and last name of customers in uppercase.

select * from customer;
select upper(first_name) as first_name_in_upper,upper(last_name) as last_name_in_upper
from customer;

#Question 4: Extract the month from the rental date and display it alongside the rental ID.
select * from rental;
select rental_id,month(rental_date) rental_month,rental_date,inventory_id,customer_id,return_date,staff_id,last_update
from rental;

#GROUP BY:
#Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
select customer_id,count(rental_id) rental_count
from rental
group by customer_id;

#Question 6: Find the total revenue generated by each store.
select * from payment;
select staff_id,sum(amount) total_revenue
from payment
group by staff_id;

#Question 7: Determine the total number of rentals for each category of movies.
select * from category;
select * from rental;
select * from film;
select * from inventory;
select c.name ,count(rental_id) total_rental
from category c join film_category fc 
on c.category_id=fc.category_id
join film f
on f.film_id=fc.film_id
join inventory i
on f.film_id=i.film_id
join rental r 
on i.inventory_id=r.inventory_id
group by c.name
order by total_rental desc;

#Question 8:Find the average rental rate of movies in each language.
Select 
l.name as language,
avg(f.rental_rate) as average_rental_rate
From language l
Join film f on l.language_id = f.language_id
Group by l.name
Order by average_rental_rate desc;

#Questions 9 -Display the title of the movie, customer s first name, and last name who rented it.
Select 
  f.title as movie_title,
  c.first_name as customer_first_name,
  c.last_name as customer_last_name,
  r.rental_date
From film f
Join inventory i on f.film_id = i.film_id
Join rental r on i.inventory_id = r.inventory_id
Join customer c on r.customer_id = c.customer_id
Order by r.rental_date desc;


#Question 10:Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
select * from actor;
select * from film_actor;
select * from film;
select first_name,last_name
from actor left join film_actor
on actor.actor_id= film_actor.actor_id
left join film
on film_actor.film_id=film.film_id
where title="Gone with the Wind";

#Question 11: Retrieve the customer names along with the total amount they've spent on rentals
select c.customer_id,c.first_name,c.last_name, Sum(amount) as Total_Amount 
from customer as c inner join rental as r
 on r.customer_id = c.customer_id
 inner join payment as p 
 on p.rental_id=r.rental_id
 group by c.customer_id;
 
#Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').

select c.customer_id ,f.title, c.first_name as Customer_First_Name, c.last_name as Customer_Last_Name from customer as c inner join address as a on c.address_id = a.address_id 
inner join city as ct on ct.city_id = a.city_id
inner join rental as r on r.customer_id = c.customer_id
inner join inventory as i on i.inventory_id = r.inventory_id
inner join film as f on f.film_id = i.film_id
where ct.city='London'
group by c.customer_id,f.title;

#Advance Joins and GROUP BY:

#Question 13:Display the top 5 rented movies along with the number of times they've been rented.
select f.title as Movie_Name ,Count(*) as Total_Rented_Times 
from rental as r inner join inventory as i
 on i.inventory_id=r.inventory_id
inner join film as f on f.film_id=i.film_id
group by f.film_id
order by Total_Rented_Times desc limit 5 ;

# Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).

select c.customer_id,c.first_name as Customer_First_Name, c.last_name as Customer_Last_Name, count(c.customer_id) as TotaL_Rented_Movies_From_Store1_or_store2 
from customer as c inner join rental as r 
on c.customer_id = r.customer_id
inner join inventory as i on i.inventory_id = r.inventory_id
where i.store_id in (1,2) group by c.customer_id;


#Windows function

#1. Rank the customers based on the total amount they've spent on rentals.
select * from  payment;
select customer_id,
rank() over(order by amount desc) as amount_rank
from payment;

#2.  Calculate the cumulative revenue generated by each film over time. 
WITH revenue_by_film_date AS (
  SELECT 
    f.film_id,
    f.title,
    r.rental_date,
    p.amount AS revenue,
    ROW_NUMBER() OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS row_num
  FROM 
    film f
  JOIN 
    inventory i ON f.film_id = i.film_id
  JOIN rental r ON i.inventory_id = r.inventory_id
  JOIN 
    payment p ON r.rental_id = p.rental_id
),
cumulative_revenue AS (
  SELECT 
    film_id,
    title,
    rental_date,
    revenue,
    SUM(revenue) OVER (PARTITION BY film_id ORDER BY rental_date) AS cumulative_revenue
  FROM 
    revenue_by_film_date
)
SELECT 
  film_id,
  title,
  rental_date,
  revenue,
  cumulative_revenue
FROM 
  cumulative_revenue
ORDER BY 
  film_id, rental_date;

#3. Determine the average rental duration for each film, considering films with similar lengths.
select * from film;
select film_id,title,length,rental_duration,
avg(rental_duration) over (partition by length) as avg_rental_duration
from film;

#4. Identify the top 3 films in each category based on their rental counts.
SELECT DISTINCT 
  category, 
  title, 
  rental_count
FROM (
  SELECT 
    c.name AS category, 
    f.title, 
    COUNT(r.rental_id) OVER (PARTITION BY c.name) AS rental_count,
    DENSE_RANK() OVER ( ORDER BY COUNT(r.rental_id) DESC) AS rank_
  FROM 
    category c
  JOIN 
    film_category fc ON c.category_id = fc.category_id
  JOIN 
    film f ON fc.film_id = f.film_id
  JOIN 
    inventory i ON f.film_id = i.film_id
  JOIN 
    rental r ON i.inventory_id = r.inventory_id
) sub
WHERE rank_ <= 3
ORDER BY category, rental_count DESC;

#5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  COUNT(r.rental_id) AS total_rentals,
  (SELECT COUNT(r.rental_id) / COUNT(DISTINCT c.customer_id) 
   FROM customer c 
   JOIN rental r ON c.customer_id = r.customer_id) AS average_rentals,
  COUNT(r.rental_id) - (SELECT COUNT(r.rental_id) / COUNT(DISTINCT c.customer_id) 
                       FROM customer c 
                       JOIN rental r ON c.customer_id = r.customer_id) AS rental_difference
FROM 
  customer c
JOIN 
  rental r ON c.customer_id = r.customer_id
GROUP BY 
  c.customer_id, c.first_name, c.last_name
ORDER BY 
  rental_difference DESC;
  
  #6. Find the monthly revenue trend for the entire rental store over time. 
  SELECT 
  EXTRACT(YEAR FROM p.payment_date) AS payment_year,
  EXTRACT(MONTH FROM p.payment_date) AS payment_month,
  SUM(p.amount) AS monthly_revenue
FROM 
  payment p
GROUP BY 
  EXTRACT(YEAR FROM p.payment_date),
  EXTRACT(MONTH FROM p.payment_date)
ORDER BY 
  payment_year, payment_month;
  
  #7.  Identify the customers whose total spending on rentals falls within the top 20% of all customers.
  WITH customer_spending AS (
  SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spending
  FROM 
    customer c
  JOIN 
    rental r ON c.customer_id = r.customer_id
  JOIN 
    payment p ON r.rental_id = p.rental_id
  GROUP BY 
    c.customer_id, c.first_name, c.last_name
),
spending_percentiles AS (
  SELECT 
    customer_id,
    first_name,
    last_name,
    total_spending,
    PERCENT_RANK() OVER (ORDER BY total_spending DESC) AS spending_percentile
  FROM 
    customer_spending
)
SELECT 
  customer_id,
  first_name,
  last_name,
  total_spending
FROM 
  spending_percentiles
WHERE 
  spending_percentile >= 0.8
ORDER BY 
  total_spending DESC;
  
  #8. Calculate the running total of rentals per category, ordered by rental count. 
  WITH rental_counts AS (
  SELECT 
    c.name AS category,
    COUNT(r.rental_id) AS rental_count
  FROM 
    category c
  JOIN 
    film_category fc ON c.category_id = fc.category_id
  JOIN 
    film f ON fc.film_id = f.film_id
  JOIN 
    inventory i ON f.film_id = i.film_id
  JOIN 
    rental r ON i.inventory_id = r.inventory_id
  GROUP BY 
    c.name
),
running_total AS (
  SELECT 
    category,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count) AS running_total
  FROM 
    rental_counts
)
SELECT 
  category,
  rental_count,
  running_total
FROM 
  running_total
ORDER BY 
  rental_count DESC;
  
  #9.Find the films that have been rented less than the average rental count for their respective categories. 
  WITH category_averages AS (
  SELECT 
    c.name AS category,
    AVG(r.rental_count) AS average_rentals
  FROM (
    SELECT 
      fc.category_id,
      f.film_id,
      COUNT(r.rental_id) AS rental_count
    FROM 
      film_category fc
    JOIN 
      film f ON fc.film_id = f.film_id
    JOIN 
      inventory i ON f.film_id = i.film_id
    JOIN 
      rental r ON i.inventory_id = r.inventory_id
    GROUP BY 
      fc.category_id, f.film_id
      ) r
  JOIN 
    category c ON r.category_id = c.category_id
  GROUP BY 
    c.name
),
film_rentals AS (
  SELECT 
    f.title,
    c.name AS category,
    COUNT(r.rental_id) AS rental_count
  FROM 
    film_category fc
  JOIN 
    film f ON fc.film_id = f.film_id
  JOIN 
    category c ON fc.category_id = c.category_id
  JOIN 
  inventory i ON f.film_id = i.film_id
  JOIN 
    rental r ON i.inventory_id = r.inventory_id
  GROUP BY 
    f.title, c.name
)
SELECT 
  fr.title,
  fr.category,
  fr.rental_count,
  ca.average_rentals
FROM 
  film_rentals fr
JOIN 
  category_averages ca ON fr.category = ca.category
WHERE 
  fr.rental_count < ca.average_rentals
ORDER BY 
  fr.category, fr.rental_count;
  
  #10. Identify the top 5 months with the highest revenue and display the revenue generated in each month
  SELECT 
  EXTRACT(YEAR FROM p.payment_date) AS payment_year,
  EXTRACT(MONTH FROM p.payment_date) AS payment_month,
  SUM(p.amount) AS monthly_revenue
FROM 
  payment p
GROUP BY 
  EXTRACT(YEAR FROM p.payment_date),
  EXTRACT(MONTH FROM p.payment_date)
ORDER BY 
  monthly_revenue DESC
LIMIT 5;

#Normalisation & CTE

-- 1. First Normal Form (1NF):
-- a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.

-- The 'film' table violates 1NF because the 'special_features' column can contain multiple values.
-- To acheive 1NF of film table first we need to remove the special_features column from film table and then create another table like
 Create Table film_special_feartures (
    film_id int not null,
    special_feature varchar(100) not null,
    primary key (film_id,special_feature),
    Foreign key(film_id) references film (film_id) on delete cascade on update cascade
 );
 
 
 
 -- 2. Second Normal Form (2NF):
-- a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.

-- Ans -> There is no table in sakila database that violate 2NF except film table. As per the above answer if we able to normalise the table into 1NF then 
-- all non- key attribute in film table currently fully dependent on single-column primary key film_id. so there is no partial dependency.By this we can achieve 2NF




-- 4. Normalization Process:
-- a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.

-- ANS
-- film table in sakila database violate 1NF because special_features column column can contain multiple values.So first we need to normalise it to 1NF
-- For that first we need to remove the column by doing following query

alter table sakila.film drop column special_features;

-- After that we need to create another table for special_features of film by doing following query
 Create Table film_special_feartures (
    film_id int not null,
    special_feature varchar(100) not null,
    primary key (film_id,special_feature),
    Foreign key(film_id) references film (film_id) on delete cascade on update cascade
 );

-- By executing the queries 1NF will be acheived

-- To achieve the 2NF we can check like :
-- all non- key attribute in film table currently fully dependent on single-column primary key film_id. so there is no partial dependency.
-- so 2NF is also achieved

#CTE
#5. CTE Basics:
 #a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.

select * from film_actor;
select * from actor; 

With total_count_cte as
(select actor_id, count(film_id) as total_films
from film_actor 
group by actor_id)
select fm.actor_id,first_name,last_name,total_films
from film_actor fm join total_count_cte
on fm.actor_id=total_count_cte.actor_id
join actor a
on fm.actor_id=a.actor_id;


#6. CTE with Joins:
 #a. Create a CTE that combines information from the film and language tables to display the film title,language name, and rental rate. 

 select * from film;
 select * from language;
 
 With film_data as
 (select language_id,title
 from film
 order by language_id)
 select f.language_id,name,f.title,rental_rate
 from film f join film_data
 on f.language_id=film_data.language_id
 join language l
 on f.language_id= l.language_id;
 
 #7. CTE for Aggregation:
 #a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.

 select * from customer;
 select * from payment;
 
 With total_payment as
 (select customer_id,sum(amount) as total_revenue
 from payment
 group by customer_id)
 select p.customer_id,first_name,last_name,total_revenue
 from payment p join total_payment
 on p.customer_id=total_payment.customer_id
 join customer c
 on p.customer_id=c.customer_id;
 
 
 #8. CTE with Window Functions:
# a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.

select * from film;
With film_ranking as
(select film_id,
rank() over (order by rental_duration) as rank_by_rental_duration
from film)
select film.film_id,title,rank_by_rental_duration
from film join film_ranking
on film.film_id=film_ranking.film_id;


#9. CTE and Filtering:
#a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the  customer table to retrieve additional customer details.

select * from rental;

With rental_per_customer as
(select customer_id,count(rental_id) as total_rental
from rental
group by customer_id)
select c.*,total_rental
from rental r join rental_per_customer
on r.customer_id= rental_per_customer.customer_id
join customer c
on rental_per_customer.customer_id= c.customer_id
where total_rental>2;

#10. CTE for Date Calculations:
#a. Write a query using a CTE to find the total number of rentals made each month, considering the  rental_date from the rental table.

select * from rental;

With rentals_per_month as
(select month(rental_date) as month_of_rental,count(rental_id) as total_rentals
from rental
group by month_of_rental)
select month_of_rental,total_rentals
from rentals_per_month
order by month_of_rental;


#11. CTE and Self-Join:
 #a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.

 select * from film_actor;
 select * from actor;
 With actor_pairs as 
 (select fa1.actor_id as actor1_id,
 fa2.actor_id as actor2_id,
 fa1.film_id,
 a1.first_name as actor1_first_name,
 a1.last_name as actor1_last_name,
 a2.first_name as actor2_first_name,
 a2.last_name as actor2_last_name
 from film_actor fa1 join film_actor fa2 
 on fa1.film_id=fa2.film_id
 join actor a1 
 on fa1.actor_id=a1.actor_id
 join actor a2 
 on fa2.actor_id=a2.actor_id
 where fa1.actor_id<fa2.actor_id)
 select actor1_first_name,
 actor1_last_name,
 actor2_first_name,
 actor2_last_name,
 f.title as film_title
 from actor_pairs join film f on actor_pairs.film_id=f.film_id
 order by actor1_last_name,actor2_last_name;
 
 
 #12. CTE for Recursive Search:
 #a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column 

select * from staff;
with recursive staff_data as
(select staff_id,first_name,last_name,manager_id
from staff
where manager_id is null
union all
select s.staff_id,s.first_name,s.last_name,s.manager_id
from staff s
inner join staff_data sd 
on s.manager_id=sd.staff_id)
select staff_id,first_name,last_name,manager_id
from staff_data;
