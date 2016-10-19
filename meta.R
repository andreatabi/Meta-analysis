# first load Bioconductor resources needed to install the EBImage package
# and accept/download all of its dependencies
## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite("EBImage")

# then load metagear
library(metagear)


# (optional) initialize the reference dataset to help generate standardized fileNames (e.g., STUDY_ID numbers)
data <- read.csv("scopus_int.csv")

theRefs <- effort_initialize(data)

PDFs_collect(theRefs, DOIcolumn = "DOI", FileNamecolumn = "STUDY_ID", directory = getwd())




# load metagear package and .jpg image manipulation package EBImage
library(metagear)
library(EBImage)
# load the scatterplot image, source: Kam et al. (2003) Functional Ecology 17:496-503. 
data(Kam_et_al_2003_Fig2)
# display the image
figure_display(Kam_et_al_2003_Fig2)
# convert back to .jpg
figure_write(Kam_et_al_2003_Fig2, file = "Kam_et_al_2003_Fig2.jpg")

# load the scatterplot image, source: Kam et al. (2003) Functional Ecology 17:496-503.
rawData <- figure_scatterPlot("Kam_et_al_2003_Fig2.jpg")


# download the figure image from my website
figureSource <- "http://lajeunesse.myweb.usf.edu/metagear/example_2_scatterPlot.jpg" 
download.file(figureSource, "example_2_scatterPlot.jpg", quiet = TRUE, mode = "wb") 
aFig <- figure_read("example_2_scatterPlot.jpg", display = TRUE)

# because of the small size of the image the axis parameter needed adjustment from 5 to 3
rawData2 <- figure_scatterPlot("example_2_scatterPlot.jpg",
                               axis_thickness = 3, # adjusted from 5 to 3 to help detect the thin axis
                               X_min = 0, # minimum X-value reported in the plot X_max = 50, # maximum X-value reported in the plot Y_min = 0,
                               Y_max = 70)









