
# phylo_silvereye_source.R
#
# This script provides the source code necessary to 
# check whether recorders are affecting egg laying 
# and make plots to this effect
# The functions below are very specific to this task and
# are very 'dirty'.
# 
# Copyright (c) Andrea Estandia, 2023, except where indicated
# Date Created: 2023-06-12


# --------------------------------------------------------------------------
# REQUIRES
# --------------------------------------------------------------------------

# List of packages to install and load
required_packages <- c(
  "tidyverse", "devtools", "janitor", "dplyr", "patchwork",
  "ggstance", "ape", "RcppCNPy", "gtools", "RColorBrewer",
  "R.utils", "viridis", "units", "scales"
)

# Check if each package is installed, and if not, install it
for (package in required_packages) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package, dependencies = TRUE)
  }
}

# Load the packages
for (package in required_packages) {
  library(package, character.only = TRUE)
}

# Now you can continue with your script using the loaded packages
suppressPackageStartupMessages({
  library(tidyverse)
  library(devtools)
  library(geosphere)
  library(sf)
  library(janitor)
  library(dplyr)
  library(patchwork)
  library(ggstance)
  library(ape)
  library(RcppCNPy)
  library(gtools)
  library(RColorBrewer)
  library(R.utils)
  library(viridis)
  library(units)
  library(scales)
})

'%!in%' <- function(x,y)!('%in%'(x,y))

# --------------------------------------------------------------------------
# PATHS
# --------------------------------------------------------------------------

data_path <- file.path(getwd(), "data")
reports_path <- file.path(getwd(), "reports")
figures_path <- file.path(getwd(), "reports", "plots")

if (!dir.exists(data_path)) {
  dir.create(data_path, recursive = TRUE)
}

if (!dir.exists(reports_path)) {
  dir.create(reports_path, recursive = TRUE)
}

if (!dir.exists(figures_path)) {
  dir.create(figures_path, recursive = TRUE)
}

text_size=11