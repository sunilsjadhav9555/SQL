
select id,prod_num,service_dt,product_name,  
		case when count(*) over (partition by prod_num) > 1 then 'Y' else 'N'
		end as duplicate_flag
		from ProductServiceLog
		order by prod_num, service_dt;


with cte as(
		select prod_num,service_dt,
		ROW_NUMBER() over (partition by prod_num order by service_dt asc) as rownum
		from ProductServiceLog
)
delete from cte
where rownum  > 1;

select * from ProductServiceLog;