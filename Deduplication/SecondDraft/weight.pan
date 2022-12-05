Global Deduplicate_Selected_Array, Update_Weight, Last_Order_Weight, Was_Online, Total_Weight,
    highest_inq_code, highest_year, fivecount, recent_inq, has_redflag, newest_inq, newest_inq_onl, has_sales,
    entered_recently, recently_updated_ML, has_taxname, has_consent_and_taxname, hits_multiple
        
    fivecount=0

    ///____Weights Variables_____
    highest_inq_code=0
    highest_year=0
    recent_inq=2
    has_redflag=""
    newest_inq=4
    newest_inq_onl=5
    has_sales=3
    entered_recently=4
    recently_updated_ML=3
    has_taxname=4
    has_consent_and_taxname=5
    hits_multiple=5
    
    Deduplicate_Selected_Array=""

selectwithin striptoalpha(exportline())≠""
removeunselected

//these two let you make a specific array of what you've selected if you need to do more complex things
        ;arrayselectedbuild Deduplicate_Selected_Array, ¶,"",exportline()
            ;   select Deduplicate_Selected_Array contains exportline()

////____Attempts to Weigh by criteria____
/*
1-5 Scale
Has an inqcode in the last 5 years=3
Has the most recent inqcode: 4
Has a RedFlag: (notify user if this is the record chosen as most likely correct)
Newest InqCode was from online: 5
has newest inqcode: 4
Has Sales attached to it: 3
Has the most recent sales attached to it: 4
Has been most recently updated in the ML: 3
Has both TaxName and consent: 5
Has TaxName: 4
Hits multiple criteria: 5


*/


///___was most recently updated
    field LastUpdateSortable
    selectwithin «» > 0
    sortdown
    firstrecord
    field «UpdateWeight» 
    formulafill 0

    fivecount=5
    //fills them in reverse order
    
    loop
        «UpdateWeight»=fivecount
        downrecord
        fivecount=fivecount-1
    until info("stopped") or fivecount=0
 

    field «UpdateWeight»
        formulafill «»*val(recently_updated_ML)
    
selectall

///____has most recent inqcode
    field InqCodeNum
    select InqCodeNum>0

    if (not info("empty"))
        sortdown
        firstrecord
        highest_inq_code=«»
    field InqWeight
    formulafill 0
        fivecount=5
        loop
                case InqCodeNum=highest_inq_code
                    «»=fivecount
                    downrecord
                defaultcase
                    fivecount=fivecount-1
                    «»=fivecount
                    downrecord
                endcase
        until info("stopped") or fivecount=0

        field InqWeight
            formulafill «»*val(newest_inq)

    endif

selectall

///_____Has a sale that was entered most recently____
    field «MostRecentEntered»
    debug
    field EnteredWeight
        formulafill 0
    select «MostRecentEntered»>0
    
    if (not info("empty"))
        field «MostRecentEntered»
        sortdown
        
            firstrecord
            highest_year=«»
        field EnteredWeight
            fivecount=5
                loop
                    case «MostRecentEntered»=highest_year
                        «»=fivecount
                        downrecord
                    defaultcase 
                        fivecount=fivecount-1
                        «»=fivecount
                        downrecord
                    endcase
                until info("stopped") or fivecount=0
            formulafill «»*entered_recently
    endif

///____Do multiplication
field HowLikelyWeight
formulafill EnteredWeight+«UpdateWeight»+InqWeight

///___Address came from online__
formulafill Online+HowLikelyWeight
