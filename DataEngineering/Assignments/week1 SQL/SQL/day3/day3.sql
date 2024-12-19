--use pet_adoption
--The ROW_NUMBER function assigns a unique sequential integer to rows within a partition, starting at 1 for the first row in each partition.
--The RANK function assigns a unique rank for each row within a partition, based on the specified ordering. If two or more rows have the same value, they receive the same rank, and the next rank is skipped accordingly.
--The DENSE_RANK function works similarly to RANK, but it doesn’t leave gaps in the ranking sequence. If there are duplicate ranks, the next rank is simply incremented by 1.
--The NTILE function distributes rows into a specified number of roughly equal-sized groups or "tiles." Each tile is numbered sequentially from 1 to the number specified

select * from employee
select *,row_number() over(partition by department order by salary)  as row from employee
select *,row_number() over(order by salary) as row1 from employee
select *,rank() over(partition by department order by salary)  as row from employee
select *,rank() over(order by salary) as row1 from employee
select *,dense_rank() over(partition by department order by salary)  as row from employee
select *,dense_rank() over(order by salary) as row1 from employee
select *,ntile(2) over (order by salary) from employee
----Afternoon
----Stored procedure

create procedure finance_emp
as
begin
select id from employee
where department ='Finance'
end
go
exec finance_emp