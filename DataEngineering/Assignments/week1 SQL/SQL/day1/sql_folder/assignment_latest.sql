--create database Courier_Management_System

--use Courier_Management_System

--create table users(
--UserID INT PRIMARY KEY, 
--Name VARCHAR(255), 
--Email VARCHAR(255) UNIQUE, 
--Password VARCHAR(255), 
--ContactNumber VARCHAR(20), 
--Address TEXT 

--)

--create table Couriers(
--CourierID INT PRIMARY KEY, 
--SenderName VARCHAR(255), 
--SenderAddress TEXT, 
--ReceiverName VARCHAR(255), 
--ReceiverAddress TEXT, 
--Weight DECIMAL(5, 2), 
--Status VARCHAR(50), 
--TrackingNumber VARCHAR(20) UNIQUE, 
--DeliveryDate DATE
--);


--create table CourierServices(
--ServiceID INT PRIMARY KEY, 
--ServiceName VARCHAR(100), 
--Cost DECIMAL(8, 2));
--alter table Couriers
--add serviceid int
--alter table Couriers
--add constraint s_id
--foreign key (serviceid) references courierservices(serviceid)


--create table Employees(
--EmployeeID INT PRIMARY KEY, 
--Name VARCHAR(255), 
--Email VARCHAR(255) UNIQUE, 
--ContactNumber VARCHAR(20), 
--Role VARCHAR(50), 
--Salary DECIMAL(10, 2));
--create table Locations(
--LocationID INT PRIMARY KEY, 
--LocationName VARCHAR(100), 
--Address TEXT); 

--create table Payments( 
--PaymentID INT PRIMARY KEY, 
--CourierID INT, 
--LocationId INT, 
--Amount DECIMAL(10, 2), 
--PaymentDate DATE, 
--FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID), 
--FOREIGN KEY (LocationID) REFERENCES Locations(LocationID));

--create table orders(
--orderid int primary key,
--userid int,
--courierid int,
--orderdate date,
--foreign key (userid) references users(userid),
--foreign key (courierid) references couriers(courierid)
--)
--alter table orders
--add empid int
--alter table orders
--add constraint emp_id
--foreign key (empid) references employees(employeeid)

--create table parcels(
--parcelid int primary key,
--orderid int,
--foreign key (orderid) references orders(orderid)
--)

create table CourierCompany(
couriercompanyid int primary key identity,
companyname varchar(20),
courierid int,
employeeid int,
locationid int,
foreign key (courierid) references couriers(courierid),
foreign key (employeeid) references employees(employeeid),
foreign key (locationid) references locations(locationid)

)

--insert into users values(1,'Divya','divya@gmail.com','Divya123','9876543210','abc,chittoor,Andhra Pradesh')
--insert into users values(2,'Ramya','Ramya@gmail.com','Ramya123','9876542345','abc,Chennai,Tamil Nadu')
--insert into users values(3,'Bheem','Bheeem@gmail.com','Bheem123','9876543990','abc bangalore Karnataka')
--insert into users values(4,'Raju','Raju@gmail.com','Raju123','8888888888','abc mumbai maharashtra')

--insert into couriers values(1,'Divya','abc,chittoor,Andhra Pradesh','Ramya','abc,Chennai,Tamil Nadu',27.5,'delivered','tx123','2024-10-10')
--insert into couriers values(2,'Ramya','abc,chennai, Tamil nadu','Divya','abc,chittoor,Andhra Pradesh',14.5,'processing','tx124','2024-10-15')
--insert into couriers values(3,'Divya','abc,chittoor,Andhra Pradesh','Ramya','abc,Chennai,Tamil Nadu',34.5,'processing','tx125','2024-10-12')
--insert into couriers values(4,'Ramya','abc,chennai, Tamil nadu','Divya','abc,chittoor,Andhra Pradesh',10.2,'cancelled','tx126','2024-10-13')



