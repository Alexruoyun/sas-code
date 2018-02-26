*Example_sort_by_alternative.sas;
proc sort data=sashelp.iris 
    out=work.sorted_iris;
  key PetalLength / ascending;
  key PetalWidth / descending;
run;
proc print data=sorted_iris 
             (obs=10) noobs;
  var species Petal: ;
run;
