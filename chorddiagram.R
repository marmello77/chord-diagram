##################################################
#                                                #
#    SCRIPT FOR DRAWING CHORD DRIAGRAMS IN R     #
#                                                #       
##################################################

##### Ecological Synthesis Lab (SintECO): https://marcomellolab.wordpress.com
##### Author: Marco Mello.
##### E-mail: marmello@gmail.com.  
##### How to cite: Mello MAR. 2018. Drawing networks as chord diagrams in R. Ecological Synthesis Lab of the University of São Paulo, Brazil.
##### Published on October 23rd, 2018 (English version).
##### Run in R 3.5.1 (2017-07-02) -- "Feather Spray"

##### Disclaimer: You may use this script freely for non-comercial purposes at your own risk. We assume no responsibility or liability for the use of this software, convey no license or title under any patent, copyright, or mask work right to the product. We reserve the right to make changes in the software without notification. We also make no representation or warranty that such application will be suitable for the specified use without further testing or modification. If this script helps you produce any academic work (paper, book, chapter, dissertation etc.), please acknowledge the authors and cite the source.


#############################################


#### Step 1: Clear all objects and load the required packages
rm(list=ls())

library(rstudioapi)
library(circlize)
library(bipartite)
library(igraph)
library(reshape2)
library(ggplot2)
library(rstudioapi)


#### Step 2: Set the working directory to the source file location 
current_path <- getActiveDocumentContext()$path 
setwd(dirname(current_path ))
print( getwd() )


#### Step 3: Create an adjancency matrix from a text file formatted for the package bipartite
# In this example we used the data from: Bezerra et al 2009, JANE (see "Suggested readings")
net1<-read.table("net1.txt", head=TRUE)
net1 #check it


#### Step 4: Transform the adjacency matrix into a matrix
net2 = as.matrix(net1, "adjacency")
net2 #check it


#### Step 5: Draw a basic chord diagram
chordDiagram(net2)


#### Step 6: Customize the chord diagram
#Separate rows from columns in the plot
circos.par(gap.after = c(rep(5, nrow(net2)-1), 15, rep(5, ncol(net4)-1), 15))

# Set grid (node) colors...
# Use www.palleton.com for color hex codes. Here I used one color for the rows and another for the columns. Maybe there is a way to automatize this code.
grid.col = c("#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#699A33", "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E",  "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E", "#B95C7E")

# ...and link colors
col_fun = colorRamp2(range(net2), c("grey90", "grey10"), transparency = 0.5) #create a pallete of shades of grey based on link weight

#Use the palletes created
# png(filename= "chorddiagram.png", res= 300, height= 3000, width= 3000) #Use this code if you want to export the image
chorddiagram = chordDiagram(net2, grid.col = grid.col, col = col_fun)
# dev.off() #If you export the image, use this code too
circos.clear()

  
#### Suggested readings ####

# 1. Bezerra, E.L.S., Machado, I.C. & Mello, M.A.R. (2009) Pollination networks of oil-flowers: a tiny world within the smallest of all worlds. Journal of Animal Ecology, 78, 1096–1101. DOI: http://dx.doi.org/10.1111/j.1365-2656.2009.01567.x

# 2. Circular visualization in R: Chapter 13 The chordDiagram() function: https://jokergoo.github.io/circlize_book/book/the-chorddiagram-function.html 

# 3. Palleton: www.palleton.com 
