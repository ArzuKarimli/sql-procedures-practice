


select * from Students

--create view vw_getStudentsByAge
--as
--select * from Students where [Age] > 25

select * from vw_getStudentsByAge

--create view vw_joinStudentsByCity
--as 
--select st.FullName as 'Student', ct.Name as 'City',co.Name as 'Country' from Students st
--join Cities ct
--on  st.CityId= ct.Id
--join Countries co
--on ct.CountryId = co.Id
--select * from vw_joinStudentsByCity


--create function dbo.showWord()
--returns nvarchar(50)
--as
--begin
--return 'P418'
--end

--declare @result nvarchar(50)=(select dbo.showWord())
--print @result



create function dbo.showWordWithParametr(@text nvarchar(50))
returns nvarchar(50)
as
begin
return @text
end

select dbo.showWordWithParametr('Aqshin bey') as 'Name'
select dbo.showWordWithParametr('Semed bey')
select dbo.showWordWithParametr('Oruc bey')

create function dbo.getStudentsAvgAgesById(@id int)
returns int
as
begin
declare @count int = (select COUNT(*) from Students where [Id] > @id)
declare @sumAge int = (select SUM(Age) from Students where [Id] > @id)
return @sumAge/@count
end

select * from Students

select dbo.getStudentsAvgAgesById(2)

create function dbo.getStudentsAvgAgesById2(@id int)
returns int
as
begin

declare @avgAge int = (select AVG(Age) from Students where [Id] > @id)
return @avgAge
end

select * from Students
select dbo.getStudentsAvgAgesById2(2)



declare @avgAge int = (select dbo.getStudentsAvgAgesById2(2))
select * from dbo.getStudentsByCondition(@avgAge)

--create function dbo.getStudentsByCondition(@avgAge int)
--returns table 
--as
--return (select * from Students where [Age] > @avgAge)


create procedure usp_showText
as
begin
print 'salam'
end

exec usp_showText

create procedure usp_showTextWithParametr
@text nvarchar(50)
as
begin
print @text
end
exec usp_showTextWithParametr 'Azerbaycan'

select * from Students 

create procedure usp_deleteStudentById
@id int
as
delete from Students where [Id]= @id

exec usp_deleteStudentById 1

--create procedure usp_deleteEmployeesById
--@id int
--as
--delete from Employees where [Id]= @id
--exec usp_deleteEmployeesById 1

--create procedure usp_createEmployee
--@name nvarchar(50),
--@surname nvarchar(50), @email nvarchar(100),
--@age int
--as
--begin
--insert into Employees ((Name), [Surname), [Email], [Age]) values (@name, @surname, @email,@age)
--end

exec usp_createEmployee 'Togiq2','Nasibli2','togiq@gmail.com',28

create function dbo.getEmployeesAvgAges (@id int)
returns int
as
begin
return (select AVG(Age) from Employees)
end

create procedure usp_deleteEmployeesByAge
as
begin
declare @avgAge int = (select dbo.getEmployees AvgAges())
delete from Employees where [Age]>@avgAge
end
select * from Employees

exec usp_deleteEmployeesByAge