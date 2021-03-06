clear
global ifls5hh "" // your working directory for raw data here
global data "" // your working directory for clean data here

use $ifls5hh/bk_ar1, clear
keep if inlist(ar01a, 1, 2, 5, 6, 11)
sort hhid14_9 hhid14 pid14

bys hhid14: gen code=_n 
bys hhid14: egen hhsize=max(code)

keep if code==1
keep hhid14_9 hhid14 hhsize

tempfile hhsize
saveold `hhsize', replace
