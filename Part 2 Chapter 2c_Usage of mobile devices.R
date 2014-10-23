### Part 2, Chapter 3c
## SCENARIO:
## TECH USAGE
# Loading the foreign package to import the SAV file with all of the necessary data. 
require(foreign)

# Importing the data as object to be used in R, this time using a different function.
# For the file path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R <- read.spss("C:\\Project\\data_total_SAV.sav",to.data.frame=T,trim_values=F)

# Loading the ggplot2 package for plotting
require(ggplot2)

## Correlation tests for mobile phone / smartphone usage
cor.test(data_total_R$AG_6_NET, data_total_R$FacebookFriendsCount)
cor.test(data_total_R$AG_6_NET, data_total_R$FacebookUpdatesInLast30Days)
cor.test(data_total_R$AG_6_NET, data_total_R$FacebookLikeCount)
cor.test(data_total_R$AG_6_NET, data_total_R$AverageTweets)
cor.test(data_total_R$AG_6_NET, data_total_R$TwitterFollowersCount)
cor.test(data_total_R$AG_6_NET, data_total_R$TwitterFriendsCount)
cor.test(data_total_R$AG_6_NET, data_total_R$Q5_Facebook_Visit_Frequency)
cor.test(data_total_R$AG_6_NET, data_total_R$Q8_Twitter_Reading_Frequency)
## (highest correlation for FacebookFriendsCount)

## Correlation tests for iPad tablet computer usage
cor.test(data_total_R$AG_7_NET, data_total_R$FacebookFriendsCount)
cor.test(data_total_R$AG_7_NET, data_total_R$FacebookUpdatesInLast30Days)
cor.test(data_total_R$AG_7_NET, data_total_R$FacebookLikeCount)
cor.test(data_total_R$AG_7_NET, data_total_R$AverageTweets)
cor.test(data_total_R$AG_7_NET, data_total_R$TwitterFollowersCount)
cor.test(data_total_R$AG_7_NET, data_total_R$TwitterFriendsCount)
cor.test(data_total_R$AG_7_NET, data_total_R$Q5_Facebook_Visit_Frequency)
cor.test(data_total_R$AG_7_NET, data_total_R$Q8_Twitter_Reading_Frequency)
## (highest correlation for Twitter reading frequency)

## Correlation tests for usage of ablet PCs other than the iPad
cor.test(data_total_R$AG_8_NET, data_total_R$FacebookFriendsCount)
cor.test(data_total_R$AG_8_NET, data_total_R$FacebookUpdatesInLast30Days)
cor.test(data_total_R$AG_8_NET, data_total_R$FacebookLikeCount)
cor.test(data_total_R$AG_8_NET, data_total_R$AverageTweets)
cor.test(data_total_R$AG_8_NET, data_total_R$TwitterFollowersCount)
cor.test(data_total_R$AG_8_NET, data_total_R$TwitterFriendsCount)
cor.test(data_total_R$AG_8_NET, data_total_R$Q5_Facebook_Visit_Frequency)
cor.test(data_total_R$AG_8_NET, data_total_R$Q8_Twitter_Reading_Frequency)
cor.test(data_total_R$AG_8_NET, data_total_R$Q8_Twitter_Reading_Frequency)
## (highest correlation for FacebookFriendsCount)

# FIGURE 6
# Scatter plot for Facebook friends vs phone / smartphone usage
tiff("Figure6.tiff", width = 6, height = 6, units = 'in', res = 500) # Wrapper for creating a high-resolution TIFF graphic
ggplot(data_total_R, aes(x=FacebookFriendsCount, y=AG_6_NET)) +
  geom_point() +
  geom_smooth(method=lm) +
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5)) +
  xlab("Facebook friends") +
  ylab("Minutes spent on mobile / smartphone per week")
dev.off() # Wrapper for creating a high-resolution TIFF graphic

# FIGURE 7
# Scatter plot for Facebook friends vs phone / smartphone usage, using log scales
# To apply log transformations to both FacebookFriendsCount and the Minutes users spend on their mobile / smartphone each week, values of these variables that are equal to 0 need to be replaced with a 1, because the logarithm to the base 10 of 1 is -Infinity, i.e. the logarithm would return values that can not be plotted.
FBFriendsSmartphone <- cbind(data_total_R$FacebookFriendsCount,data_total_R$AG_6_NET)
FBFriendsSmartphone[FBFriendsSmartphone==0]<-1 
FBFriendsSmartphone <- as.data.frame(FBFriendsSmartphone)

