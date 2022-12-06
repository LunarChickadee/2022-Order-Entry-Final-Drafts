
Procedure Check Totals


local start_order, end_order
gettext "What's the starting OrderNo?", start_order
gettext "What's the ending OrderNo?", end_order
selectwithin CreditCard=""
if info("empty")
message "CreditCard is not empty. Process stopped"
endif
opensheet
field «1stPayment»
total
/*
getscrap "What's the starting OrderNo?"
select OrderNo ≥ val(clipboard())
getscrap "What's the ending OrderNo?"
selectwithin OrderNo ≤ val(clipboard())
selectwithin CreditCard=""
if info("empty")
message "CreditCard is not empty. Process stopped"
endif
;message "order number: "+str(OrderNo)+" "+"1st Payment: "+str(«1stPayment»)
opensheet
field «1stPayment»
total
*/
