### Part 2, Chapter 3a
## SCENARIO:
## SOCIAL MEDIA AUDIENCE SEGMENTATION
# Loading the foreign package to create animport of the SAV file with all of the necessary data for plotting.
require(foreign)

# Loading the sjPlot package to create another import the SAV file. This package also contains a function for creating contingency tables.
require(sjPlot)

# Importing the data as two objects to be used in R. 
# For the file path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R_table <- sji.SPSS("C:\\Project\\data_total_SAV.sav", 
                               autoAttachVarLabels=T)
data_total_R_plot <- read.spss("C:\\Project\\data_total_SAV.sav",
                               to.data.frame=T,
                               trim_values=F)

# Loading the ggplot2 package for creating plots
require(ggplot2)

# Creating histograms for the number of Facebook friends respondents have, raising the limit for the x axis to "zoom in" on the values
# FIGURE 2: KERNEL DENSITY PLOT FOR FACEBOOK INFLUENCE
tiff("Figure2.tiff", 
     width = 6, 
     height = 4, 
     units = 'in', 
     res = 500) # wrapper for creating a high-quality TIFF graphic
ggplot(data_total_R_plot, 
       aes(x=FacebookFriendsCount)) + # pointing R to the data.frame and the variable of interest
  geom_density(adjust=5,fill="white") + # create a density plot with a white fill
  ylab("Density") +
  xlab("Number of Facebook Friends") + # labels
  theme(text = element_text(size=12),
        axis.title.y = element_text(vjust=1.3),
        axis.title.x = element_text(vjust=-0.4)) + # formatting axis titles text
  xlim(0,(4*sd(data_total_R_plot$FacebookFriendsCount,na.rm=T))) # setting the limit of the x-axis to four standard deviations
dev.off() # wrapper for creating a high-quality TIFF graphic

# FIGURE 3: KERNEL DENSITY PLOT FOR FACEBOOK INFLUENCE BY VISITING FREQUENCY
FBFriendsVisits <- data.frame(data_total_R_plot$FacebookFriendsCount,
                              data_total_R_plot$FacebookVisitsThirds) # creating a data.frame from the total dataset so that it can be formatted for plotting
FBFriendsVisits <- na.omit(FBFriendsVisits) # omit missing values
library(plyr)
FBFriendsVisits_means <- ddply(FBFriendsVisits, 
                               "data_total_R_plot.FacebookVisitsThirds", 
                               summarise, 
                               data_total_R_plot.FacebookFriendsCount.mean=mean(data_total_R_plot.FacebookFriendsCount)) # creating a separate R object that has the means of FacebookFriendsCount
tiff("Figure3.tiff", 
     width = 12, 
     height = 4, 
     units = 'in', 
     res = 500) # wrapper for creating a high-quality TIFF graphic
ggplot(FBFriendsVisits, 
       aes(x=data_total_R_plot.FacebookFriendsCount)) + # pointing R to the data.frame and the variable of interest
  geom_density(aes(fill=data_total_R_plot.FacebookVisitsThirds,
                   kernel="cosine",adjust=5,alpha=0.001)) + # create a density plot
  ylab("Density") +
  xlab("Number of Facebook Friends") + # axis labels
  theme(text = element_text(size=18),
        axis.title.y = element_text(vjust=1.3),
        axis.title.x = element_text(vjust=-0.4)) + # text formatting parameters
  xlim(0,(4*sd(data_total_R_plot$FacebookFriendsCount,na.rm=T))) +
  guides(fill=guide_legend(title="Facebook visiting frequency")) + # vary fill by visiting frequency
  geom_vline(data=FBFriendsVisits_means, 
             aes(xintercept=data_total_R_plot.FacebookFriendsCount.mean,
                 colour=data_total_R_plot.FacebookVisitsThirds),
             linetype="dashed", 
             size=1) # add vertical lines for each group's mean
dev.off() # wrapper for creating a high-quality TIFF graphic

# FIGURE 4: KERNEL DENSITY PLOT FOR FACEBOOK INFLUENCE BY UPDATE FREQUENCY
FBFriendsUpdates <- data.frame(data_total_R_plot$FacebookFriendsCount,
                               data_total_R_plot$FacebookUpdatesThirds) # create a separate R object for the to-be-plotted variables
FBFriendsUpdates <- na.omit(FBFriendsUpdates) # omit missing values
FBFriendsUpdates_means <- ddply(FBFriendsUpdates, 
                                "data_total_R_plot.FacebookUpdatesThirds", 
                                summarise, 
                                data_total_R_plot.FacebookFriendsCount.mean=mean(data_total_R_plot.FacebookFriendsCount)) # get the mean of FzcebookFriendsCount for each group and store them in a different object 
tiff("Figure4.tiff", 
     width = 12, 
     height = 4, 
     units = 'in', 
     res = 500) # wrapper for creating a high-quality TIFF graphic
ggplot(FBFriendsUpdates, 
       aes(x=data_total_R_plot.FacebookFriendsCount)) + # pointing R to the data.frame and the variable of interest
  geom_density(aes(fill=data_total_R_plot.FacebookUpdatesThirds,
                   kernel="cosine",
                   adjust=5,
                   alpha=0.001)) + # create a density plot
  ylab("Density") +
  xlab("Number of Facebook Friends") + # axis labels
  theme(text = element_text(size=18),
        axis.title.y = element_text(vjust=1.3),
        axis.title.x = element_text(vjust=-0.4)) + # text formatting parameters
  xlim(0,(4*sd(data_total_R_plot$FacebookFriendsCount,na.rm=T))) + # set the limit at four standard deviations of FacebookFriendsCount
  guides(fill=guide_legend(title="Facebook updates")) + # vary fill by Facebook updates
  geom_vline(data=FBFriendsUpdates_means, 
             aes(xintercept=data_total_R_plot.FacebookFriendsCount.mean,
                 colour=data_total_R_plot.FacebookUpdatesThirds),
             linetype="dashed", 
             size=1) # show the means for each group with a vertical line
dev.off() # wrapper for creating a high-quality TIFF graphic

# FIGURE 5: HISTOGRAM FOR FACEBOOK UPDATES
tiff("Figure5.tiff", 
     width = 8, 
     height = 4, 
     units = 'in', 
     res = 500) # wrapper for creating a high-quality TIFF graphic
ggplot(data_total_R_plot, 
       aes(x=FacebookUpdatesInLast30Days)) + # pointing R to the data.frame and the variable of interest
  geom_histogram(colour="black", 
                 fill="white",
                 binwidth=1) + # create a histogram
  ylab("Number of respondents") +
  xlab("Number of Facebook updates in the last 30 days") + # axis labels
  theme(text = element_text(size=14), 
        axis.title.y = element_text(vjust=1.3), 
        axis.title.x = element_text(vjust=-0.4)) # text formatting
dev.off() # wrapper for creating a high-quality TIFF graphic

# Table 9: Facebook visiting frequency among Facebook users, segmented by number of updates
sjt.xtab(data_total_R_table$FacebookVisitsThirds, 
         data_total_R_table$FacebookUpdatesThirds, # create a crosstab for these two variables
         showExpected=F, 
         showRowPerc=F, 
         showCellPerc=F, 
         showColPerc=T, 
         showLegend=F) # determining which percentages / labels should be in the output

rm(list = ls())