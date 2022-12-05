global inq_set,online_set
copyrecord

window "DeDuplicator"

pasterecord

LastUpdateSortable=date(Updated[1,"@"][1,-2])
inq_set=?(val(striptonum(inqcode))<30, val(striptonum(inqcode)), val(striptonum(inqcode)[3,4]))
InqCodeNum=inq_set
online_set=?(inqcode contains "onl" or inqcode contains "webrequest", "1.2", "1")
Online=val(online_set)

call "FindMostRecent"
