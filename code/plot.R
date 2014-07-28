## simple plotting
library(ggplot2)

# cleaning up
value <- read.csv('data/value.csv')
value$period <- as.Date(value$period)
value$value <- as.numeric(value$value)

syria <- 

# creating sparklines 
plot <- ggplot(value, aes(period, value, group = indID, color = indID)) + theme_bw() +
    geom_line(stat = 'identity', size = 1) +
    facet_wrap(~ region, scale = 'free') +
    theme(panel.border = element_rect(linetype = 0),
          strip.background = element_rect(colour = "white", fill = "white"),
          #          strip.text = element_text(angle = 90, size = 10, hjust = 0.5, vjust = 0.5),
          panel.background = element_rect(colour = "white"),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.text.x = element_text(angle = 90, size = 3),
          axis.text.y = element_blank(),
          axis.ticks = element_blank()) +
    ylab("") + xlab("")


ggsave(plot = plot, 'plot.png', height = 5.01, width = 12.16, units = 'in')
