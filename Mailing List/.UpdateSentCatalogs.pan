
global SpareText3Dict,DateProcessed,CatSent,ValidCats,YesSeeds,YesBulbs,YesTrees,BulkYes,
DateNum

ValidCats="Bulbs,Seeds,Trees"

YesSeeds=""
YesBulbs=""
YesTrees=""
SpareText3Dict=""
BulkYes=0
DateProcessed=datepattern(today(),"MM/DD/yyyy")
DateNum=0

BulkFill:
    noyes "Are you filling in bulk catalogs?"
        if clipboard()="Yes"
            BulkYes=-1
        /*
        message "Please wait while the following lookup compares files"
        selectwithin lookupselected("catalog mailing template","C#",«C#»,"C#",0,0)
        //psuedocode
            do a "just updated" flag or something
            tell user to go check the data
            then run this again
        */
        endif

GetYear1:
    gettext "MM/DD/YYYY Catalog Requested or Sent Off",DateProcessed

    //make sure it's formatted properly
    DateNum=date(DateProcessed)
    DateProcessed=datepattern(DateNum,"MM/DD/yyyy")
        if DateProcessed notmatchexact "??/??/????" 
            message "Not in MM/DD/YYYY format. Try again"
            goto GetYear1
        endif

    //confirm
    yesno "Date To Add is: "+DateProcessed+"?"
        if clipboard()≠"Yes"
            goto GetYear1
        endif

if BulkYes≠-1
    goto SingleCat
endif

WhichCats:
    gettext "Which Catalog got sent? Seeds, Bulbs, or Trees",CatSent
    if ValidCats notcontains upperword(CatSent)
        message "Please type Bulbs, Seeds, or Trees"
        goto WhichCats
    endif 

    case upperword(CatSent) = "Seeds"
        yesno "Fill the Selected People as Having Been Sent Seeds Catalogs?"
            if clipboard()="Yes"
            ///Sets Seeds Bulk Send
                YesSeeds="Bulk Seeds: "+DateProcessed+" "
                setdictionaryvalue SpareText3Dict,"Seeds Bulk",DateProcessed
            endif
    case upperword(CatSent) = "Trees"
        yesno "Fill the Selected People as Having Been Sent Trees Catalogs?"
            if clipboard()="Yes"
                YesTrees="Bulk Trees: "+DateProcessed+" "
            ///Sets Seeds Bulk Send
                setdictionaryvalue SpareText3Dict,"Trees Bulk",DateProcessed
            endif
    case upperword(CatSent) = "Bulbs"
        yesno "Fill the Selected People as Having Been Sent Bulbs Catalogs?"
            if clipboard()="Yes"
                YesBulbs="Bulk Bulbs: "+DateProcessed+" "
            ///Sets Seeds Bulk Send
                setdictionaryvalue SpareText3Dict,"Bulbs Bulk",DateProcessed
            endif
        ///will hold other options
    endcase 

    //check if there are others
    noyes "Filling in more Bulk catalogs for this same selection?"
        if clipboard()="Yes"
            goto GetYear1
        endif


yesno "Append: "+YesTrees+YesBulbs+YesSeeds+"?"
if clipboard()≠"Yes"
message "Stopping Now"
stop
endif 

Displaydata SpareText3Dict

loop
SpareText3=SpareText3Dict
downrecord
until info("stopped")

SingleCat:
//send single catalog to just this person



