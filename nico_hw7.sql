--question 1
select * from customer
where last_name like 'T%'
order by first_name;

--question 2
select * from rental
where return_date between '2005-05-28 00:00:00' and '2005-06-01 23:59:59';

--question 3
select * from film f
left join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
order by rental_rate DESC
limit 10;

--question 4
select c.first_name, c.last_name, sum(p.amount) as total_spent
from customer c
inner join payment p on c.customer_id = p.customer_id
group by c.customer_id
order by total_spent ASC;

--question 5
select a.first_name, a.last_name, count(*)
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id
order by count(*) desc;

--question 6
-- so for the customers amount spent, i got the customers' first and last names
-- then i joined the payment table to the customers table and summed up the amount spent by each in a new column
-- then i grouped by customer_id and sorted it in ascending order so the lowest spenders would be first

--as for the actors, i got their first and last names and joined it to the table that shows the film ids of the films they were in
--then i took the counts for how many times an actor's id appears and sorted the counts in descending order

-- question 7
select c.name as genre, round(avg(f.rental_rate),3) as avg_rent_rate from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by genre
order by avg_rent_rate desc;

-- question 8
select c.name as genre, count(*)
from category c
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by genre
order by count(*) desc
limit 5;
