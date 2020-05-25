# Create dummy data
df<- data.frame(loc = rep(c("l1", "l2"), each = 3),
                name = rep(c("A", "B"), 3),
                grid = c(5,6,7,2,3,5),
                area = c(5,10,1,1,3,1),
                areaOrig = rep(c(20, 10, 5), each = 2))

df2<-rbind(df, df)

# Create two mountain types types
df2$type = rep(c("y", "z"), each = 6)

library(purrr)

by_type <- df2 %>% 
  group_by(type) %>% 
  nest() %>% 
  mutate(plot = map(data, 
                    ~ggplot(. ,aes(x = grid, y = area)) +
                      geom_bar(stat = "identity") +
                      ggtitle(.) +
                      facet_grid(loc ~name)))

walk2(by_type$type, by_type$plot, 
      +       ~ggsave(paste0(.x, ".pdf"), .y))