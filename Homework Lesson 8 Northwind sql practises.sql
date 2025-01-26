use Northwind


--1. Which shippers do we have? We have a table called Shippers. Return all the fields from all the shippers

select * from Shippers

--2 Certain fields from Categories

select CategoryName, Description from Categories

--3 Sales Representatives

select FirstName, LastName, HireDate from Employees
where Title='Sales Representative'

--4 Sales Representatives in the United States
select FirstName, LastName, HireDate from Employees
where Title='Sales Representative' and country='USA'

--5 Orders placed by specific EmployeeID

select orderid, OrderDate from Orders
where EmployeeID=5

--6 Suppliers and ContactTitles

select SupplierID, ContactName, ContactTitle from Suppliers
where ContactTitle<>'Marketing Manager'

--7 Products with “queso” in ProductName

select ProductID, ProductName from products
where ProductName like '%queso%'

--8 Orders shipping to France or Belgium

select orderid, CustomerID, ShipCountry from orders
where ShipCountry in ('France','Belgium')

--9 Orders shipping to any country in Latin America

select orderid, CustomerID, ShipCountry from orders
where ShipCountry in ('Brazil','Mexico','Argentina','Venezuela')

--10 Employees, in order of age

select FirstName, LastName, title, BirthDate from Employees
order by BirthDate asc

--11 Showing only the Date with a DateTime field
select FirstName, LastName, title, convert(date, BirthDate) from Employees
order by BirthDate asc

--12 Employees full nameselect FirstName, LastName, 
firstname + ' '+ LastName as FullName from Employees

--13 OrderDetails amount per line item

select OrderID, ProductID, UnitPrice, Quantity,
Unitprice * Quantity as TotalPrice from OrderDetails
order by OrderID, ProductID

--14 How many customers?
select count(customerid) as TotalCustomers from Customers

--15 When was the first order?

select top 1 OrderDate as FirstOrder from Orders
order by orderdate

select Min(OrderDate) as FirstOrder from Orders

--16 Countries where there are customers

select Country from Customers
group by Country

--17 Contact titles for customers
select ContactTitle, COUNT(Contacttitle) as TotalContactTitle from Customers
group by ContactTitle
order by TotalContactTitle desc

--18 Products with associated supplier names

select ProductID, ProductName, CompanyName from Products pr
join Suppliers sp on pr.SupplierID=sp.SupplierID
order by ProductID

--19 Orders and the Shipper that was used

select OrderID, convert(date, OrderDate) as OrderDate, CompanyName from orders od
join Shippers sh on sh.ShipperID=od.ShipVIa
where orderid<10300

--20 Categories, and the total products in each category

select CategoryName, count(Productname) as TotalProducts from Categories ct
join products pr on ct.CategoryID=pr.CategoryID
group by CategoryName
order by TotalProducts desc

--21 Total customers per country/city

select Country, City, COUNT(city) as TotalCustomer from Customers
group by country, city 
order by TotalCustomer desc

--22 Products that need reordering

select ProductID, ProductName, UnitsInStock, ReorderLevel from Products
where UnitsInStock < ReorderLevel
order by ProductID

--23 Products that need reordering continued

select ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from Products
where UnitsInStock + UnitsOnOrder <= ReorderLevel and Discontinued=0
order by ProductID

--24 Customer list by region

select CustomerID, CompanyName, Region from Customers
order by case 
when Region is null then 1 else 0 end, Region, CustomerID

--25 High freight charges

select top 3 ShipCountry, AVG(Freight) as AvergaFreight from Orders
group by ShipCountry
order by AvergaFreight desc

--26 High freight charges 2015

select top 3 ShipCountry, AVG(Freight) as AvergaFreight from Orders
where year(OrderDate)=2015
group by ShipCountry
order by AvergaFreight desc


--27 High freight charges with between
select * from orders
where OrderDate between '1/1/2015' and '12/31/2015' 
order by OrderDate

--there is a missing value of France with orderdate=12/31/2015
-- this is because even if between inclusice by timing it is 12/31/2015 00:00:00

--28 High freight charges - last year

select top 3 ShipCountry, AVG(Freight) as AvergaFreight from Orders
where OrderDate>=dateadd(year, -1, (select max(orderdate) from orders))
group by ShipCountry
order by AvergaFreight desc

--29 Inventory list

select os.EmployeeID, LastName, od.OrderID, ProductName, Quantity from OrderDetails od
join Orders os on os.OrderID= od.orderid
join Employees em on em.EmployeeID=os.employeeid
join Products pr on pr.ProductID=od.ProductID
order by od.orderid, od.ProductID

--30 Customers with no orders

select cs.CustomerID, os.CustomerID from orders os
right join Customers cs on cs.CustomerID=os.CustomerID
where os.CustomerID is null

--31 Customers with no orders for EmployeeID 4

select cs.CustomerID from orders os
right join Customers cs on cs.CustomerID=os.CustomerID and os.EmployeeID=4
where os.CustomerID is null 

Select CustomerID From Customers 
Where CustomerID not in (select CustomerID from Orders
where EmployeeID = 4)
