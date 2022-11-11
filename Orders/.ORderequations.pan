~~C#~~
.custnumber

~~OrderNo~~
OrderNo=round(OrderNo,.001)

~~TaxState~~
.retotal

~~Subtotal~~
.retotal

~~VolDisc~~
.retotal

~~MemDisc~~
.retotal

~~AdjTotal~~
.retotal

~~Surcharge~~
.retotal

~~$Shipping~~
.retotal

~~SalesTax~~
.retotal

~~OrderTotal~~
.retotal

~~Donation~~
.retotal

~~Donation2~~
.retotal

~~Membership~~
.retotal

~~GrTotal~~
.retotal

~~Discount~~
.retotal

~~Paid~~
«BalDue/Refund»=Paid-GrTotal
«1stTotal»=GrTotal
RealTax=?(info("formname")="seedsinput" or info("formname")="ogsinput" or info("formname")="mtinput",
SalesTax*(1-Discount),SalesTax)
Patronage=OrderTotal-RealTax
oono=OrderNo


~~BulbsSubtotal~~
.retotal

~~BulbsAdjTotal~~
.retotal

~~1stPayment~~
Paid = «1stPayment» + AddPay1 + AddPay2 + AddPay3 + AddPay4 + AddPay5 + AddPay6
«BalDue/Refund»=Paid-GrTotal
«1stTotal»=GrTotal
RealTax=?(info("formname")="seedsinput" or info("formname")="ogsinput" or info("formname")="mtinput",
SalesTax*(1-Discount),SalesTax)
Patronage=OrderTotal-RealTax
oono=OrderNo


~~Donated_Refund~~
«1stRefund»=Donated_Refund

~~Con~~
.Con

~~Group~~
.Group

~~MAd~~
.MAd

~~City~~
.City

~~St~~
.St

~~Zip~~
.Zip

~~SAd~~
.SAd

~~Cit~~
.Cit

~~Sta~~
.Sta

~~Z~~
.Z

~~Telephone~~
.phone

~~Email~~
.email

~~CreditCard~~
.checkno

~~Sub2~~
.sub2
