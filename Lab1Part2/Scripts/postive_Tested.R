PT_data <- read.csv("../Data/Postive Tested/Workbook1.csv")
head(TTM)
tail(TTM)


# Plot the basic frame of the stacked bar chart.
library(ggplot2)
ggplot(data = PT_data, aes(x = Week, y = Total...Tested, fill = B.)) + 
  geom_bar(stat="identity")

# Flip the x axis and y axis so that t names of behavior can be seen
# clearly.
ggplot(data = TTM, aes(x = Type.of.Behavior, y = Sample.Size, fill = Stage.of.Change)) + 
  geom_bar(stat="identity") + coord_flip()

# Reorder the chunks so that they represent the logical order of stage
# progression.
TTM$Stage.of.Change <- factor(TTM$Stage.of.Change, levels = c("Precontemplation", 
                                                              "Contemplation", "Preparation", "Action", "Maintenance"))
# Re-plot the chart under the newly assigned order by changing the 'fill'
# command.
ggplot(data = TTM, aes(x = Type.of.Behavior, y = Sample.Size, fill = factor(Stage.of.Change))) + 
  geom_bar(stat="identity") + coord_flip()