library(ggplot2)
library(tidyverse)
library(readr)
library(dplyr)

#gets coordinates for map from ggplot2
World_Map <- map_data ("world") 

#reads HALE data from WHO csv file
HALE_Data <- read.csv("~/INFO-526-ekladd-Final-Project/HALE_Data.csv") 

#makes HALE Data more readable for Demo
Filtered_HALE <- HALE_Data %>%
  filter(Indicator== "Healthy life expectancy (HALE) at birth (years)" & IsLatestYear== "true" & Dim1ValueCode== "SEX_BTSX")
Small_HALE <- Filtered_HALE %>%
  select(Location, FactValueNumeric)

#renames the Country Name column from Location to region to match map data for join
Rename_HALE <- Small_HALE %>%
  rename(region = Location)

Filtered_Test <- Rename_HALE %>%
  filter(region== "Afghanistan")

Joined_Map_Data <- left_join(World_Map, Rename_HALE, by = "region")
