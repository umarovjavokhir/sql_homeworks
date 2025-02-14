
use W3Resource
go

--answer1
select * from inventory.Salesman
select * from inventory.Orders

select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders
where salesman_id in (select salesman_id from Inventory.Salesman where name='Paul Adam')

--answer2

select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders
where salesman_id in (select salesman_id from Inventory.Salesman where city='London')

--answer3

select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders
where salesman_id in (select salesman_id from Inventory.Orders where customer_id='3007')

--answer4

select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders
where purch_amt > (select avg(purch_amt) from Inventory.Orders where ord_date='2012-10-10')

--answer5

select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders
where salesman_id = (select salesman_id from Inventory.Salesman where city='New York')

--answer6

select commission from inventory.Salesman
where salesman_id = (select salesman_id from Inventory.Customer where city='Paris')

--answer7

select cust_name from inventory.Customer
where salesman_id < (select salesman_id from Inventory.Salesman where name='Mc Lyon')

--answer8

select grade, count(grade) as count from inventory.Customer
where grade > (select AVG(grade) as dt from Inventory.Customer where city='New York')
group by grade

--answer9

select ord_no, purch_amt, ord_date, salesman_id from inventory.Orders
where salesman_id in (select salesman_id from Inventory.Salesman 
where commission=(select max(commission) from Inventory.Salesman))

--answer10

select ord_no, purch_amt, ord_date, ic.customer_id, ic.salesman_id, cust_name from inventory.Orders io
join inventory.Customer ic on io.customer_id=ic.customer_id
where ord_date='2012-08-17'

--answer11

select * from Inventory.Customer
select salesman_id, name from inventory.Salesman 
where salesman_id in (select salesman_id from inventory.customer 
group by salesman_id having count(salesman_id)>1)

--answer12

select * from Inventory.orders
select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders 
where purch_amt > (select avg(purch_amt) from inventory.Orders)

--answer13

select * from Inventory.orders
select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.orders 
where purch_amt > =(select avg(purch_amt) from inventory.Orders)

--answer14

select * from Inventory.orders
select ord_date, sum(purch_amt) from inventory.Orders io 
group by ord_date 
having sum(purch_amt)>(select max(purch_amt) from Inventory.Orders where io.ord_date=ord_date)+1000

--answer15

select * from Inventory.Customer
where exists (select * from inventory.Customer where city='London')

--answer16

select * from inventory.Salesman 
where salesman_id in (select salesman_id from inventory.customer 
group by salesman_id having count(salesman_id)>1)

--answer17

select * from inventory.Salesman 
where salesman_id in (select salesman_id from inventory.customer 
group by salesman_id having count(salesman_id)=1)

--answer18

select * from inventory.Salesman 
where salesman_id in (
select salesman_id from Inventory.Orders group by customer_id, salesman_id having count(ord_no)>1)

--answer19-20

select * from inventory.Salesman 
where city in (select city from Inventory.Customer)

--answer21

select * from Inventory.salesman a
where exists (select * from Inventory.Customer b where a.name<b.cust_name)

--answer22

select * from Inventory.Customer 
where grade> any (select grade from Inventory.Customer where City<'New York')

--answer23

select * from Inventory.Orders 
where purch_amt > (select min(purch_amt) from Inventory.Orders where ord_date='2012-09-10')

--answer24

select * from Inventory.Orders 
where purch_amt < all (select purch_amt from Inventory.Customer where city='London')