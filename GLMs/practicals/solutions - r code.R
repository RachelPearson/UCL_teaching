#--------------------------------#
# glm 1 solutions                #
#--------------------------------#

# packaged:
library(readr)
library(dplyr)
library(tableone)
library(ggplot2)
library(broom)

# read in the data (save the csv file to a personal folder first and then change the code below to read in)
dat <- read_csv(file = "C:/my file directory/change this/asrr_glm_1.csv")


# Q1:
table <- print(CreateTableOne(data = dat,
                              vars = c("age", "sex", "imd5", "cvd","death", "ae_atd"),
                              factorVars = c("sex", "imd5", "cvd", "death")),
               nonnormal= c("age","ae_atd"), minMax = TRUE) %>% 
  as.data.frame() %>% 
  rownames_to_column(var = "characteristics")

# Q2:

# 2A:
ggplot(data = dat,
       aes(x = ae_atd)) +
  geom_bar() +
  scale_x_continuous("Number of A&E attendances",
                     breaks = seq(0,10,1))

# 2B:
ggplot(data = dat,
       aes(x = ae_atd, 
           group = sex, 
           fill = sex)) +
  geom_bar(position = position_dodge()) +
  scale_x_continuous("Number of A&E attendances",
                     breaks = seq(0,10,1))

# 2C:
ae_mod_1 <- glm(data = dat, 
                formula = ae_atd ~ sex,
                family = poisson(link = "log"))
tidy(ae_mod_1,
     exponentiate = TRUE,  #provide exponentiated parameter estimates
     conf.int = TRUE) # show confidence intervals

# 2D:
ae_mod_2 <- glm(data = dat, 
                formula = ae_atd ~ sex + age,
                family = poisson(link = "log"))
tidy(ae_mod_2,
     exponentiate = TRUE,  
     conf.int = TRUE) 

# 2E:
ae_mod_3 <- glm(data = dat, 
                formula = ae_atd ~ sex + age + cvd,
                family = poisson(link = "log"))
tidy(ae_mod_3,
     exponentiate = TRUE,  
     conf.int = TRUE) 

#----------------#
# Question 3 ----
#----------------#

# 3A:
table(dat$death)


# 3B:
print(CreateTableOne(data = dat, 
                     strata = "death",
                     vars = c("imd5"),
                     test = FALSE))

# 3C:
death_mod_1 <- glm(data = dat,
                   formula = death ~ imd5,
                   family = binomial(link = "logit"))

tidy(death_mod_1,
     exponentiate = TRUE,  
     conf.int = TRUE) 


# 3D:
death_mod_2 <- glm(data = dat,
                   formula = death ~ imd5 + age + sex,
                   family = binomial(link = "logit"))

tidy(death_mod_2,
     exponentiate = TRUE,  
     conf.int = TRUE) 

# 3E:
death_mod_3 <- glm(data = dat,
                   formula = death ~ imd5 + age + sex + cvd,
                   family = binomial(link = "logit"))

tidy(death_mod_3,
     exponentiate = TRUE,  
     conf.int = TRUE) 