--insert into employees values(1,'john doe','johndoe@gmail.com','9999999999','Sales manager',35000)
--insert into employees values(2,'jenifer doe','jeniferdoe@gmail.com','9999999998','Warehouse Manager',45000)
--insert into employees values(3,'Ricky john merchander','johnricky@gmail.com','9999999997','Sales manager',35000)
--insert into employees values(4,'Ram Singh','ramsingh@gmail.com','77777777777','Warehouse Manager',45000)

--insert into orders values(1,1,1,'2024-10-10',1)
--insert into orders values(2,1,3,'2024-10-09',2)
--insert into orders values(3,2,2,'2024-10-08',1)
--insert into orders values(4,2,4,'2024-10-09',3)
--insert into orders values(5,3,5,'2024-10-09',4)
--insert into orders values(6,3,6,'2024-10-09',4)

--insert into courierservices values(1,'standard',10.00),(2,'express',20.00),(3,'nextday delivery',80.00),(4,'twodaydelivery',60)

--insert into parcels values(1,1),(2,1),(3,3),(4,2),(5,3),(6,4),(7,5),(8,5),(9,6)

--update couriers set serviceid=1 where courierid=1
--update couriers set serviceid=2 where courierid=2
--update couriers set serviceid=2 where courierid=3
--update couriers set serviceid=3 where courierid=4
--insert into couriers values(5,'Bheem','abc bangalore Karnataka','Raju','abc mumbai maharashtra',15.6,'delivered','tx127','2024-10-10',1)
--insert into couriers values(6,'Bheem','abc bangalore Karnataka','Divya','abc chittoor Andhra Pradesh',5.6,'processing','tx128','2024-10-14',2)

--insert into locations values(1,'Branch 1','abc Chennai TamilNadu')
--insert into locations values(2,'Branch 2','abc Chittoor Andhra Pradesh')
--insert into locations values(3,'Head Office','abc Bangalore Karnataka')
--insert into locations values(4,'Regional Office Main','abc Mumbai Maharashtra')

--insert into payments values(1,1,2,60,'2024-10-10')
--insert into payments values(2,2,1,30,'2024-10-10')
--insert into payments values(3,3,2,65,'2024-10-09')
--insert into payments values(4,4,1,50,'2024-10-09')
--insert into payments values(5,5,3,1200,'2024-10-09')
--insert into payments values(6,6,3,4500,'2024-10-10')

------------------------------------------------------------Task2------------------------------------------------------------------
--Task2
--1. List all customers: 
--select * from users

--2. List all orders for a specific customer:
--select * from orders
--where userid=1


--3. List all couriers: 
--select * from couriers

--4. List all packages for a specific order: 
--select * from parcels
--where  orderid=3


--5. List all deliveries for a specific courier: 
--select * from couriers
--where courierid =1

--6. List all undelivered packages: 
--select p.*,c.* from parcels p
--join orders o on o.orderid=p.orderid
--join couriers c on c.courierid=o.courierid
--where c.status!='delivered'

--7. List all packages that are scheduled for delivery today: 
--select p.*,c.* from parcels p
--join orders o on o.orderid=p.orderid
--join couriers c on c.courierid=o.courierid
--where c.deliverydate=cast(getdate() as date)

--8. List all packages with a specific status:
--select p.*,c.* from parcels p
--join orders o on o.orderid=p.orderid
--join couriers c on c.courierid=o.courierid
--where c.status='processing'

--9. Calculate the total number of packages for each courier.

--SELECT c.CourierID, 
--       (SELECT COUNT(p.ParcelID) 
--        FROM Parcels p 
--        JOIN Orders o ON p.OrderID = o.OrderID 
--		WHERE c.CourierID = p.orderid) AS TotalPackages
--FROM Couriers c;

--10. Find the average delivery time for each courier

--WITH DeliveryTimes AS (
--    SELECT o.CourierID, 
--           DATEDIFF(DAY, o.OrderDate, c.DeliveryDate) AS DeliveryTime
--    FROM Orders o
--    JOIN Couriers c ON o.CourierID = c.CourierID
--)
--SELECT c.CourierID, 
--       (SELECT AVG(DeliveryTime) 
--        FROM DeliveryTimes dt 
--        WHERE dt.CourierID = c.CourierID) AS AvgDeliveryTime
--FROM Couriers c;

