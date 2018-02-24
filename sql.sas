
*Example_Print_proc_sql;
options nocenter nodate ls=90;
proc sql ; 
select name
       ,pop
       ,pop/sum(pop) as percent_pop 
          format=percent7.2
	   from  sashelp.demographics
	   having calculated percent_pop >0.02
	   order by percent_pop desc;
quit;

