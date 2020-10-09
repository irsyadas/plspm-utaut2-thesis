# import prerequisite libraries
library(readxl)
library(plspm)

# load the data
df <- read_excel("dataframe.xlsx", col_names = TRUE)

# assign vector for each latent variable
age <- c(0,0,0,0,0,0,0,0)
pe <- c(0,0,0,0,0,0,0,0)
ee <- c(0,0,0,0,0,0,0,0)
fc <- c(0,0,0,0,0,0,0,0)
ha <- c(0,0,0,0,0,0,0,0)
pv <- c(0,0,0,0,0,0,0,0)
hm <- c(0,0,0,0,0,0,0,0)
bu <- c(1,1,1,1,1,1,1,0)

# create path matrix through row binding in inner model
utaut2_path <- rbind(age,pe,ee,fc,ha,pv,hm,bu)

# set column name
colnames(utaut2_path) = rownames(utaut2_path)

# define list of indicator for each latent variable in outer model
utaut2_block <- list(1,2:5,6:9,10:12,13:15,16:18,19:21,22:24)

# set every indicator measurement in reflective mode
utaut2_mode <- c("A","A","A","A","A","A","A")

# conduct plspm analysis with path scheme and 1000 iterations
utaut2_pls <- plspm(df, utaut2_path, utaut2_block, modes = utaut2_mode, scheme = "path", maxiter = 1000)

# results summary
summary(utaut2_pls)

# plot the inner model
innerplot(utaut2_pls)