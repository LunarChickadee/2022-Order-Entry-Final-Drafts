~~C#~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.tab1

~~Con~~
Con=?(Con contains "-", Con[1,"-"]+upper(Con["-",-1][2;1])+Con["-",-1][3,-1],Con)
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.tab1

~~Group~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.tab1

~~MAd~~
MAd=?(MAd[1;2]="Po"or MAd[1;2]="Rr" or MAd[1;2]="Hc", MAd[1,1]+upper(MAd[2;1])+MAd[3,-1],MAd)
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.MAd

~~City~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.MAd

~~St~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.MAd

~~Zip~~
adc=lookup("fcmadc","Zip3",pattern(Zip,"#####")[1,3],"adc",0,0)
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
.MAd

~~adc~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~M?~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~SAd~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~Cit~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~Sta~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~Z~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~UPS?~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~phone~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")

~~inqcode~~
inqcode=?(inqcode beginswith "0" or inqcode beginswith "1", inqcode, str(yearvalue(today()))[3,4]+inqcode)

~~Code~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")
inqcode=?(inqcode beginswith "0" or inqcode beginswith "1", inqcode, "15"+inqcode)

~~S~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")


~~Bf~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")


~~T~~
Updated=datepattern(regulardate(Modified),"mm/dd/yy")+"@"+timepattern(regulartime(Modified),"hh:mm am/pm")


~~Mem?~~
«Mem?»=?(«Mem?» contains "y", "Y", «Mem?»)
.member
