
proc sql;
Create table have(ID varchar(6), stype varchar(13), Score float);
	Insert into have(id, stype, score)
		Values('S00003', 'Graduate', 19)
 		Values('S00002', 'Graduate', 14)
		Values('S00007', 'Graduate', 18)
 		Values('S00008', 'Graduate', 16)
		Values('M00004', 'Undergraduate', 13)
		Values('E00005', 'Undergraduate', 18)
		Values('M00022', 'Undergraduate', 17)
		Values('E00035', 'Undergraduate', 16)
		;
quit;
proc sql;
 select *
  From have;
quit;

proc sql;
 select make, type
 From sashelp.cars
 where make='BMW';
quit;

proc sql;
 select count(*) as total_rows
 From sashelp.cars;
 select count(distinct make) as unique_make_total_rows
 From sashelp.cars;
quit;

proc sql;
 select make, 
  mean(invoice) as mean_invoice_price format=comma8.
   From sashelp.cars
   group by make
   having mean_invoice_price> 40000
   order by mean_invoice_price desc;
quit;



