
### load packages -------------
library(dplyr)


### data and cleaning ------------
data = read.table("./lesson2_linReg/data/rcourse_lesson2_data.txt")
dim(data)
head(data)
sum(data$name == "Page")       # 201 records

data_clean = data %>%
  filter(name == "Page") %>%
  mutate(name = factor(name)) %>%
  filter(year > 1900) %>%
  filter(year <= 2000) %>%
  mutate(prop_loge = log(prop)) %>%
  mutate(prop_log10 = log10(prop))






