-- Write a query to find users who purchased different product on different date
-- i.e. product purchased on a given date are not repeated on any other day

-- https://www.youtube.com/watch?v=FNUIqQbj_EE&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=47

create table purchase_history
(userid int
,productid int
,purchasedate date
);
SET DATEFORMAT dmy;
insert into purchase_history values
(1,1,'23-01-2012')
,(1,2,'23-01-2012')
,(1,3,'25-01-2012')
,(2,1,'23-01-2012')
,(2,2,'23-01-2012')
,(2,2,'25-01-2012')
,(2,4,'25-01-2012')
,(3,4,'23-01-2012')
,(3,1,'23-01-2012')
,(4,1,'23-01-2012')
,(4,2,'25-01-2012')
;

select * from purchase_history;

	WITH cte AS(
SELECT userid
	   , COUNT(DISTINCT purchasedate) no_of_dates
	   , COUNT(productid) count_products
	   , COUNT(distinct productid) count_distinct
FROM purchase_history
GROUP BY userid)
SELECT * FROM cte
WHERE no_of_dates> 1
AND count_distinct = count_products;

