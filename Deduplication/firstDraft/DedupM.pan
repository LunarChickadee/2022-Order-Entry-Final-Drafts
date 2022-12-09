global Moose_History, Recent_Moose, Last_Moose, Moose_Fields,Field_Moose, Moose_Num

Moose_History=""
Recent_Moose=""
Last_Moose=""
Moose_Fields=""
Field_Moose=""
Moose_Num=""

///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
arrayfilter lineitemarray(MΩ,¶), Moose_History, ¶, str(Seq())+¬+import()
arrayfilter Moose_History,Recent_Moose, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
arraystrip Recent_Moose, ¶
////_____ex: 2      122.55________

///___get the fieldnames to reference that count to_________
arrayfilter dbinfo("fields", ""), Moose_Fields, ¶, ?(import() match "M??" and val(import()[2,-1])>0,import(),"")
arraystrip Moose_Fields, ¶

//______Attach that info together to let the user know the most recent order
Field_Moose=array(Moose_Fields,val(arrayfirst(Recent_Moose, ¶)[1, ¬][1,-2]), ¶)
Moose_Num=striptonum(Field_Moose)
Last_Moose=Field_Moose+¬+arrayfirst(Recent_Moose, ¶)[¬,-1][2,-1]
