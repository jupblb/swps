library(dplyr)
library(haven)
prokrastynacja <- read_sav("prokrastynacja.sav")
View(prokrastynacja)

prokrastynacja2 = prokrastynacja %>%
  select(SC15, SC16, SC17, SC18, SC19, SC20, SC21, SC22, SC23, SC24, SC25, SC26, SC27, SC28, SC29, SC30, SC31, SC32)

# https://nbviewer.org/github/lmcinnes/hdbscan/blob/master/notebooks/Comparing%20Clustering%20Algorithms.ipynb
# https://nbviewer.org/github/lmcinnes/hdbscan/blob/master/notebooks/How%20HDBSCAN%20Works.ipynb

# 1. k-means
# We have to assume data follows eucliedan space to some degree

library(cluster)
## NbClust
## https://www.rdocumentation.org/packages/NbClust/versions/3.0.1/topics/NbClust
library(NbClust)
nb = NbClust(prokrastynacja2, max.nc=30, method="kmeans")
# *** : The Hubert index is a graphical method of determining the number of clusters.
#                 In the plot of Hubert index, we seek a significant knee that corresponds to a 
#                 significant increase of the value of the measure i.e the significant peak in Hubert
#                 index second differences plot. 
#  
# *** : The D index is a graphical method of determining the number of clusters. 
#                 In the plot of D index, we seek a significant knee (the significant peak in Dindex
#                 second differences plot) that corresponds to a significant increase of the value of
#                 the measure. 
#  
# ******************************************************************* 
# * Among all indices:                                                
# * 8 proposed 2 as the best number of clusters 
# * 8 proposed 3 as the best number of clusters 
# * 2 proposed 4 as the best number of clusters 
# * 1 proposed 18 as the best number of clusters 
# * 1 proposed 26 as the best number of clusters 
# * 2 proposed 29 as the best number of clusters 
# * 1 proposed 30 as the best number of clusters 
# 
#                    ***** Conclusion *****                            
#  
# * According to the majority rule, the best number of clusters is  2 
#  
#  
# *******************************************************************
k = kmeans(prokrastynacja2, 2)
prokrastynacja2_kmeans = prokrastynacja2 %>% mutate(cluster = k$cluster)
k1 = prokrastynacja2_kmeans %>% filter(cluster == 1)
k2 = prokrastynacja2_kmeans %>% filter(cluster == 2)
sk = silhouette(k$cluster, dist(prokrastynacja2))


# 2. HDBSCAN https://towardsdatascience.com/a-gentle-introduction-to-hdbscan-and-density-based-clustering-5fd79329c1e8
library(dbscan)
h = hdbscan(prokrastynacja2, 5, verbose = TRUE)
# HDBSCAN clustering for 629 objects.
# Parameters: minPts = 5
# The clustering contains 2 cluster(s) and 442 noise points.
# 
#   0   1   2 
# 442  92  95 
prokrastynacja2_hdbscan = prokrastynacja2 %>% mutate(cluster = h$cluster)
sh = silhouette(h$cluster, dist(prokrastynacja2))
