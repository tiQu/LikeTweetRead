require(ggplot2)
qplot(data.spss$FacebookFriendsCount,data.spss$FacebookUpdatesInLast30Days)

## Mobile phone / smartphone
cor.test(data.spss$AG_6_NET, data.spss$FacebookFriendsCount)
## (winner)
cor.test(data.spss$AG_6_NET, data.spss$FacebookUpdatesInLast30Days)
cor.test(data.spss$AG_6_NET, data.spss$FacebookLikeCount)
cor.test(data.spss$AG_6_NET, data.spss$AverageTweets)
cor.test(data.spss$AG_6_NET, data.spss$TwitterFollowersCount)
cor.test(data.spss$AG_6_NET, data.spss$TwitterFriendsCount)
cor.test(data.spss$AG_6_NET, data.spss$Q5_Facebook_Visit_Frequency)

## iPad tablet computer
cor.test(data.spss$AG_7_NET, data.spss$FacebookFriendsCount)
cor.test(data.spss$AG_7_NET, data.spss$FacebookUpdatesInLast30Days)
cor.test(data.spss$AG_7_NET, data.spss$FacebookLikeCount)
cor.test(data.spss$AG_7_NET, data.spss$AverageTweets)
## (winner)
cor.test(data.spss$AG_7_NET, data.spss$TwitterFollowersCount)
cor.test(data.spss$AG_7_NET, data.spss$TwitterFriendsCount)
cor.test(data.spss$AG_7_NET, data.spss$Q5_Facebook_Visit_Frequency)

## Tablet PC other than the iPad
cor.test(data.spss$AG_8_NET, data.spss$FacebookFriendsCount)
cor.test(data.spss$AG_8_NET, data.spss$FacebookUpdatesInLast30Days)
cor.test(data.spss$AG_8_NET, data.spss$FacebookLikeCount)
cor.test(data.spss$AG_8_NET, data.spss$AverageTweets)
## (winner)
cor.test(data.spss$AG_8_NET, data.spss$TwitterFollowersCount)
cor.test(data.spss$AG_8_NET, data.spss$TwitterFriendsCount)
cor.test(data.spss$AG_8_NET, data.spss$Q5_Facebook_Visit_Frequency)
cor.test(data.spss$AG_8_NET, data.spss$Q8_Twitter_Reading_Frequency)

require(Hmisc)
require(plyr)
require(dplyr)

names(data.spss)


# First box plots for phones/smartphones
qplot(factor(0), AG_6_NET, data=data.spss, geom="boxplot", ylab="Minutes spent on phone/smartphone per week", xlab="Overall distribution")+ylim(0,250)
require(psych)
describe(data.spss$AG_6_NET)

names(data.spss)


FBFriendsAG_6_NET <- data.frame(data.spss$FacebookFriendsQuintiles,data.spss$AG_6_NET)

FBFriendsAG_6_NET <- na.omit(FBFriendsAG_6_NET)
ggplot(FBFriendsAG_6_NET, aes(x=as.factor(FBFriendsAG_6_NET$data.spss.FacebookFriendsQuintiles), y=FBFriendsAG_6_NET$data.spss.AG_6_NET)) + geom_boxplot()+ylim(0,500)

ggplot(data.spss, aes(x=as.factor(data.spss$TwitterFollowers3), y=data.spss$AG_6_NET)) + geom_boxplot()+ylim(0,500)

# Box plots for iPads and other tablets
ggplot(data.spss, aes(x=as.factor(data.spss$TWRead_33), y=data.spss$AG_7_NET)) + geom_boxplot()+ylim(0,200)
head(data.spss)
ggplot(data.spss, aes(x=as.factor(data.spss$TwitterFollowers3), y=data.spss$AG_8_NET)) + geom_boxplot()+ylim(0,400)
ggplot(data.spss, aes(x=as.factor(data.spss$FacebookFriendsQuintiles), y=data.spss$AG_8_NET)) + geom_boxplot()+ylim(0,500)

qplot(factor(0), AG_8_NET, data=data.spss, geom="boxplot", ylab="Minutes spent on tablet other than the iPad per week", xlab="Overall distribution")+ylim(0,500)

# For checking base sizes
table(data.spss$TWRead_33[data.spss$AG_7_NET<=100])

ggplot(data.spss, aes(x=as.factor(data.spss$TWRead_33), y=data.spss$AG_7_NET)) + geom_boxplot()+ylim(0,200)

ggplot(data.spss, aes(x=as.factor(data.spss$FB_Likes_3), y=data.spss$AG_8_NET)) + geom_boxplot()+ylim(0,500)
