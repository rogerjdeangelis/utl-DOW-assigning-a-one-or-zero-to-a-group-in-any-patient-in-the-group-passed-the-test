DOW assigning a one or zero to a group in any patient in the group passed the test

github
https://tinyurl.com/y6abvhn7
https://github.com/rogerjdeangelis/utl-DOW-assigning-a-one-or-zero-to-a-group-in-any-patient-in-the-group-passed-the-test

SAS Forum
https://communities.sas.com/t5/SAS-Programming/A-quick-question/m-p/560977

Solution from the CODEX of Paul Dorfman
Paul Dorfman
sashole@bellsouth.net


*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

data have;
input id date var1;
cards4;
1 2000 0
1 2000 0
1 2000 1
1 2001 0
1 2001 0
1 2001 0
2 2001 0
2 2001 0
2 2001 0
2 2001 0
2 2002 0
2 2002 0
2 2002 1
;;;;
run;quit;

*           _
 _ __ _   _| | ___
| '__| | | | |/ _ \
| |  | |_| | |  __/
|_|   \__,_|_|\___|

;

Up to 40 obs WORK.WANT total obs=13
                            |
Obs    ID    DATE    VAR1   |      VAR2
                            |
  1     1    2000      0    |        1  If Id, Year group has a 1 anywhere
  2     1    2000      0    |        1  then add VAR2=1
  3     1    2000      1    |        1
                            |
  4     1    2001      0    |        0  No one present
  5     1    2001      0    |        0
  6     1    2001      0    |        0
                            |
  7     2    2001      0    |        0
  8     2    2001      0    |        0
  9     2    2001      0    |        0
 10     2    2001      0    |        0
                            |
 11     2    2002      1    |        1
 12     2    2002      0    |        1
 13     2    2002      0    |        1


*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

data want;

  do _n_=1 by 1 until (last.date);
     set have;
     by id date;
     s=sum(s,var1);
  end;

  do _n_=1 to _n_;
    set have;
    var2=(s>0);
    output;
  end;
  drop s;

run;quit;

