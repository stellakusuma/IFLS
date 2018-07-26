clear
global ifls5hh "/Users/stellakusumawardhani/Documents/IFLS/IFLS5/hh14_all_dta"
global data "/Users/stellakusumawardhani/Documents/Github"

* Exact Value
use $ifls5hh/b2_hr1, clear

keep hhid14_9 hr02_*
sort hhid14_9

foreach x of varlist hr02_*{
		replace `x' = . if `x' >= 999999995
	}
egen asset=rowtotal(hr02_*)
bys hhid14_9: egen asset_total=sum(asset)
bys hhid14_9: keep if _n==1

keep hhid14_9 asset_total

tempfile asset
saveold `asset', replace

* Unfolding Brackets
use $ifls5hh/b2_hr1, clear

keep hhid14_9 hr02p*
sort hhid14_9

* House and land occupied by the household
gen asset_a=hr02p_a
replace asset_a=200000000 if inlist(hr02p_a, 132, 2332)
replace asset_a=50000000 if inlist(hr02p_a, 22, 112)
replace asset_a=100000000 if inlist(hr02p_a, 12, 232)
replace asset_a=25000000 if inlist(hr02p_a, 21, 111)
replace asset_a=75000000 if inlist(hr02p_a, 113, 231)
replace asset_a=150000000 if inlist(hr02p_a, 131, 2331)
replace asset_a=225000000 if inlist(hr02p_a, 133, 2333)
replace asset_a=. if inlist(hr02p_a, 18, 28, 99, 118, 138, 238, 2338)

* Other house/building (including land)
gen asset_b=hr02p_b
replace asset_b=200000000 if inlist(hr02p_b, 132, 2332)
replace asset_b=50000000 if inlist(hr02p_b, 22, 112)
replace asset_b=100000000 if inlist(hr02p_b, 12, 232)
replace asset_b=25000000 if inlist(hr02p_b, 21, 111)
replace asset_b=75000000 if inlist(hr02p_b, 113, 231)
replace asset_b=150000000 if inlist(hr02p_b, 131, 2331)
replace asset_b=225000000 if inlist(hr02p_b, 133, 2333)
replace asset_b=. if inlist(hr02p_b, 18, 28, 138, 238)

* Land (not used for farm nonfarm)
gen asset_c=hr02p_c
replace asset_c=25000000 if inlist(hr02p_c, 22, 112)
replace asset_c=50000000 if inlist(hr02p_c, 12, 232)
replace asset_c=100000000 if inlist(hr02p_c, 132, 2332)
replace asset_c=12500000 if inlist(hr02p_c, 21, 111)
replace asset_c=37500000 if inlist(hr02p_c, 113, 231)
replace asset_c=75000000 if inlist(hr02p_c, 131, 2331)
replace asset_c=125000000 if inlist(hr02p_c, 133, 2333)
replace asset_c=. if inlist(hr02p_c, 18, 28, 138, 238)

* Poultry
gen asset_d1=hr02p_d1
replace asset_d1=4000000 if inlist(hr02p_d1, 22, 112)
replace asset_d1=8000000 if inlist(hr02p_d1, 12, 232)
replace asset_d1=15000000 if inlist(hr02p_d1, 132, 2332)
replace asset_d1=2000000 if inlist(hr02p_d1, 21, 111)
replace asset_d1=6000000 if inlist(hr02p_d1, 113, 231)
replace asset_d1=11500000 if inlist(hr02p_d1, 131, 2331)
replace asset_d1=17000000 if inlist(hr02p_d1, 133, 2333)
replace asset_d1=. if inlist(hr02p_d1, 18, 28)

* Livestock/fishpond
gen asset_d2=hr02p_d2
replace asset_d2=4000000 if inlist(hr02p_d2, 22, 112)
replace asset_d2=8000000 if inlist(hr02p_d2, 12, 232)
replace asset_d2=15000000 if inlist(hr02p_d2, 132, 2332)
replace asset_d2=2000000 if inlist(hr02p_d2, 21, 111)
replace asset_d2=6000000 if inlist(hr02p_d2, 113, 231)
replace asset_d2=11500000 if inlist(hr02p_d2, 131, 2331)
replace asset_d2=17000000 if inlist(hr02p_d2, 133, 2333)
replace asset_d2=. if inlist(hr02p_d2, 18, 28)

* Hard stem plant that not used for farm or non-farm business
gen asset_d3=hr02p_d3
replace asset_d3=10000000 if inlist(hr02p_d3, 22, 112)
replace asset_d3=20000000 if inlist(hr02p_d3, 12, 232)
replace asset_d3=40000000 if inlist(hr02p_d3, 132, 2332)
replace asset_d3=5000000 if inlist(hr02p_d3, 21, 111)
replace asset_d3=15000000 if inlist(hr02p_d3, 113, 231)
replace asset_d3=3000000 if inlist(hr02p_d3, 131, 2331)
replace asset_d3=45000000 if inlist(hr02p_d3, 133, 2333)
replace asset_d3=. if inlist(hr02p_d3, 18, 28)

* Vehicles (cars, boats bicycles, motorbikes)
gen asset_e=hr02p_e
replace asset_e=5000000 if inlist(hr02p_e, 22, 112)
replace asset_e=10000000 if inlist(hr02p_e, 12, 232)
replace asset_e=50000000 if inlist(hr02p_e, 132, 2332)
replace asset_e=2500000 if inlist(hr02p_e, 21, 111)
replace asset_e=7500000 if inlist(hr02p_e, 113, 231)
replace asset_e=30000000 if inlist(hr02p_e, 131, 2331)
replace asset_e=52500000 if inlist(hr02p_e, 133, 2333)
replace asset_e=. if inlist(hr02p_e, 18, 28, 138, 238)

* Household appliances
gen asset_f=hr02p_f
replace asset_f=4000000 if inlist(hr02p_f, 22, 112)
replace asset_f=8000000 if inlist(hr02p_f, 12, 232)
replace asset_f=15000000 if inlist(hr02p_f, 132, 2332)
replace asset_f=2000000 if inlist(hr02p_f, 21, 111)
replace asset_f=6000000 if inlist(hr02p_f, 113, 231)
replace asset_f=11500000 if inlist(hr02p_f, 131, 2331)
replace asset_f=17000000 if inlist(hr02p_f, 133, 2333)
replace asset_f=. if inlist(hr02p_f, 18, 28, 138, 238)

* Savings/certificate of deposit/stocks
gen asset_g=hr02p_g
replace asset_g=4000000 if inlist(hr02p_g, 22, 112)
replace asset_g=8000000 if inlist(hr02p_g, 12, 232)
replace asset_g=15000000 if inlist(hr02p_g, 132, 2332)
replace asset_g=2000000 if inlist(hr02p_g, 21, 111)
replace asset_g=6000000 if inlist(hr02p_g, 113, 231)
replace asset_g=11500000 if inlist(hr02p_g, 131, 2331)
replace asset_g=17000000 if inlist(hr02p_g, 133, 2333)
replace asset_g=. if inlist(hr02p_g, 18, 28, 138, 238)

* Receivables
gen asset_h=hr02p_h
replace asset_h=5000000 if inlist(hr02p_h, 22, 112)
replace asset_h=10000000 if inlist(hr02p_h, 12, 232)
replace asset_h=25000000 if inlist(hr02p_h, 132, 2332)
replace asset_h=2500000 if inlist(hr02p_h, 21, 111)
replace asset_h=7500000 if inlist(hr02p_h, 113, 231)
replace asset_h=17500000 if inlist(hr02p_h, 131, 2331)
replace asset_h=27500000 if inlist(hr02p_h, 133, 2333)
replace asset_h=. if inlist(hr02p_h, 18, 28, 138, 238)

* Jewelry
gen asset_j=hr02p_j
replace asset_j=25000000 if inlist(hr02p_j, 22, 112)
replace asset_j=50000000 if inlist(hr02p_j, 12, 232)
replace asset_j=100000000 if inlist(hr02p_j, 132, 2332)
replace asset_j=12500000 if inlist(hr02p_j, 21, 111)
replace asset_j=37500000 if inlist(hr02p_j, 113, 231)
replace asset_j=75000000 if inlist(hr02p_j, 131, 2331)
replace asset_j=125000000 if inlist(hr02p_j, 133, 2333)
replace asset_j=. if inlist(hr02p_j, 18, 28, 138, 238)

* Household furniture and utensils
gen asset_k1=hr02p_k1
replace asset_k1=25000000 if inlist(hr02p_k1, 22, 112)
replace asset_k1=50000000 if inlist(hr02p_k1, 12, 232)
replace asset_k1=100000000 if inlist(hr02p_k1, 132, 2332)
replace asset_k1=12500000 if inlist(hr02p_k1, 21, 111)
replace asset_k1=37500000 if inlist(hr02p_k1, 113, 231)
replace asset_k1=75000000 if inlist(hr02p_k1, 131, 2331)
replace asset_k1=125000000 if inlist(hr02p_k1, 133, 2333)
replace asset_k1=. if inlist(hr02p_k1, 18, 28, 138, 238)

* Other assets
gen asset_k2=hr02p_k2
replace asset_k2=25000000 if inlist(hr02p_k2, 22, 112)
replace asset_k2=50000000 if inlist(hr02p_k2, 12, 232)
replace asset_k2=100000000 if inlist(hr02p_k2, 132, 2332)
replace asset_k2=12500000 if inlist(hr02p_k2, 21, 111)
replace asset_k2=37500000 if inlist(hr02p_k2, 113, 231)
replace asset_k2=75000000 if inlist(hr02p_k2, 131, 2331)
replace asset_k2=125000000 if inlist(hr02p_k2, 133, 2333)
replace asset_k2=. if inlist(hr02p_k2, 18, 28, 138, 238)

egen assetb=rowtotal(asset_*)
bys hhid14_9: egen assetb_total=sum(assetb)
bys hhid14_9: keep if _n==1

keep hhid14_9 assetb_total

tempfile assetb
saveold `assetb', replace

* Total Assets
use `asset', clear
mmerge hhid14_9 using `assetb'

gen totalassets=asset_total+assetb_total
gen totalassets_ihs=ln(totalassets+(sqrt(totalassets^2)+1))

g totalassets_q = .
sum totalassets_ihs, det
replace totalassets_q = 1 if totalassets_ihs <= r(p25)
replace totalassets_q = 2 if totalassets_ihs > r(p25) & totalassets_ihs <= r(p50)
replace totalassets_q = 3 if totalassets_ihs > r(p50) & totalassets_ihs <= r(p75)
replace totalassets_q = 4 if totalassets_ihs > r(p75)

drop _merge

tempfile totalassets
saveold `totalassets', replace