--11. List all packages with a specific weight range: 
--SELECT p.*,c.weight 
--FROM Parcels p
--JOIN Couriers c ON p.OrderID = c.CourierID
--WHERE c.Weight BETWEEN 10 AND 20;

--12. Retrieve employees whose names contain 'John'
--select * from employees 
--where name like '%john%'

--13. Retrieve all courier records with payments greater than $50. 
--select c.*,p.amount
--from couriers c join payments p on p.courierid=c.courierid
--where p.amount >50

-------------------------------------------Task3--------------------------------------------------------------------------
 
--14. Find the total number of couriers handled by each employee.

--SELECT e.EmployeeID, e.Name, COUNT(o.OrderID) AS TotalCouriers
--FROM Employees e
--LEFT JOIN Orders o ON e.EmployeeID = o.EmpID
--GROUP BY e.EmployeeID, e.Name;

--15. Calculate the total revenue generated by each location 
--SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue
--FROM Locations l
--left JOIN Payments p ON l.LocationID = p.LocationID
--GROUP BY l.LocationID, l.LocationName;

--16. Find the total number of couriers delivered to each location. 
--SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS TotalCouriers
--FROM Locations l
--JOIN Payments p ON l.LocationID = p.LocationID
--JOIN Couriers c ON p.CourierID = c.CourierID
--WHERE c.Status = 'delivered'
--GROUP BY l.LocationID, l.LocationName;

--17. Find the courier with the highest average delivery time:
--SELECT top 1 c.courierid,AVG(DATEDIFF(dd, o.OrderDate,c.DeliveryDate)) AS AverageDeliveryTime
--FROM Couriers c
--JOIN Orders o ON c.CourierID = o.CourierID
--GROUP BY c.CourierID
--ORDER BY AverageDeliveryTime DESC



--18. Find Locations with Total Payments Less Than a Certain Amount
--SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
--FROM Locations l
--JOIN Payments p ON l.LocationID = p.LocationID
--GROUP BY l.LocationID, l.LocationName
--HAVING sum(p.amount) < 500;

--19. Calculate Total Payments per Location
--SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
--FROM Locations l
--left JOIN Payments p ON l.LocationID = p.LocationID
--GROUP BY l.LocationID, l.LocationName;

--20. Retrieve couriers who have received payments totaling more than $1000 in a specific location 
--(LocationID = X):

--SELECT c.CourierID, c.SenderName, c.ReceiverName, SUM(p.Amount) AS TotalPayments
--FROM Couriers c
--JOIN Payments p ON c.CourierID = p.CourierID
--JOIN Locations l ON p.LocationID = l.LocationID
--WHERE l.LocationID = 3 
--GROUP BY c.CourierID, c.SenderName, c.ReceiverName
--HAVING SUM(p.Amount) > 1000;

--21. Retrieve couriers who have received payments totaling more than $1000 after a certain date 
--(PaymentDate > 'YYYY-MM-DD'):
--SELECT c.CourierID, c.SenderName, c.ReceiverName
--FROM Couriers c
--JOIN Payments p ON c.CourierID = p.CourierID
--WHERE p.PaymentDate > '2024-10-05'
--GROUP BY c.CourierID,c.SenderName,c.receivername
--HAVING SUM(p.Amount) > 1000;

--22. Retrieve locations where the total amount received is more than $5000 before a certain date 
--(PaymentDate > 'YYYY-MM-DD') 

--SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
--FROM Locations l
--JOIN Payments p ON l.LocationID = p.LocationID
--WHERE p.PaymentDate < '2024-10-12'
--GROUP BY l.LocationID, l.LocationName
--HAVING  SUM(p.Amount)> 5000;
-----------------------------------------------Task4------------------------------------------------------------
--23. Retrieve Payments with Courier Information 
--SELECT p.PaymentID, p.Amount, p.PaymentDate, c.SenderName, c.ReceiverName
--FROM Payments p
--INNER JOIN Couriers c ON p.CourierID = c.CourierID;

