### Part 2, Chapter 3c
## SCENARIO:
## BENCHMARKING
# Loading the foreign package to import the SAV file with all of the necessary data. 
require(foreign)

# Importing the data as object to be used in R, this time using a different function.
# For the file path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R <- read.spss("C:\\Project\\data_total_SAV.sav",to.data.frame=T,trim_values=F)

# Loading the ggplot2 package for plotting
require(ggplot2)

# Loading the scales package for using a percentage axis
require(scales)

## The Globe and Mail vs Huffington Post (websites)
# FIGURES 13 - 14: GLOBEANDMAIL.COM (READERSHIP VS FACEBOOK ENGAGEMENT AND ACTIVITY)
# Grouped bar chart for readers of the website of The Globe and Mail, segmentation based on Facebook "likes"
# Before plotting, the data for the chart -- FacebookLikesThirds and the readership variable -- needs to be created as a new R object, copying from the full dataset. 
FBLikesGlobeMail <- data.frame(data_total_R$FacebookLikesThirds,data_total_R$Mosaic_media_ReadOnline_globeandmailcom2)
colnames(FBLikesGlobeMail) <- c("FacebookLikesThirds","globeandmail.com")
# Using na.omit ensures that only complete observations are being plotted, i.e. respondents that have no values for FacebookLikesThirds because their data was not imported are being ignored by the plotting function. Otherwise, R would plot three levels of the readership variable for each level of FacebookLikesThirds: Reader, Non-reader, and NA (missing data).
tiff("Figure13.tiff", width = 10, height = 3, units = 'in', res = 500)
ggplot(na.omit(FBLikesGlobeMail), aes(x = FacebookLikesThirds, fill=globeandmail.com)) + 
  geom_bar(position = 'fill', width=.5) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5), panel.grid.major.x=element_line("black")) +
  xlab("Facebook Likes") +
  ylab("") +
  scale_y_continuous(labels  = percent) + 
  coord_flip()
dev.off()

# The same procedure can be used for the other plots.
# Grouped bar chart for readers of website of the The Globe and Mail, segmentation based on Facebook updates in the last 30 days
FBUpdatesGlobeMail <- data.frame(data_total_R$FacebookUpdatesThirds,data_total_R$Mosaic_media_ReadOnline_globeandmailcom2)
colnames(FBUpdatesGlobeMail) <- c("FacebookUpdatesThirds","globeandmail.com")

tiff("Figure14.tiff", width = 10, height = 3, units = 'in', res = 500)
ggplot(na.omit(FBUpdatesGlobeMail), aes(x = FacebookUpdatesThirds, fill=globeandmail.com)) + 
  geom_bar(position = 'fill', width=.5) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5), panel.grid.major.x=element_line("black")) +
  xlab("Facebook Updates") +
  ylab("") +
  scale_y_continuous(labels  = percent) + 
  coord_flip()
dev.off()

# FIGURE 15 - 16: HUFFINGTONPOST.cA (READERSHIP VS FACEBOOK ENGAGEMENT AND ACTIVITY)
# Grouped bar chart for readers of the Huffington Post website, segmentation based on Facebook "likes"
FBLikesHuffPo <- data.frame(data_total_R$FacebookLikesThirds,data_total_R$Mosaic_media_ReadOnline_huffingtonpostca2)
colnames(FBLikesHuffPo) <- c("FacebookLikesThirds","huffingtonpost.ca")
tiff("Figure15.tiff", width = 10, height = 3, units = 'in', res = 500)
ggplot(na.omit(FBLikesHuffPo), aes(x = FacebookLikesThirds, fill=huffingtonpost.ca)) + 
  geom_bar(position = 'fill', width=.5) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5), panel.grid.major.x=element_line("black")) +
  xlab("Facebook Likes") +
  ylab("") +
  scale_y_continuous(labels  = percent) + 
  coord_flip()
dev.off()

FBUpdatesHuffPo <- data.frame(data_total_R$FacebookUpdatesThirds,data_total_R$Mosaic_media_ReadOnline_huffingtonpostca2)
colnames(FBUpdatesHuffPo) <- c("FacebookUpdatesThirds","huffingtonpost.ca")
tiff("Figure16.tiff", width = 10, height = 3, units = 'in', res = 500)
ggplot(na.omit(FBUpdatesHuffPo), aes(x = FacebookUpdatesThirds, fill=huffingtonpost.ca)) + 
  geom_bar(position = 'fill', width=.5) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5), panel.grid.major.x=element_line("black")) +
  xlab("Facebook Updates") +
  ylab("") +
  scale_y_continuous(labels  = percent) + 
  coord_flip()
dev.off()

# FIGURE 17: RESPONDENTS' LOCAL NEWSPAPER'S WEBSITE (READERSHIP VS FACEBOOK ENGAGEMENT)
# Grouped bar chart for readers of the their local newspaper's website, segmentation based on Facebook visiting frequency
FBVisitsLocalN <- data.frame(data_total_R$FacebookVisitsThirds,data_total_R$Mosaic_media_ReadOnline_Yourlocaldailynewspaperswebsite2)
colnames(FBVisitsLocalN) <- c("FacebookVisitsThirds","Local")
tiff("Figure17.tiff", width = 10, height = 4, units = 'in', res = 500)
ggplot(na.omit(FBVisitsLocalN), aes(x = FacebookVisitsThirds, fill=Local)) + 
  geom_bar(position = 'fill', width=.5) + 
  theme(text = element_text(size=18),axis.title.y = element_text(vjust=1.3),axis.title.x = element_text(vjust=-0.5), panel.grid.major.x=element_line("black")) +
  xlab("Facebook visits per week") +
  ylab("") +
  scale_y_continuous(labels  = percent) + 
  coord_flip()
dev.off()

rm(list = ls())