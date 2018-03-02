*Example_tabulate_summary.sas;
*Contributed by PGStats to SAS-L (2/26/2018);
data score;
   infile datalines delimiter=','; 
   input name $ score  YEAR ;
   datalines;                      
John,98,2018
Mary,95,2017
Tom,100,2016
Jerry,80,2016
;
proc tabulate data=score;
		class YEAR/ order=data preloadfmt;
		classlev YEAR;
        var score;

table score=""*(n='Number of Respondents'*f=comma10.
                min='Minimum'*f=dollar10. 
                q1='Lower Quartile'*f=dollar10.
                mean='Average'*f=dollar10. 
                median='Median'*f=dollar10. 
                q3='Upper Quartile'*f=dollar10. 
                max='Maximum'*f=dollar10. 
                stddev='Standard Deviation'*f=dollar10.)
                *[style=[JUST=r vjust=c]],
                (YEAR= "")*[style=[Cellwidth=200]]/box={s=[just=L]} style_precedence=row printmiss misstext='' ;
run;
* Contributed by Roger DeAngelis to SAS-L - 2/26/2018;
* with minor changes;
proc summary data=score  missing nway;
   by year notsorted;
   var score;
   output out=havSum
      n=n min=minimum q1=Q1 mean=mean median=median q3= max=maximum std=Stdev;
   run;

   proc transpose data=havSum out=havXpo;
   var n--stdev;
   id year;
   run;

   Proc print data=havXpo noobs;
   run;

   proc print data=havxpo noobs;
   run;quit;
