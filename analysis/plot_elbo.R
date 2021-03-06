# input_path = "results/seismic_23-Aug-2018_14h38m48s_22901/"
#input_path = "../results/seismic_18-Oct-2018_10h48m02s_7095/"
input_path = "../results/seismic_18-Oct-2018_12h45m35s_9281/"

all_data = readLines(paste0(input_path, "seismic.log"))
require(stringr)
nelbo = as.numeric(gsub("Objective: ", "", str_extract(all_data, "Objective: ([0-9.]*)")))
data = na.omit(data.frame(nelbo))
data$x <- seq.int(nrow(data))
require(ggplot2)
ggplot(data, aes(x = x, y = nelbo)) + 
  geom_line() + 
  scale_y_continuous(trans = "log")
ggsave("nelbo.pdf", height = 8, width = 8, units = "cm")


