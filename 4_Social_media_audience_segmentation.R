### Part 2, Chapter 3d
## SCENARIO:
## SOCIAL MEDIA AUDIENCE SEGMENTATION
# Loading the sjPlot package to conveniently import the SAV file with all of the necessary data. This package also contains a function for creating contingency tables.
require(sjPlot)

# Importing the data as object to be used in R. 
# For the path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R <- sji.SPSS("C:\\Project\\data_total_SAV.sav", autoAttachVarLabels=T)

# Loading the ggplot2 package for plotting histograms
require(ggplot2)

# Creating histograms for the number of Facebook friends respondents have, raising the limit for the x axis to "zoom in" on the values
# FIGURE 14: HISTOGRAM FOR FACEBOOK INFLUENCE (NO LIMIT FOR X-AXIS)
ggplot(data_total_R, aes(x=FacebookFriendsCount))+geom_histogram(colour="black", fill="white")+ylab("Number of respondents with this number of friends")+xlab("Number of Facebook Friends\n(no limit for x axis)")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))
# FIGURE 15: HISTOGRAM FOR FACEBOOK INFLUENCE (LIMIT AT 1000 FACEBOOK FRIENDS)
ggplot(data_total_R, aes(x=FacebookFriendsCount))+geom_histogram(colour="black", fill="white")+xlim(0,1000)+ylab("Number of respondents with this number of friends")+xlab("Number of Facebook Friends\n(limit at 1000 FB friends)")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))
# FIGURE 16: HISTOGRAM FOR FACEBOOK INFLUENCE (LIMIT AT 250 FACEBOOK FRIENDS)
ggplot(data_total_R, aes(x=FacebookFriendsCount))+geom_histogram(colour="black", fill="white")+xlim(0,250)+ylab("Number of respondents with this number of friends")+xlab("Number of Facebook Friends\n(limit at 250 FB friends)")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))

# Creating histograms for the number of Facebook updates people have posted in the last 30 days, raising the limit for the x axis to "zoom in" on the values
# FIGURE 17: HISTOGRAM FOR FACEBOOK UPDATES (NO LIMIT ON X-AXIS)
ggplot(data_total_R, aes(x=FacebookUpdatesInLast30Days))+geom_histogram(colour="black", fill="white")+ylab("Number of respondents with this number of updates")+xlab("Number of Facebook updates in the last 30 days")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))
# FIGURE 18: HISTOGRAM FOR FACEBOOK UPDATES (LIMIT AT 25 UPDATES IN THE LAST 30 DAYS)
ggplot(data_total_R, aes(x=FacebookUpdatesInLast30Days))+geom_histogram(colour="black", fill="white")+xlim(0,25)+ylab("Number of respondents with this number of updates")+xlab("Number of Facebook updates in the last 30 days")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.4))

# Table 9: Facebook visiting frequency among Facebook users, segmented by number of updates
sjt.xtab(data_total_R$FacebookVisitsThirds, data_total_R$FacebookUpdatesThirds, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)