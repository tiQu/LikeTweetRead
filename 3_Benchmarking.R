## SCENARIO:
## BEST PRACTICES
# Loading the sjPlot package to conveniently import the SAV file with all of the necessary data. This package also contains the plotting functions needed for this scenario.
require(sjPlot)

# Importing the data as object to be used in R. 
# For the path, use backslashes on a Windows machine and forward slashes on a Mac
data_total_R <- sji.SPSS("C:\\Project\\data_total_SAV.sav", autoAttachVarLabels=T)

# The Globe and Mail vs Huffington Post (websites)
# Grouped bar chart for readers of the website of The Globe and Mail, segmentation based on Facebook "likes"
sjp.grpfrq(data_total_R$FacebookLikesThirds,data_total_R$Mosaic_media_ReadOnline_globeandmailcom,upperYlim=700)

# Grouped bar chart for readers of the Huffington Post website, segmentation based on Facebook "likes"
sjp.grpfrq(data_total_R$FacebookLikesThirds,data_total_R$Mosaic_media_ReadOnline_huffingtonpostca,upperYlim=700)

# Grouped bar chart for readers of website of the The Globe and Mail, segmentation based on Facebook updates in the last 30 days
sjp.grpfrq(data_total_R$FacebookUpdatesThirds,data_total_R$Mosaic_media_ReadOnline_globeandmailcom,upperYlim=900)

# Grouped bar chart for readers of the Huffington Post website, segmentation based on Facebook updates in the last 30 days
sjp.grpfrq(data_total_R$FacebookUpdatesThirds,data_total_R$Mosaic_media_ReadOnline_huffingtonpostca,upperYlim=900)

# Grouped bar chart for readers of the their local newspaper's website, segmentation based on Facebook visiting frequency
sjp.grpfrq(data_total_R$FacebookVisitsThirds, data_total_R$Mosaic_media_ReadOnline_Yourlocaldailynewspaperswebsite,upperYlim=900)
