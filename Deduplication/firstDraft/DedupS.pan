global Seeds_History, Recent_Seeds, Last_Seeds, Seeds_Fields,Field_Seeds, Seeds_Num

Seeds_History=""
Recent_Seeds=""
Last_Seeds=""
Seeds_Fields=""
Field_Seeds=""
Seeds_Num=""

///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
arrayfilter lineitemarray(SΩ,¶), Seeds_History, ¶, str(Seq())+¬+import()
arrayfilter Seeds_History,Recent_Seeds, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
arraystrip Recent_Seeds, ¶
////_____ex: 2      122.55________

///___get the fieldnames to reference that count to_________
arrayfilter dbinfo("fields", ""), Seeds_Fields, ¶, ?(import() match "S??" and val(import()[2,-1])>0,import(),"")
arraystrip Seeds_Fields, ¶

//______Attach that info together to let the user know the most recent order
Field_Seeds=array(Seeds_Fields,val(arrayfirst(Recent_Seeds, ¶)[1, ¬][1,-2]), ¶)
Seeds_Num=striptonum(Field_Seeds)
Last_Seeds=Field_Seeds+¬+arrayfirst(Recent_Seeds, ¶)[¬,-1][2,-1]
