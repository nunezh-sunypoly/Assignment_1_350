--		Assignment 1
--		CS 350 Section 11
--		Nicholas Littlefield CS350

--		10.		Show how many employees in the IT department are paid more than the manager
--				of the Shipping department.
--		(A)		Nicholas Littlefield

	select	department_name, count(*)
	from	employees e
	inner join	departments d
		on		e.department_id = d.department_id
	where	d.department_name = 'IT'
	and		e.salary > (
		select	salary
		from	employees
		where	d.department_name = 'Shipping'
		and		e.employee_id = e.manager_id
	)
	group by	department_name;


--		11.		Using “set-theory SQL” (that is, one or more of the keywords union, 
--				intersect, minus must appear), show the employee id, first name and 
--				last name of each employee who is not managed by Nancy Greenberg
--		(A)		Nicholas Littlefield

	select	e.employee_id, e.first_name, e.last_name
	from	employees e
	except
	select	e.employee_id, e.first_name, e.last_name
	from	employees e
	where	e.manager_id = (
		select	employee_id
		from	employees e
		where	first_name = 'Nancy' and last_name = 'Greenberg'
	);


--		12.		using “set-theory SQL”, show the employee id and last names of all
--				employees paid more than 9000 or who work in Germany
--		(A)		Nicholas Littlefield
	
	select 	e.last_name, e.employee_id
	from 	employees e
	where	e.salary > '9000'
	union
	select 	e.last_name, e.employee_id
	from 	employees e, countries c
	where	c.country_name = 'Germany';


--		13.		using “set-theory SQL”, show the countries in region 4 whose names 
--				begin with the letter ‘Z’.
--		(A)		Nicholas Littlefield

	select	c.country_name
	from	countries c
	where	c.region_id = '4'
	intersect
	select	c.country_name
	from	countries c
	where	c.country_name like 'Z%';

	