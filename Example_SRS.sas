*Example_SRS.sas;
proc surveyselect data=SASHELP.HEART
  method=srs n=100 out=WORK.HEART;
run;
