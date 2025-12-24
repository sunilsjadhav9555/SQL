select top 3 * from RetailInvoiceDetails order by (quantity * UnitPrice) desc;

select *,
	case
		when Quantity >= 5 THEN 'Bulk Order'
		else 'normal order'
	end as ordertype
from RetailInvoiceDetails;

select *,
	case
		when Country = 'United KIngdom' then dateadd(day, 7, InvoiceDate)
		when Country = 'Germany' then dateadd(day, 10, InvoiceDate)
		when Country = 'India' then dateadd(day, 15, InvoiceDate)
		when Country = 'france' then dateadd(day, 6, InvoiceDate)
		when Country = 'United States' then dateadd(day, 10, InvoiceDate)
		else InvoiceDate
	end as DeliveryDeadline
from RetailInvoiceDetails;


select distinct CustomerId
from RetailInvoiceDetails
where CustomerID is not null
group by CustomerID, Description
having count(distinct Country) > 1;

select distinct Description
from RetailInvoiceDetails
where Country in ('france','India')
	and Category not in ('lighting','gadgets');



select  MONTH(InvoiceDate) as SalesMonth,
	sum(Quantity * UnitPrice) as TotalRevenue
from RetailInvoiceDetails
where year(InvoiceDate) = YEAR(GETDATE())
group by MONTH(InvoiceDate)
order by SalesMonth;

select country,
	sum(quantity * unitPrice) as TotalRevenue
from RetailInvoiceDetails
where Country is not null
group by Country;

select Country,
	salesChannel,
	sum(Quantity * UnitPrice) as TotalRevenue,
	count(Distinct InvoiceNo) as NumberOfInvoices
from RetailInvoiceDetails
group by Country, salesChannel
having sum(Quantity * UnitPrice) > 5000;

update RetailInvoiceDetails
set UnitPrice = UnitPrice * 1.10
where Category = 'lighting'
	and Country = 'India';

delete from RetailInvoiceDetails
where InvoiceNo is null
	or Description is null
	or Quantity is null
	or InvoiceDate is null
	or UnitPrice is null
	or CustomerID is null
	or Country is null
	or Category is null
	or PaymentMethod is null
	or SalesChannel is null;

select * from RetailInvoiceDetails;