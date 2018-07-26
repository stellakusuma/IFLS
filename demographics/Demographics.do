clear
global ifls5hh "" // your working directory for raw data here
global data "" // your working directory for clean data here

// Using Book K
use $ifls5hh/bk_ar1, clear
// age
replace ar09=. if  ar09>112 // because the oldest household member is 112 years old
rename ar09 age
// sex
gen female=(ar07==3)
// marital status
replace ar13=. if ar13>7 // because 8 means don't know and 9 means missing
gen married=(ar13==2)

keep hhid14 pid14 pidlink age female married

tempfile alldemographics
saveold 'alldemographics', replace

// Using Book IIIA
use $ifls5hh/b3a_cov, clear
// age
replace age=. if  age>110 // because the oldest respondent is 110 years old
// sex
gen female=(sex==3)
// marital status
gen married=1(marstat==2)

keep hhid14 pid14 pidlink age female married

tempfile demographics
saveold 'demographics', replace
