### Part 2, Chapter 3a
## SCENARIO:
## SOCIAL MEDIA AUDIENCE SEGMENTATION
# Loading the foreign package to create animport of the SAV file with all of the necessary data for plotting.
require(foreign)

# Loading the sjPlot package to create another import the SAV file. This package also contains a function for creating contingency tables.
require(sjPlot)

# Importing the data as two objects to be used in R. 
# For the file path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R_table <- sji.SPSS("C:\\Project\\data_total_SAV.sav", autoAttachVarLabels=T)
data_total_R_plot <- read.spss("C:\\Project\\data_total_SAV.sav",to.data.frame=T,trim_values=F)

# Loading the ggplot2 package for creating plots
require(ggplot2)

# Creating histograms for the number of Facebook friends respondents have, raising the limit for the x axis to "zoom in" on the values
# FIGURE 2: KERNEL DENSITY PLOT FOR FACEBOOK INFLUENCE
tiff("Figure2.tiff", width = 6, height = 4, units = 'in', res = 500)
ggplot(data_total_R_plot, aes(x=FacebookFriendsCount))+geom_density(adjust=5,fill="white")+ylab("Density")+xlab("Number of Facebook Friends")+theme(text = element_text(size=12),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))+xlim(0,(4*sd(data_total_R_plot$FacebookFriendsCount,na.rm=T)))
dev.off()

# FIGURE 3: KERNEL DENSITY PLOT FOR FACEBOOK INFLUENCE BY VISITING FREQUENCY
FBFriendsVisits <- data.frame(data_total_R_plot$FacebookFriendsCount,data_total_R_plot$FacebookVisitsThirds)
FBFriendsVisits <- na.omit(FBFriendsVisits)
library(plyr)
FBFriendsVisits_means <- ddply(FBFriendsVisits, "data_total_R_plot.FacebookVisitsThirds", summarise, data_total_R_plot.FacebookFriendsCount.mean=mean(data_total_R_plot.FacebookFriendsCount))
tiff("Figure3.tiff", width = 12, height = 4, units = 'in', res = 500)
ggplot(FBFriendsVisits, aes(x=data_total_R_plot.FacebookFriendsCount))+geom_density(aes(fill=data_total_R_plot.FacebookVisitsThirds,kernel="cosine",adjust=5,alpha=0.001))+ylab("Density")+xlab("Number of Facebook Friends")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))+xlim(0,(4*sd(data_total_R_plot$FacebookFriendsCount,na.rm=T)))+guides(fill=guide_legend(title="Facebook visiting frequency"))+geom_vline(data=FBFriendsVisits_means, aes(xintercept=data_total_R_plot.FacebookFriendsCount.mean,colour=data_total_R_plot.FacebookVisitsThirds),linetype="dashed", size=1)
dev.off()

# FIGURE 4: KERNEL DENSITY PLOT FOR FACEBOOK INFLUENCE BY UPDATE FREQUENCY
FBFriendsUpdates <- data.frame(data_total_R_plot$FacebookFriendsCount,data_total_R_plot$FacebookUpdatesThirds)
FBFriendsUpdates <- na.omit(FBFriendsUpdates)
FBFriendsUpdates_means <- ddply(FBFriendsUpdates, "data_total_R_plot.FacebookUpdatesThirds", summarise, data_total_R_plot.FacebookFriendsCount.mean=mean(data_total_R_plot.FacebookFriendsCount))
tiff("Figure4.tiff", width = 12, height = 4, units = 'in', res = 500)
ggplot(FBFriendsUpdates, aes(x=data_total_R_plot.FacebookFriendsCount))+geom_density(aes(fill=data_total_R_plot.FacebookUpdatesThirds,kernel="cosine",adjust=5,alpha=0.001))+ylab("Density")+xlab("Number of Facebook Friends")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))+xlim(0,(4*sd(data_total_R_plot$FacebookFriendsCount,na.rm=T)))+guides(fill=guide_legend(title="Facebook updates"))+geom_vline(data=FBFriendsUpdates_means, aes(xintercept=data_total_R_plot.FacebookFriendsCount.mean,colour=data_total_R_plot.FacebookUpdatesThirds),linetype="dashed", size=1)
dev.off()

# FIGURE 5: HISTOGRAM FOR FACEBOOK UPDATES
tiff("Figure5.tiff", width = 8, height = 4, units = 'in', res = 500)
ggplot(data_total_R_plot, aes(x=FacebookUpdatesInLast30Days))+geom_histogram(colour="black", fill="white",binwidth=1)+ylab("Number of respondents")+xlab("Number of Facebook updates in the last 30 days")+theme(text = element_text(size=14),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))
dev.off()

# Table 9: Facebook visiting frequency among Facebook users, segmented by number of updates
sjt.xtab(data_total_R_table$FacebookVisitsThirds, data_total_R_table$FacebookUpdatesThirds, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

rm(list = ls())