Create the other procedure of the following 

CheckGroup:
selectall

debug
Field «Group»
    emptyfill "No Group"
    arraybuild compare_records, ¶, "", «»
    arraydeduplicate compare_records, compare_records_again, ¶
    if arraycontains(compare_records,"No Group",¶)=-1 and linecount(compare_records_again)>1
        select «Group» contains "No Group"
        Formulafill ""
        bigmessage "One of these Records Might be for a separate 'Group' or company account. If so, please use the Procedure: **PersonalAndBusinessRecords**."
    endif


!!!!!!!!!
  #  Make sure the export and import macros functions list what file it's currently pointed at