--24. Retrieve Payments with Location Information 
--SELECT p.PaymentID, p.Amount, p.PaymentDate, l.LocationName, l.Address
--FROM Payments p
--INNER JOIN Locations l ON p.LocationID = l.LocationID;

--25. Retrieve Payments with Courier and Location Information
--SELECT p.PaymentID, p.Amount, p.PaymentDate, c.SenderName, l.LocationName
--FROM Payments p
--INNER JOIN Couriers c ON p.CourierID = c.CourierID
--INNER JOIN Locations l ON p.LocationID = l.LocationID;

--26. List all payments with courier details 
--SELECT p.*, c.*
--FROM Payments p
--LEFT JOIN Couriers c ON p.CourierID = c.CourierID;

--27. Total payments received for each courier 
--SELECT c.CourierID, SUM(p.Amount) AS TotalPayments
--FROM Payments p
--INNER JOIN Couriers c ON p.CourierID = c.CourierID
--GROUP BY c.CourierID;

--28. List payments made on a specific date
--SELECT *
--FROM Payments
--WHERE PaymentDate = '2024-10-09'; 


--29. Get Courier Information for Each Payment 
--SELECT p.*, c.*
--FROM Payments p
--LEFT JOIN Couriers c ON p.CourierID = c.CourierID;

--30. Get Payment Details with Location
--SELECT p.*, l.*
--FROM Payments p
--LEFT JOIN Locations l ON p.LocationID = l.LocationID;

--31. Calculating Total Payments for Each Courier
--SELECT c.CourierID, SUM(p.Amount) AS TotalPayments
--FROM Payments p
--INNER JOIN Couriers c ON p.CourierID = c.CourierID
--GROUP BY c.CourierID;

--32. List Payments Within a Date Range 
--SELECT *
--FROM Payments
--WHERE PaymentDate BETWEEN '2024-10-08' AND '2024-10-09';


--33. Retrieve a list of all users and their corresponding courier records, including cases where there are 
--no matches on either side 
--SELECT u.*, c.*
--FROM Users u
--FULL OUTER JOIN orders o on o.userid=u.userid
--full outer join couriers c on c.courierid=o.courierid

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no 
--matches on either side 
--SELECT c.*, cs.*
--FROM Couriers c
--FULL OUTER JOIN CourierServices cs ON c.ServiceID = cs.ServiceID;

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are 
--no matches on either side 
--select e.*,p.* from employees e
--full outer join orders o on o.empid=e.EmployeeID
--full outer join couriers c on c.CourierID=o.courierid
--full outer join payments p on p.CourierID=c.CourierID

--36. List all users and all courier services, showing all possible combinations. 
--SELECT u.*, cs.*
--FROM Users u
--CROSS JOIN CourierServices cs;

--37. List all employees and all locations, showing all possible combinations:
--SELECT e.*, l.*
--FROM Employees e
--CROSS JOIN Locations l;

--38. Retrieve a list of couriers and their corresponding sender information (if available)
--SELECT c.courierid,u.*
--FROM Couriers c
--join orders o on o.courierid=c.courierid
--join users u on o.userid=u.userid;
--39. Retrieve a list of couriers and their corresponding receiver information (if available):
--SELECT c.CourierID, c.ReceiverName, c.ReceiverAddress
--FROM Couriers c;

--40. Retrieve a list of couriers along with the courier service details (if available): 
--SELECT c.*, cs.*
--FROM Couriers c
--LEFT JOIN CourierServices cs ON c.ServiceID = cs.ServiceID;

--41. Retrieve a list of employees and the number of couriers assigned to each employee:
--SELECT e.EmployeeID, e.Name, COUNT(o.CourierID) AS CourierCount
--FROM Employees e
--LEFT JOIN Orders o ON e.EmployeeID = o.EmpID
--GROUP BY e.EmployeeID, e.Name;

