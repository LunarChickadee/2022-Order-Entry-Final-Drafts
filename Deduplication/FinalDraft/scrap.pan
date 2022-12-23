Hi Lunar,

CC'ing Sarah. She's on vacation but the code at issue was something she was working on, so keeping her in the loop for when she comes back.

The following Seeds Tally .salestax macro code does not seem to be doing it's job. It is supposed to tax non-edible items, but it is not.

For example, order #713994 is being charged tax on the web for items 4868-A and 4925-A totaling $0.36. But, the Tally is refunding the sales tax amount and it is not showing up in the order 'math'.

Here's the code:

;for orders not taxing shipping and not taxing edibles
case arraycontains(noship,TaxState,",")=-1 or (TaxState contains "AK" and Notes4 notcontains "AKShippingIsTaxable")
    if TaxState contains "MA" or TaxState contains "MD"
        field Order
     ;;   arrayfilter Order, taxitems,¬,?(val(extract(extract(Order,¶,seq()),¬,2))>4700,extract(extract(Order,¶,seq()),¬,8),"")
    arrayfilter Order, taxitems,¬,?(
        (val(extract(extract(Order,¶,seq()),¬,2))<=4699)
        or (val(extract(extract(Order,¶,seq()),¬,2))>=5932 and val(extract(extract(Order,¶,seq()),¬,2))<=5942)
        or (val(extract(extract(Order,¶,seq()),¬,2))>=5976 and val(extract(extract(Order,¶,seq()),¬,2))<=5980)
        ,"",
        extract(extract(Order,¶,seq()),¬,8)
    )
        taxitems=arraystrip(taxitems,¬)
        taxtotal=arraynumerictotal(taxitems,¬)
        TaxedAmount=?(Taxable="Y", taxtotal*float(divzero(AdjTotal,Subtotal)),0)
        if TaxRate = 0
            TaxRate = lookup("ZipCodeList","ZipCode",Z,"TaxRate",0,0)
            StateRate = lookup("ZipCodeList","ZipCode",Z,"StateRate",0,0)
            CountyRate = lookup("ZipCodeList","ZipCode",Z,"CountyRate",0,0)
            CityRate = lookup("ZipCodeList","ZipCode",Z,"CityRate",0,0)
            SpecialRate = lookup("ZipCodeList","ZipCode",Z,"SpecialRate",0,0)
        endif
    else
        TaxedAmount=?(Taxable="Y",AdjTotal,0)
    endif

We have only three orders so far out 1,000 where this has happened. Not completely urgent, but I cannot figure out why it is not working.

Thanks,

Ryan
