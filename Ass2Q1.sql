/* inner join */

  select * from Survey2023 
  inner join Survey2024 
  on Survey2023.ResponseID = Survey2024.ResponseID;

  select * from Survey2024 inner join Survey2025 on Survey2024.ResponseID=Survey2025.ResponseID;

  select * from Survey2023 inner join Survey2024 on Survey2023.ResponseID=Survey2024.ResponseID inner join Survey2025 on Survey2024.ResponseID = Survey2025.ResponseID;

  /* left join */

  select * from Survey2023 left join Survey2024 on Survey2023.ResponseID = Survey2024.ResponseID;

  select * from Survey2024 left join Survey2025 on Survey2024.ResponseID = Survey2025.ResponseID;

  select * from Survey2023 left join Survey2024 on Survey2023.ResponseID=Survey2024.ResponseID left join Survey2025 on Survey2024.ResponseID=Survey2025.ResponseID;

    /* right join */

  select * from Survey2023  right join Survey2024 on Survey2023.ResponseID = Survey2024.ResponseID;

  select * from Survey2024 right join Survey2025 on Survey2024.ResponseID = Survey2025.ResponseID;

  select * from Survey2023 right join Survey2024 on Survey2023.ResponseID=Survey2024.ResponseID right join Survey2025 on Survey2024.ResponseID=Survey2025.ResponseID;

  /* full outer join */

  select * from Survey2023 full outer join Survey2024 on Survey2023.ResponseID = Survey2024.ResponseID;

  select * from Survey2024 full outer join Survey2025 on Survey2024.ResponseID = Survey2025.ResponseID;

  select * from Survey2023 full outer join Survey2024 on Survey2023.ResponseID = Survey2024.ResponseID full outer join Survey2025 on Survey2024.ResponseID=Survey2025.ResponseID;

    /* cross join */

	select * from Survey2023 cross join  Survey2024;

	select * from Survey2024 cross join Survey2025;

	select * from Survey2023 cross join Survey2024 cross join Survey2025;

	
    /* union */

	select * from Survey2023 union select * from Survey2024;

	select * from Survey2023 union select * from Survey2024 union select * from Survey2025;


	    /* union  All*/

	select * from Survey2023 union all select * from Survey2024;

	select * from Survey2023 union all select * from Survey2024 union all select * from Survey2025;

	/* Intersect */

	select * from Survey2023 intersect select * from Survey2024;

	select * from Survey2023 intersect select * from Survey2024 intersect select * from Survey2025;

	/* Except */

	select * from Survey2023 except select * from Survey2024;

	select * from Survey2024 except select * from Survey2025; 

	select * from Survey2024 except select * from Survey2023;





