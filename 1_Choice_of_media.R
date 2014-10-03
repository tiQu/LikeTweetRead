## SCENARIO:
## CHOICE OF MEDIA
# Loading the sjPlot package to conveniently import the SAV file with all of the necessary data. This package also contains a function for creating contingency tables.
require(sjPlot)

# Importing the data as object to be used in R. 
# For the path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R <- sji.SPSS("C:\\Project\\data_total_SAV.sav", autoAttachVarLabels=T)

# Correlation tests for deciding which variable to use as banner for contingency tables
# Loading the Hmisc package which contains the cor.test function
require(Hmisc)
#Print Newspapers
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$FacebookFriendsCount)
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$FacebookUpdatesInLast30Days)
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$FacebookLikeCount)
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$AverageTweets)
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$TwitterFollowersCount)
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$TwitterFriendsCount)
cor.test(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$Q5_Facebook_Visit_Frequency)
## Highest correlation with FacebookFriendsCount

#Magazines 
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$FacebookFriendsCount)
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$FacebookUpdatesInLast30Days)
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$FacebookLikeCount)
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$AverageTweets)
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$TwitterFollowersCount)
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$TwitterFriendsCount)
cor.test(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$Q5_Facebook_Visit_Frequency)
## Low correlations throughout

#Online news
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$FacebookFriendsCount)
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$FacebookUpdatesInLast30Days)
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$FacebookLikeCount)
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$AverageTweets)
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$TwitterFollowersCount)
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$TwitterFriendsCount)
cor.test(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$Q5_Facebook_Visit_Frequency)
## Low correlations throughout

## Tables for FacebookFriendsQuintiles vs print newspapers reading frequency
sjt.xtab(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$FacebookFriendsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

sjt.xtab(data_total_R$Mosaic_media_frequency_0_NET, data_total_R$FacebookVisitsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

## Tables for FacebookFriendsQuintiles vs print magazines reading frequency
sjt.xtab(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$FacebookFriendsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

sjt.xtab(data_total_R$Mosaic_media_frequency_1_NET, data_total_R$FacebookVisitsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

## Tables for FacebookFriendsQuintiles vs online news reading frequency
sjt.xtab(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$FacebookFriendsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

sjt.xtab(data_total_R$Mosaic_media_frequency_4_NET, data_total_R$FacebookVisitsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)

## visiting frequency for FacebookFriendsQuintiles
sjt.xtab(data_total_R$Mosaic_SocialMedia_FrequencyVisit_0, data_total_R$FacebookFriendsQuintiles, showExpected=F, showRowPerc=F, showCellPerc=F, showColPerc=TRUE, showLegend=F)
