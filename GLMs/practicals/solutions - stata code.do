*---------------------*
* GLM 1 solution code *
*---------------------*

* set working directory
cd "S:\ICH_PPP_CENB_CEBCH\Rachel Pearson\Teaching\GLM 1 materials"


* get data
use asrr_glm_1.dta

*---------------*
* Question 1:
*---------------*
su age, d
tab imd
tab cvd


*---------------*
* Question 2:
*---------------*
* 2A:
graph bar, over(ae_atd)

* 2B:
graph bar, over(ae_atd) by(sex)

* 2C:
glm ae_atd i.sex, f(poisson) l(log) eform

* 2D:
glm ae_atd i.sex age, f(poisson) l(log) eform

* 2E:
glm ae_atd i.sex age i.cvd, f(poisson) l(log) eform


*----------------*
* Question 3:    
*----------------*
* 3A:
tab imd5 death, row

* 3B:
glm death i.imd5, f(binomial) l(logit) eform

* 3C:
glm death i.imd5 age i.sex, f(binomial) l(logit) eform

* 3D:
glm death i.imd5 age i.sex i.cvd, f(binomial) l(logit) eform








