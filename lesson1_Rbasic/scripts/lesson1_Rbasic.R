# load library
library(dplyr)
library(ggplot2)

### data --------------------
data = read.table(file = "./lesson1_Rbasic/data/rcourse_lesson1_data.txt", header = TRUE, sep = "\t")
dim(data)
head(data)
tail(data)
xtabs(formula = ~group, data = data)

### subset ------------------------------------------------
data_bl = data %>%
  filter(group == "bilingual")

dim(data_bl)
head(data_bl)
tail(data_bl)

xtabs(formula = ~ group, data = data_bl)
xtabs(formula = ~ type, data = data_bl)


### make figure -------------------------------------------
figure = ggplot(data = data, aes(x = group, y = rt)) + 
  geom_boxplot(aes(fill = group)) +
  ggtitle("Reaction Time by Group") +
  xlab("Group") + 
  ylab("Reaction time in ms") + 
  theme_classic() + 
  theme(text = element_text(size = 18), title = element_text(size = 18), legend.position = "none")

figure   # show plot

# output figure to pdf
pdf(file = "./lesson1_Rbasic/figures/data.pdf")
figure        # call plot
dev.off()     # close pdf call


### summarize data -----------------------------------
tail(data)
unique(data$group)

data_sum = data %>%
  group_by(group) %>%
  summarise(rt_mean = mean(rt), rt_sd = sd(rt), rt_max = max(rt), rt_min = min(rt)) %>%
  ungroup()   # ungroup the data for future analysis

data_sum


### summarize fata for bilinguals -------------------------
data_bl_sum = data_bl %>%
  group_by(type) %>%
  summarise(rt_mean = mean(rt), rt_sd = sd(rt), rt_max = max(rt), rt_min = min(rt)) %>%
  ungroup()   # ungroup the data for future analysis

data_bl_sum

