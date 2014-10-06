### Part 2, Chapter 3b
## SCENARIO:
## TECH USAGE
# Loading the foreign package to import the SAV file with all of the necessary data. This one has an import function that makes the data easier to plot, which is why it is preferred over the sjPlot package for this import. 
require(foreign)

# Importing the data as object to be used in R, this time using a different function.
# For the path, use backslashes on a Windows machine and forward slashes on a Mac
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
## (highest correlation for FacebookFriendsQuintiles)

## Overall distribution for phones/smartphones, raising the limit for the y-axis in each plot
# FIGURES 1 - 3: BOX PLOTS OF THE OVERALL DISTRIBUTION OF PHONE/SMARTPHONE USAGE (VARYING LIMITS FOR Y-AXIS)
# FIGURE 1
ggplot(data_total_R, aes(x=factor(0), y=data_total_R$AG_6_NET)) + geom_boxplot()+ylab("Phone / Smartphone usage (min per week)")+xlab("Overall distribution\n(no limit for y-axis)")+theme(text = element_text(size=16),axis.title.y = element_text(vjust=1.3))
# FIGURE 2
ggplot(data_total_R, aes(x=factor(0), y=data_total_R$AG_6_NET)) + geom_boxplot()+ylim(0,500)+ylab("Phone / Smartphone usage (min per week)")+xlab("Overall distribution\n(limit at 500 minutes)")+theme(text = element_text(size=16),axis.title.y = element_text(vjust=1.5))
# FIGURE 3
ggplot(data_total_R, aes(x=factor(0), y=data_total_R$AG_6_NET)) + geom_boxplot()+ylim(0,250)+ylab("Phone / Smartphone usage (min per week)")+xlab("Overall distribution\n(limit at 250 minutes)")+theme(text = element_text(size=16),axis.title.y = element_text(vjust=1.3))

# Summary to return the median and the mean for phone/smartphone usage
summary(data_total_R$AG_6_NET)

## Looking at the distributions for tech usage by social media usage.
# The dataset does not have social media data for all respondents in it. That means that ggplot needs a smaller dataset without missing values (respondents that have no values for social media variables), otherwise the ggplot function will try to plot these cases as well and they are not interesting for this analysis. This procedure is repeated for each series of plots for each device (smartphones/phones, iPads, non-iPad tablets)

## Box plots for phone/smartphone usage vs FacebookFriendsQuintiles
# FIGURE 4: BOX PLOT OF PHONE/SMARTPHONE USAGE VS FACEBOOK INFLUENCE
FBFriendsAG_6_NET <- data.frame(data_total_R$FacebookFriendsQuintiles,data_total_R$AG_6_NET)
FBFriendsAG_6_NET <- na.omit(FBFriendsAG_6_NET)
ggplot(FBFriendsAG_6_NET, aes(x=as.factor(FBFriendsAG_6_NET$data_total_R.FacebookFriendsQuintiles), y=FBFriendsAG_6_NET$data_total_R.AG_6_NET)) + geom_boxplot()+xlab("FacebookFriendsQuintiles")+ylab("Phone / Smartphone usage (min per week)")+ylim(0,500) + theme(text = element_text(size=18),axis.text.x = element_text(angle=90,vjust=0.3,size=18),axis.title.y = element_text(vjust=1.3))


## Box plots for phone/smartphone usage vs TwitterFollowersThirds
# FIGURE 5: BOX PLOTS OF PHONE/SMARTPHONE USAGE VS TWITTER INFLUENCE
TWFollowersAG_6_NET <- data.frame(data_total_R$TwitterFollowersThirds,data_total_R$AG_6_NET)
TWFollowersAG_6_NET <- na.omit(TWFollowersAG_6_NET)
ggplot(TWFollowersAG_6_NET, aes(x=as.factor(TWFollowersAG_6_NET$data_total_R.TwitterFollowersThirds), y=TWFollowersAG_6_NET$data_total_R.AG_6_NET)) + geom_boxplot()+ylim(0,500)+xlab("TwitterFollowersThirds")+ylab("Phone / Smartphone usage (min per week)")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x=element_text(vjust=-0.4, size=18),axis.text.x=element_text(size=18))

## Box plots for iPad usage vs TwitterVisitsThirds
# FIGURE 6: BOX PLOTS OF TWITTER VISITING FREQUENCY VS IPAD USAGE
TWVisitsAG_7_NET <- data.frame(data_total_R$TwitterVisitsThirds,data_total_R$AG_7_NET)
TWVisitsAG_7_NET <- na.omit(TWVisitsAG_7_NET)
ggplot(TWVisitsAG_7_NET, aes(x=as.factor(TWVisitsAG_7_NET$data_total_R.TwitterVisitsThirds), y=TWVisitsAG_7_NET$data_total_R.AG_7_NET)) + geom_boxplot() + theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x=element_text(vjust=-0.4, size=18),axis.text.x=element_text(size=18))+ylab("iPad usage (min per week)")+ylim(0,500) + xlab("TwitterVisitsThirds")

## Box plots for non-iPad tablet usage vs TwitterFollowersThirds
# FIGURE 7: BOX PLOTS OF FACEBOOK INFLUENCE VS NON-IPAD TABLET USAGE
FBFriendsAG_8_NET <- data.frame(data_total_R$FacebookFriendsQuintiles,data_total_R$AG_8_NET)
FBFriendsAG_8_NET <- na.omit(FBFriendsAG_8_NET)
ggplot(FBFriendsAG_8_NET, aes(x=as.factor(FBFriendsAG_8_NET$data_total_R.FacebookFriendsQuintiles), y=FBFriendsAG_8_NET$data_total_R.AG_8_NET)) + geom_boxplot()+ theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x=element_text(vjust=-0.4, size=18),axis.text.x=element_text(size=18,angle=90,vjust=0.3)) +ylab("non-iPad tablet usage (min per week)")+ylim(0,500) + xlab("FacebookFriendsQuintiles")

## Plotting overall distribution for non-iPad usage to see if there is enough variation in the data to yield meaningful results
# FIGURE 8: OVERALL DISTRIBUTION FOR NON-IPAD USAGE
ggplot(data_total_R, aes(x=factor(0), y=data_total_R$AG_8_NET)) + geom_boxplot()+ylab("non-iPad tablet usage (min per week)")+xlab("Overall distribution\n(no limit for y-axis)")+theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x=element_text(vjust=-0.4, size=18),axis.text.x=element_text(size=18))+ylim(0,500)
