library("ggplot2")
df <- data.frame(a = c(531, 611, 531, 230, 381),
                 b = c("x", "x", "y", "y", "y"),
                 c = c("x1", "x2", "y1", "y2", "y3"),
                 d = c(46.5, 53.5, 46.5, 20.1, 33.4),
                 midpt = c((53+100)/2, 53/2, (53+100)/2, (33.4+53.5)/2, 33.4/2),
                 l = c("No concurrent use", "Alcohol & opioid", "No concurrent use", "Alcohol & either heroin or Rx opioid", "Alcohol, heroin & Rx opioid"))

df$l <- factor(df$l, levels=c("No concurrent use", "Alcohol & opioid", "Alcohol & either heroin or Rx opioid", "Alcohol, heroin & Rx opioid"))


# Specify colors

colors <- c("#FCBBA1", "#FB6A4A", "#CB181D", "#67000D")

tiff(file = "Piechart.tiff", width = 5400, height = 5400, units = "px", res = 600)
ggplot(df, aes(x = b, y = a, fill = l)) +
  labs(fill = "") + 
  geom_bar(stat = "identity", color = "white")+
  coord_polar(theta="y") +
  geom_text(aes(x = b, y = midpt*11.42, label = paste0(d, "%")),
           size=4, colour="white") + 
  theme_void() +
  theme(legend.position = "right", legend.text = element_text(size=9), legend.key.size = unit(2, "line")) +
  scale_fill_manual(values = colors) 
dev.off()

## Reference: https://stackoverflow.com/questions/48588312/labelled-multi-level-pie-chart
