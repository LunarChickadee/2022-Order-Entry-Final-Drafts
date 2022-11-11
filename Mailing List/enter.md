`Enter/e`
copy C# into variable `num`
## conditional 1
### Customer Doesn't have a number
call `numberNeeded`
- assign «Code»
  - open **customer#**
    - call `newnumber`
  - open **mailing list**
    - paste to «C#»
  - get inqcode
    - either auto for internet or from user
  - call `filler`
    - Empty fills cat requests, Redflag stops, asks user, regardless
  - double checks if inqcode got filled, prompts user
  - opens **customerhistory**
    - pastes «C#» through «Email»
-Calls `enter/e` Again

### con't

go to **Orders**
- put Num in C#
  
- call `.IsInternetOrder`
  - internet_order = 0|-1
  
- call  [customerfill](../Orders/.customerfill.md)


