global OGS_History, Recent_OGS, Last_OGS, OGS_Fields,Field_OGS, OGS_Num

OGS_History=""
Recent_OGS=""
Last_OGS=""
OGS_Fields=""
Field_OGS=""
OGS_Num=""

///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
arrayfilter lineitemarray(OGSΩ,¶), OGS_History, ¶, str(Seq())+¬+import()
arrayfilter OGS_History,Recent_OGS, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
arraystrip Recent_OGS, ¶
displaydata Recent_OGS
////_____ex: 2      122.55________

///___get the fieldnames to reference that count to_________
arrayfilter dbinfo("fields", ""), OGS_Fields, ¶, ?(import() match "OGS??" and val(import()[4,-1])>0,import(),"")
arraystrip OGS_Fields, ¶
displaydata OGS_Fields

//______Attach that info together to let the user know the most recent order
Field_OGS=array(OGS_Fields,val(arrayfirst(Recent_OGS, ¶)[1, ¬][1,-2]), ¶)
OGS_Num=striptonum(Field_OGS)
Last_OGS=Field_OGS+¬+arrayfirst(Recent_OGS, ¶)[¬,-1][2,-1]