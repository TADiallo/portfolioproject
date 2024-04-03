
SELECT * FROM swiggy;

select count(*) from swiggy;

## HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?

SELECT count(restaurant_no) as rate
from swiggy
 where rating > 4.5;

SELECT count(restaurant_name) as rate
from swiggy 
where rating > 4.5;

## WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?

SELECT city , count(distinct restaurant_name) as highest
from swiggy 
group by city 
order by highest desc 
limit 1;

## HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?

select distinct restaurant_name as count_name 
from swiggy 
where restaurant_name like '%pizza%';

## WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?

select cuisine, count(*) as common_count
from swiggy 
group by cuisine
 order by common_count desc 
 limit 1;

## WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?

select city, avg(rating) as avgrate
from swiggy 
group by city;

## WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?

select distinct restaurant_name , menu_category, max(price) as highest_price
from swiggy
 where menu_category = 'recommended' 
group by restaurant_name;

## FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.

select distinct restaurant_name , cost_per_person 
from swiggy 
where cuisine not like 'indian'
order by cost_per_person desc
 limit 5;

## FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.

select distinct restaurant_name, cost_per_person 
from swiggy 
where cost_per_person > ( select avg(cost_per_person) 
from swiggy);

## RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES

select distinct t1.restaurant_name, t1.city, t2.city
from swiggy t1 
join swiggy t2 
   on t1.restaurant_name = t2.restaurant_name
   and t1.city <> t2.city;

## WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?

select distinct restaurant_name, menu_category, count(item) as number_item
from swiggy 
where menu_category = 'main course'
group by restaurant_name, menu_category
order by number_item desc 
limit 1;

## LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.

select distinct restaurant_name, 
(count(case when veg_or_nonveg ='veg' then 1 end)*100/count(*)) as vegetarian_percentage
from swiggy  
group by restaurant_name
 having vegetarian_percentage = 100.00
order by restaurant_name;

## WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?

select distinct restaurant_name, avg(price) as avgprice
from swiggy
 group by restaurant_name
 order by avgprice 
 limit 1;

## WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?

select distinct restaurant_name, count(distinct menu_category) as number_category
 from swiggy 
 group by restaurant_name
 order by number_category desc 
 limit 5;

## WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select distinct restaurant_name,
(count(case when veg_or_non-veg = 'non-veg' then 1 end)*100/
count(*)) as non_veg_percentage 
from swiggy 
 group by restaurant_name
 order by non_veg_percentage desc
 limit 1;