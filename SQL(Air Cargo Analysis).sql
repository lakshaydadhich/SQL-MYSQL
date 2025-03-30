create database project;
use project;
show tables;

#               1
create table route_details(route_id int UNIQUE,flight_num int check(flight_num>=1111),
origin_airport varchar(30),destination_airport varchar(30),
aircraft_id int,distance_miles int check(distance_miles>0));
select*from route_details;

#             2
select customer_id from passengers_on_flights where route_id between 01 and 25;

#            3
select count(customer_id),sum(price_per_ticket)from ticket_details where class_id="Bussiness";

#                4
select concat(first_name," ",last_name) from customer;

#              5
select *from customer join ticket_details on customer.customer_id=ticket_details.customer_id;

#         6
select first_name,last_name from ticket_details join customer on 
customer.customer_id=ticket_details.customer_id
 where ticket_details.customer_id>=20 and brand="Emirates";
 
 #             7
 /*. Write a query to identify the customers who have travelled by Economy 
Plus class using Group By and Having clause on the passengers_on_flights 
table
*/
select count(seat_num),class_id from passengers_on_flights group by(class_id)
 having class_id="Economy Plus";
 
 
 #            8
 /*Write a query to identify whether the revenue has crossed 10000 using 
the IF clause on the ticket_details table*/
select if(sum(price_per_ticket)>10000,"yes revenue crossed 10000","no revenue less than 10000")from ticket_details;
 
 
 #          9
 /*Write a query to create and grant access to a new user to perform 
operations on a database*/
USE PROJECT;
create user lakshaay1;
GRANT ALL PRIVILEGES ON project TO 'lakshaay1';


#            10
/*.Write a query to find the maximum ticket price for each class using 
window functions on the ticket_details table*/








#        11
/*Write a query to extract the passengers whose route ID is 4 by improving 
the speed and performance of the passengers_on_flights table
 */
 create index lakshay on passengers_on_flights(route_id);
 select customer_id from passengers_on_flights where route_id=4;
 
 #    12
 /*For the route ID 4, write a query to view the execution plan of the 
passengers_on_flights table.*/
 select*from passengers_on_flights where route_id=4 ;
 
 #                   13
 /*Write a query to calculate the total price of all tickets booked by a 
customer across different aircraft IDs using rollup function. */
select price_per_ticket from ticket_details;
select aircraft_id,sum(price_per_ticket)from ticket_details group by aircraft_id with rollup;

#              14
/*Write a query to create a view with only business class customers along 
with the brand of airlines. */

create view projectview As select customer_id ,brand from ticket_details where class_id="Bussiness";


#                15
 /*Write a query to create a stored procedure to get the details of all 
passengers flying between a range of routes defined in run time. Also, 
return an error message if the table doesn't exist.*/






#                           16
/*Write a query to create a stored procedure that extracts all the details 
from the routes table where the travelled distance is more than 2000 
miles.*/
call lakshayy;
 
 
 #                          17
 /*Write a query to create a stored procedure that groups the distance 
travelled by each flight into three categories. The categories are, short 
distance travel (SDT) for >=0 AND <= 2000 miles, intermediate distance 
travel (IDT) for >2000 AND <=6500, and long-distance travel (LDT) for 
>6500.*/
call helllo;

#                  18
/*Write a query to extract ticket purchase date, customer ID, class ID and 
specify if the complimentary services are provided for the specific class 
using a stored function in stored procedure on the ticket_details table. 
Condition: 
● If the class is Business and Economy Plus, then complimentary services 
are given as Yes, else it is No*/
call eighteen;
 
 
 #        19
 /*Write a query to extract the first record of the customer whose last name 
ends with Scott using a cursor from the customer table.*/
select*from customer;
select first_name from customer where last_name like"%Scott" limit 1;