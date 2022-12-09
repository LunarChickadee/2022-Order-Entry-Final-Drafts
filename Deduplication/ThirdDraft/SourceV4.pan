___ PROCEDURE FindMostRecent ___________________________________________________
global Dedup_form, Branch_with_most_recent, Field_Nums_Array, most_recent_year,reference_num,
    seed_dict, new_ogs_dict, old_ogs_dict, bulbs_dict, trees_dict

Branch_with_most_recent=""

Dedup_form=info("windowname")

seed_dict=""
new_ogs_dict=""
old_ogs_dict=""
bulbs_dict=""
trees_dict=""

reference_num=val(«C#»)

window "customer_history"
case reference_num > 0
find «C#»=reference_num
    if (not info("found"))
        window Dedup_form
            LastBulbs=0
            LastNewOGS=0
            LastOldOGS=0
            LastSeeds=0
            LastTrees=0
        stop
    endif
defaultcase
    stop
endcase


///Find Seed info
    global Seeds_History, Recent_Seeds, Last_Seeds, Seeds_Fields,Field_Seeds, Seeds_Num, Seeds_Sales

    Seeds_Sales=""
    Seeds_History=""
    Recent_Seeds=""
    Last_Seeds=""
    Seeds_Fields=""
    Field_Seeds=""
    Seeds_Num=""

    //__This just Fill the history on the Deduplicator
    Seeds_Sales=lineitemarray(SΩ, ",")
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

//Find Bulbs Info

    global Bulbs_History, Recent_Bulbs, Last_Bulbs, Bulbs_Fields,Field_Bulbs, Bulbs_Num, Bulbs_Sales

    Bulbs_History=""
    Recent_Bulbs=""
    Last_Bulbs=""
    Bulbs_Fields=""
    Field_Bulbs=""
    Bulbs_Num=""
    Bulbs_Sales=""

    Bulbs_Sales=lineitemarray(BfΩ, ",")
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

//Find "Moose" now OGS info

    global Moose_History, Recent_Moose, Last_Moose, Moose_Fields,Field_Moose, Moose_Num, Moose_Sales

    Moose_History=""
    Recent_Moose=""
    Last_Moose=""
    Moose_Fields=""
    Field_Moose=""
    Moose_Num=""
    Moose_Sales=""

    Moose_Sales=lineitemarray(MΩ, ",")

    ///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
    arrayfilter lineitemarray(MΩ,¶), Moose_History, ¶, str(Seq())+¬+import()
    arrayfilter Moose_History,Recent_Moose, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
    arraystrip Recent_Moose, ¶
    ////_____ex: 2      122.55________

    ///___get the fieldnames to reference that count to_________
    arrayfilter dbinfo("fields", ""), Moose_Fields, ¶, ?(import() match "M??" and val(import()[2,-1])>0,import(),"")
    arraystrip Moose_Fields, ¶

    //______Attach that info together to let the user know the most recent order
    Field_Moose=array(Moose_Fields,val(arrayfirst(Recent_Moose, ¶)[1, ¬][1,-2]), ¶)
    Moose_Num=striptonum(Field_Moose)
    Last_Moose=Field_Moose+¬+arrayfirst(Recent_Moose, ¶)[¬,-1][2,-1]


//Find Historical OGS info
    global OGS_History, Recent_OGS, Last_OGS, OGS_Fields,Field_OGS, OGS_Num, OGS_Sales

    OGS_History=""
    Recent_OGS=""
    Last_OGS=""
    OGS_Fields=""
    Field_OGS=""
    OGS_Num=""
    OGS_Sales=""

    OGS_Sales=lineitemarray(OGSΩ, ",")

    ///___Counts fields for the array, finds the non-zero ones, gives those counts and amounts
    arrayfilter lineitemarray(OGSΩ,¶), OGS_History, ¶, str(Seq())+¬+import()
    arrayfilter OGS_History,Recent_OGS, ¶, ?(val(import()[¬,-1][2,-1])>0, import(),"")
    arraystrip Recent_OGS, ¶
    ////_____ex: 2      122.55________

    ///___get the fieldnames to reference that count to_________
    arrayfilter dbinfo("fields", ""), OGS_Fields, ¶, ?(import() match "OGS??" and val(import()[4,-1])>0,import(),"")
    arraystrip OGS_Fields, ¶

    //______Attach that info together to let the user know the most recent order
    Field_OGS=array(OGS_Fields,val(arrayfirst(Recent_OGS, ¶)[1, ¬][1,-2]), ¶)
    OGS_Num=striptonum(Field_OGS)
    Last_OGS=Field_OGS+¬+arrayfirst(Recent_OGS, ¶)[¬,-1][2,-1]

//Find Trees Info
global Trees_History, Recent_Trees, Last_Trees, Trees_Fields,Field_Trees, Trees_Num, Trees_Sales

Trees_History=""
Recent_Trees=""
Last_Trees=""
Trees_Fields=""
Field_Trees=""
Trees_Num=""
Trees_Sales=""

Trees_Sales=lineitemarray(TΩ, ",")

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

//_____Find Most Recent Branch Ordered From____
Field_Nums_Array=Seeds_Num+¬+Bulbs_Num+¬+Moose_Num+¬+Trees_Num+¬+OGS_Num
most_recent_year=arraylast(arraynumericsort(Field_Nums_Array, ¬),¬)
Branch_with_most_recent=
    ?(Field_Seeds contains str(most_recent_year), "Seeds: "+most_recent_year+" ","")+
    ?(Field_Bulbs contains str(most_recent_year), "Bulbs: "+most_recent_year+" ","")+
    ?(Field_Moose contains str(most_recent_year), "Moose: "+most_recent_year+" ","")+
    ?(Field_Trees contains str(most_recent_year), "Trees: "+most_recent_year+" ","")+
    ?(Field_OGS   contains str(most_recent_year), "OGS: "+most_recent_year+" ","")


///_____SetDictionaries for archive_____
if val(striptonum(Seeds_Sales))>0
    setdictionaryvalue seed_dict, Last_Seeds, Seeds_Sales
endif
if val(striptonum(Trees_Sales))>0
    setdictionaryvalue trees_dict, Last_Trees, Trees_Sales
endif
if val(striptonum(Bulbs_Sales))>0
    setdictionaryvalue bulbs_dict, Last_Bulbs, Bulbs_Sales
endif
if val(striptonum(OGS_Sales))>0
    setdictionaryvalue old_ogs_dict, Last_OGS, OGS_Sales ///Reminder that now the M## field carries OGS info
endif
if val(striptonum(Moose_Sales))>0
    setdictionaryvalue new_ogs_dict, Last_Moose, Moose_Sales
endif


displaydata seed_dict+¶+trees_dict+¶+bulbs_dict+¶+old_ogs_dict+¶+new_ogs_dict


window Dedup_form

opensheet
«MostRecentEntered»=val(most_recent_year)
LastBulbs=val(Seeds_Num)
LastNewOGS=val(Moose_Num)
LastOldOGS=val(OGS_Num)
LastSeeds=val(Seeds_Num)
LastTrees=val(Trees_Num)
SeedsHistory=Seeds_Sales
OGSHistory=OGS_Sales
TreesHistory=Trees_Sales
BulbsHistory=Bulbs_Sales
MooseHistory=Moose_Sales





showvariables Branch_with_most_recent
___ ENDPROCEDURE FindMostRecent ________________________________________________

___ PROCEDURE AddDate __________________________________________________________
InqCodeNum=?(val(striptonum(inqcode))<30, val(striptonum(inqcode)), val(striptonum(inqcode)[3,4]))
___ ENDPROCEDURE AddDate _______________________________________________________

___ PROCEDURE AutoSort/1 _______________________________________________________
Global Deduplicate_Selected_Array, Update_Weight, Last_Order_Weight, Was_Online, Total_Weight,
    highest_inq_code, highest_year, fivecount, recent_inq, has_redflag, newest_inq, newest_inq_onl, has_sales,
    entered_recently, recently_updated_ML, has_taxname, has_consent, hits_multiple
        
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
    has_consent=3
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
    


//fix this not resetting the numbers back if run again
    
field ConsentWeight
    formulafill «»*has_consent

    
field OnlineWeight
    formulafill Online*5

///____Do multiplication
field HowLikelyWeight
formulafill ConsentWeight+EnteredWeight+«UpdateWeight»+InqWeight

call .Maximum

field HowLikelyWeight
sortdown
firstrecord


___ ENDPROCEDURE AutoSort/1 ____________________________________________________

___ PROCEDURE Search Address ___________________________________________________

___ ENDPROCEDURE Search Address ________________________________________________

___ PROCEDURE .Maximum _________________________________________________________
global max_score, score_array, score_range, in_both, lowest_Cust_Num, compare_records, compare_records_again, compare_field, total_records

max_score=0
score_range=""


//count how many times to loop
total_records=info("records")


//__Get Highest Weight__//
field HowLikelyWeight
maximum
max_score=«»


score_range=str(max_score-3)+¶+
    str(max_score-2)+¶+
    str(max_score-1)+¶+
    str(max_score+1)+¶+
    str(max_score+2)+¶+
    str(max_score+3)
    
;displaydata score_range

removeallsummaries

selectwithin score_range contains str(HowLikelyWeight)
if (not info("empty"))
    message "User must audit because scores are too close."
    goto CheckGroup
endif

selectwithin str(HowLikelyWeight) contains str(max_score)

if (not info("empty"))
    case info("selected")>1
    message "User must audit because scores are too close"
    endcase
endif


CheckGroup:
selectall

debug
Field «Group»
    emptyfill "No Group"
    arraybuild compare_records, ¶, "", «»
    arraydeduplicate compare_records, compare_records_again, ¶
    if arraycontains(compare_records,"No Group",¶)=-1 and linecount(compare_records_again)>1
        bigmessage "One of these Records Might be for a separate 'Group' or company account. If so, please use the Procedure: PersonalAndBusinessRecords."
    endif
    
    select «Group» contains "No Group"
        Formulafill ""
    selectall

CreateMergeRecord:
    //__get lowest C# and Code (first order) __//
    field «C#»
    minimum
    lowest_Cust_Num=«»

    field Code
    minimum



    //___flag as a merge record___//
    IsAMergeRecord="Yes"

    //__Fill all info that's identical___//
    
    field «Con»
    
    loop
    compare_field=info("fieldname")
    arraybuild compare_records, ¶, "", «»
    arraydeduplicate compare_records, compare_records, ¶
    
    if linecount(compare_records)=1
    «»=compare_records
    endif
    right
    until info("fieldname")="Updated"

    bigmessage "All Fields that were identical or empty have been added to a new merge Record."+¶+¶+"You may manually choose which parts to move or use CMD+2 to AutoMerge."

    
    debug

/*
    //__make it it's own record
    lastrecord
    togglesummarylevel
*/
debug 






___ ENDPROCEDURE .Maximum ______________________________________________________

___ PROCEDURE MergeToMostRecent ________________________________________________

___ ENDPROCEDURE MergeToMostRecent _____________________________________________

___ PROCEDURE (Common Functions) _______________________________________________

___ ENDPROCEDURE (Common Functions) ____________________________________________

___ PROCEDURE ExportMacros _____________________________________________________
local Dictionary1, ProcedureList
//this saves your procedures into a variable
exportallprocedures "", Dictionary1
clipboard()=Dictionary1

message "Macros for "+info("databasename")+" are saved to your clipboard!"
___ ENDPROCEDURE ExportMacros __________________________________________________

___ PROCEDURE ImportMacros _____________________________________________________
local Dictionary1,Dictionary2, ProcedureList
Dictionary1=""
Dictionary1=clipboard()
yesno "Press yes to import all macros from clipboard to: "+info("databasename")
if clipboard()="No"
stop
endif
//step one
importdictprocedures Dictionary1, Dictionary2
//changes the easy to read macros into a panorama readable file


//step 2
//this lets you load your changes back in from an editor and put them in
//copy your changed full procedure list back to your clipboard
//now comment out from step one to step 2
//run the procedure one step at a time to load the new list on your clipboard back in
//Dictionary2=clipboard()
loadallprocedures Dictionary2,ProcedureList
message ProcedureList //messages which procedures got changed

___ ENDPROCEDURE ImportMacros __________________________________________________

___ PROCEDURE AutoMerge/2 ______________________________________________________
yesno "Automatically merge all selected records to the topmost (likely most recent) record? Oldest C#, and Code will be chosen. History will be merged."

if clipboard()="Yes"
    goto AutoMerge
endif

stop

AutoMerge:
lastrecord
Field Con
    loop
        if «»=""
            firstrecord
            copy
            lastrecord
            paste
        endif
        right
    until info("stopped") or info("fieldname")="Updated"
debug
call .LineItemMerge
    
___ ENDPROCEDURE AutoMerge/2 ___________________________________________________

___ PROCEDURE .TestMath ________________________________________________________
Global Return_To,
    Seeds_Merged, Seeds_Rec1, Seeds_Rec2,
    


Return_To=0

firstrecord

LoadRecords:
Seeds_Rec1=SeedsHistory
downrecord
//___end on summary record
    if info("summary")>0 or info("stopped")
        message "Got to summary, build a method for final merge?"
    endif
Seeds_Rec2=SeedsHistory

Return_To=«C#»

arrayfilter Seeds_Merged, Seeds_Merged, ",", val(array(Seeds_Rec1,seq(),","))+val(array(Seeds_Rec2, seq(), ","))
displaydata Seeds_Merged
lastrecord
Field SeedsHistory
«»=Seeds_Merged

firstrecord

find «C#»=Return_To


___ ENDPROCEDURE .TestMath _____________________________________________________

___ PROCEDURE .LineItemMerge ___________________________________________________
Global Return_To, New_Master_Record,
    Seeds_Merged, Seeds_Rec1, Seeds_Rec2

New_Master_Record=0
Return_To=0
Seeds_Merged=0

//__get MergeNumber for CustomerHistory
lastrecord
if info("summary")>0
    New_Master_Record=«C#»
endif



firstrecord

LoadRecords:
Seeds_Rec1=SeedsHistory
downrecord
//___end on summary record
    if info("summary")>0 or info("stopped")
        message "Got to summary, build a method for final merge?"
    endif
Seeds_Rec2=SeedsHistory

Return_To=«C#»

;displaydata array(Seeds_Rec1, 1, ",")
arrayfilter Seeds_Rec1, Seeds_Merged, ",", val(import())+val(array(Seeds_Rec2, seq(), ","))

displaydata Seeds_Merged

lastrecord

SeedsHistory=Seeds_Merged

firstrecord

find «C#»=Return_To

stop

Global Seeds_Start, Seeds_Counter

Window "customer_history:customeractivity"

find «C#»=New_Master_Record

Seeds_Start=""

arrayfilter dbinfo("fields", ""), Seeds_Fields, ¶, ?(import() match "S??" and val(import()[3,-1])>0,import(),"")
    arraystrip Seeds_Fields, ¶
    
    Seeds_Start=arrayfirst(Seeds_Fields,¶)
    
    gosheet
    field (Seeds_Start)

    if info("fieldname") contains Seeds_Start
        goto FillSeeds
    else
        message "Did not find proper field, procedure stopped"
    endif 

    debug
    FillSeeds:
    Seeds_Counter=1
    loop
        «»=val(array(Seeds_Merged,Seeds_Counter, ","))
        right
        Seeds_Counter=Seeds_Counter+1
    until info("fieldname") notmatch "S??"
        
        
        Window "customer_history:customeractivity"
    drawobjects
___ ENDPROCEDURE .LineItemMerge ________________________________________________

___ PROCEDURE .scrap ___________________________________________________________
minimum
___ ENDPROCEDURE .scrap ________________________________________________________