--42. Retrieve a list of locations and the total payment amount received at each location: 
--SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
--FROM Locations l
--LEFT JOIN Payments p ON l.LocationID = p.LocationID
--GROUP BY l.LocationID, l.LocationName;


--43. Retrieve all couriers sent by the same sender (based on SenderName).
--SELECT c.SenderName, c.CourierID
--FROM Couriers c
--ORDER BY c.SenderName;

--44. List all employees who share the same role. 
--SELECT *
--FROM Employees
--WHERE Role IN (
--    SELECT Role
--    FROM Employees
--    GROUP BY Role
--    HAVING COUNT(*) > 1
--)
--ORDER BY Role;

--45. Retrieve all payments made for couriers sent from the same location. 
--SELECT l.LocationName, p.PaymentID, p.Amount, p.PaymentDate, 
--       c.CourierID, c.SenderName, c.SenderAddress
--FROM Payments p
--JOIN Couriers c ON p.CourierID = c.CourierID
--JOIN Locations l ON p.LocationID = l.LocationID
--WHERE 
--    l.LocationID IN (
--        SELECT p.LocationID 
--        FROM Payments p
--        GROUP BY p.LocationID
--        HAVING COUNT(*) > 1
--    )
--ORDER BY l.LocationName, p.PaymentDate;



--46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT * 
FROM Couriers c
WHERE 
    CAST(c.SenderAddress AS VARCHAR(MAX)) IN (
        SELECT 
            CAST(SenderAddress AS VARCHAR(MAX))
        FROM 
            Couriers
        GROUP BY 
            CAST(SenderAddress AS VARCHAR(MAX))
        HAVING 
            COUNT(*) > 1
    )
ORDER BY 
    CAST(c.SenderAddress AS VARCHAR(MAX)), c.CourierID;
----47. List employees and the number of couriers they have delivered: 

--SELECT e.EmployeeID, e.Name, COUNT(o.CourierID) AS CourierCount
--FROM Employees e
--LEFT JOIN Orders o ON e.EmployeeID = o.EmpID
--LEFT JOIN Couriers c ON o.CourierID = c.CourierID
--WHERE c.Status = 'Delivered'  
--GROUP BY e.EmployeeID, e.Name;


--48. Find couriers that were paid an amount greater than the cost of their respective courier services
--SELECT c.*
--FROM Couriers c
--INNER JOIN Payments p ON c.CourierID = p.CourierID
--INNER JOIN CourierServices cs ON c.ServiceID = cs.ServiceID
--WHERE p.Amount >cs.Cost;
--Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All 
--49. Find couriers that have a weight greater than the average weight of all couriers 
--SELECT c.*
--FROM Couriers c
--JOIN (
--    SELECT AVG(Weight) AS AvgWeight
--    FROM Couriers
--) AS avg_weight_table ON c.Weight > avg_weight_table.AvgWeight;
--50. Find the names of all employees who have a salary greater than the average salary:
--SELECT Name
--FROM Employees
--WHERE Salary > (SELECT AVG(Salary) FROM Employees);
--51. Find the total cost of all courier services where the cost is less than the maximum cost 
--SELECT SUM(Cost) AS TotalCost
--FROM CourierServices
--WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);
--52. Find all couriers that have been paid for 
--SELECT  c.*
--FROM Couriers c
--WHERE EXISTS (
--    SELECT 1
--    FROM Payments p
--    WHERE p.CourierID = c.CourierID
--);
--53. Find the locations where the maximum payment amount was made 

--SELECT l.*
--FROM Locations l
--WHERE (SELECT MAX(Amount) FROM Payments) = ANY (
--    SELECT p.Amount
--    FROM Payments p
--    WHERE p.LocationID = l.LocationID
--);
--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender 
--(e.g., 'SenderName'):
--SELECT c.*
--FROM Couriers c
--WHERE c.Weight > ALL (
--    SELECT c2.Weight
--    FROM Couriers c2
--    WHERE c2.SenderName = 'Ramya'  
--);


