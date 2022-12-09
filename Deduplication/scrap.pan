Global Seeds_Start, Seeds_Counter

Window "customer_history:customeractivity"

Seeds_Start=""


 arrayfilter dbinfo("fields", ""), Seeds_Fields, ¶, ?(import() match "S??" and val(import()[3,-1])>0,import(),"")
    arraystrip Seeds_Fields, ¶
    
    Seeds_Start=arrayfirst(Seeds_Fields,¶)
    
    gosheet
    field (Seeds_Start)
    
    if info("fieldname") contains Seeds_Start
        goto Fill_Seeds
    else
        message "Did not find proper field, procedure stopped"
    
    Fill_Seeds:
    Seeds_Counter=1
    loop
        «»=array(Seeds_Merged,Seeds_Counter, ¶)
        right
    until info("fieldname") notmatch "S??"
        
    
    
    
   

   0.00,34.75,10.00,67.40,10.00,43.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00