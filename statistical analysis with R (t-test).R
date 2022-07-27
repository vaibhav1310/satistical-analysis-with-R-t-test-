# cleaned up death column
data$death_dummy <- as.integer(data$death != 0)
unique(data$death_dummy) #0,1

# death rate
sum(data$death_dummy)/nrow(data)*100 # 5.8%

# age
# Claim: people who die of covid-19 are older than people who survived
 dead = subset(data,death_dummy == 1)
 alive = subset(data,death_dummy == 0)
 mean(dead$age,na.rm = TRUE) # Avg age of people die = 68.5
 mean(alive$age,na.rm = TRUE) # Avg age of people alive = 48.0
 # is this statistically significant?
 t.test(dead$age,alive$age,alternative = "two.sided",conf.level = 0.99)
 # normally if p-value < 0.05, we reject the null hypothesis
 # here p-value ~ 0, so we reject the null hypothesis and 
 # conclude that this is statistically significant
 
 # Gender
 # Claim: gender has no effect
 men = subset(data,gender == "male")
 women = subset(data,gender == "female")
 mean(men$death_dummy,na.rm = TRUE)#8.4%
 mean(women$death_dummy,na.rm = TRUE)#3.7%
 # is this statistically significant?
 t.test(men$death_dummy,women$death_dummy,alternative = "two.sided",conf.level = 0.99)
 # 99% confidence:men have from 0.8% to 8.8% higher chances of dying than women
 # p-value = 0.002 < 0.05, so this is statistically significant
 
 