# Loading the scales package which allows scale transformations
require(scales)

# Creating the actual plot
tiff("Figure7.tiff", width = 6, height = 6, units = 'in', res = 500)
ggplot(FBFriendsSmartphone, aes(x=V1, y=V2)) +
geom_point() +
scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
              labels = trans_format("log10", math_format(10^.x))) + 
scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
geom_smooth(method=lm) + 
theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5)) +
xlab("Facebook friends") +
ylab("Minutes spent on mobile / smartphone per week")
dev.off()

# FIGURE 8
# Scatter plot for Twitter visiting frequency vs mobile / smartphone usage, using log scales
# Same procedure as for the previous figure
TWVisitsPhone <- cbind(data_total_R$Q8_Twitter_Reading_Frequency,data_total_R$AG_6_NET)
TWVisitsPhone[TWVisitsPhone==0]<-1 
TWVisitsPhone <- as.data.frame(TWVisitsPhone)

tiff("Figure8.tiff", width = 6, height = 6, units = 'in', res = 500)
ggplot(TWVisitsPhone, aes(x=V1, y=V2)) +
  geom_point() +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) + 
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  geom_smooth(method=lm) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5)) +
  xlab("Number of Twitter visits per week") +
  ylab("Minutes spent on mobile / smartphone per week")
dev.off()

# FIGURE 9
# Scatter plot for number of Twitter followers vs mobile / smartphone usage, using log scales
TwFollowPhone <- cbind(data_total_R$TwitterFollowersCount,data_total_R$AG_6_NET)
TwFollowPhone[TwFollowPhone==0]<-1 
TwFollowPhone <- as.data.frame(TwFollowPhone)

tiff("Figure9.tiff", width = 6, height = 6, units = 'in', res = 500)
ggplot(TwFollowPhone, aes(x=V1, y=V2)) +
  geom_point() +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) + 
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  geom_smooth(method=lm) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5)) +
  xlab("Number of Twitter followers") +
  ylab("Minutes spent on mobile / smartphone per week")
dev.off()

# FIGURE 10
# Scatter plot for number of Twitter visits per week vs iPad usage, using log scales
TwitterVisitsiPad <- cbind(data_total_R$Q8_Twitter_Reading_Frequency,data_total_R$AG_7_NET)
TwitterVisitsiPad[TwitterVisitsiPad==0]<-1 
TwitterVisitsiPad <- as.data.frame(TwitterVisitsiPad)

tiff("Figure10.tiff", width = 6, height = 6, units = 'in', res = 500)
ggplot(TwitterVisitsiPad, aes(x=V1, y=V2)) +
  geom_point() +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) + 
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  geom_smooth(method=lm) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5)) +
  xlab("Number of Twitter visits per week") +
  ylab("Minutes spent on iPads per week")
dev.off()

# FIGURE 11
# Scatter plot for number of Twitter visits per week vs iPad usage, using log scales
TwitterVisitsNoniPad <- cbind(data_total_R$Q8_Twitter_Reading_Frequency,data_total_R$AG_8_NET)
TwitterVisitsNoniPad[TwitterVisitsNoniPad==0]<-1 
TwitterVisitsNoniPad <- as.data.frame(TwitterVisitsNoniPad)

tiff("Figure11.tiff", width = 6, height = 6, units = 'in', res = 500)
ggplot(TwitterVisitsNoniPad, aes(x=V1, y=V2)) +
  geom_point() +
  scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) + 
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  geom_smooth(method=lm) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5)) +
  xlab("Number of Twitter visits per week") +
  ylab("Minutes spent on non-iPad tablets per week")
dev.off()

## Plotting overall distribution for non-iPad usage to see if there is enough variation in the data to yield meaningful results for any of the social media variables
# FIGURE 12: OVERALL DISTRIBUTION FOR NON-IPAD USAGE
tiff("Figure12.tiff", width = 3, height = 6, units = 'in', res = 500)
ggplot(data_total_R, aes(x=factor(0), y=data_total_R$AG_8_NET)) + geom_boxplot()+ylab("Non-iPad tablet usage (min per week)")+xlab("Overall distribution")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x=element_text(vjust=-0.4, size=18),axis.text.x=element_text(size=18))+ylim(0,500)
dev.off()

rm(list = ls())