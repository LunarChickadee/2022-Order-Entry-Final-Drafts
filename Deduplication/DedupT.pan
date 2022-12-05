global Trees_History, Recent_Trees, Last_Trees, Trees_Fields,Field_Trees, Trees_Num

Trees_History=""
Recent_Trees=""
Last_Trees=""
Trees_Fields=""
Field_Trees=""
Trees_Num=""

///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
arrayfilter lineitemarray(TΩ,¶), Trees_History, ¶, str(Seq())+¬+import()
arrayfilter Trees_History,Recent_Trees, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
arraystrip Recent_Trees, ¶
////_____ex: 2      122.55________

///___get the fieldnames to reference that count to_________
arrayfilter dbinfo("fields", ""), Trees_Fields, ¶, ?(import() match "T??" and val(import()[2,-1])>0,import(),"")
arraystrip Trees_Fields, ¶

//______Attach that info together to let the user know the most recent order
Field_Trees=array(Trees_Fields,val(arrayfirst(Recent_Trees, ¶)[1, ¬][1,-2]), ¶)
Trees_Num=striptonum(Field_Trees)
Last_Trees=Field_Trees+¬+arrayfirst(Recent_Trees, ¶)[¬,-1][2,-1]
