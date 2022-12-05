global Bulbs_History, Recent_Bulbs, Last_Bulbs, Bulbs_Fields,Field_Bulbs, Bulbs_Num

Bulbs_History=""
Recent_Bulbs=""
Last_Bulbs=""
Bulbs_Fields=""
Field_Bulbs=""
Bulbs_Num=""

///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
arrayfilter lineitemarray(BfΩ,¶), Bulbs_History, ¶, str(Seq())+¬+import()
arrayfilter Bulbs_History,Recent_Bulbs, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
arraystrip Recent_Bulbs, ¶
////_____ex: 2      122.55________

///___get the fieldnames to reference that count to_________
arrayfilter dbinfo("fields", ""), Bulbs_Fields, ¶, ?(import() match "Bf??" and val(import()[3,-1])>0,import(),"")
arraystrip Bulbs_Fields, ¶

//______Attach that info together to let the user know the most recent order
Field_Bulbs=array(Bulbs_Fields,val(arrayfirst(Recent_Bulbs, ¶)[1, ¬][1,-2]), ¶)
Bulbs_Num=striptonum(Field_Bulbs)
Last_Bulbs=Field_Bulbs+¬+arrayfirst(Recent_Bulbs, ¶)[¬,-1][2,-1]
