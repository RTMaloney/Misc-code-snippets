
# This script demonstrates how to safely install R packages (on a new install) in order to prevent there being a conflict with MS OneDrive 
# as it tries to sync temp folders made in an R session.

# By carefully loading all packages (with dependencies) and specifying where to unpack the libraries as well as where to direct it 
# to send the .zip downloads (it makes a temp folder), you should be able to safely install the packages so that their libraries can 
# be accessed without causing issues.

# If you are using R project files, it also might help to go to the OneDrive settings and remove the .Rproj.user file from the sync list.
# Regular scripts should run afterwards, they just might be a bit slower as OneDrive furiously starts to autosync all the temp files that 
# are generated in an R session to the cloud.

# R Maloney, 11/12/20

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# List packages to install ------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# See here for inputs to install.packages():
# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/install.packages

# Define list of package names to install:
pkgs <- c("knitr", "dplyr", "ggplot2", "markdown", "rmarkdown", "tidyverse", "readxl", "here", "flextable", "officedown", "ggrepel", "funnelR",
          "officer", "lubridate", "sjPlot", "sjmisc", "sjlabelled", "FunnelPlotR", "ggpubr", "skimr", "haven", "psych", "rlang", 
          "lubridate", "DescTools", "openxlsx", "viridis")

# To remove, use:
#remove.packages(pkgs)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Install the packages ----------------------------------------------------
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# lib: 
    # character vector giving the library directories where to install the packages. 
    # We will use C:\Program Files\R\R-4.0.3\library, which is where libraries that come with the basic R installation are kept.
# destdir: 
    # "directory where downloaded packages are stored. If it is NULL (the default) a subdirectory 'downloaded_packages' 
    # of the session temporary directory will be used (and the files will be deleted at the end of the session)." 
    # >> this seems to be where the .zip folders from the CRAN repository are placed. Then (I think) they are unpacked to
    # 'lib' when installed. Either way; we'll use a folder 'packages' placed in the C drive R program files dir: 'C:\Program Files\R\packages'
# dependencies:
    # logical indicating whether to also install uninstalled packages which these packages depend on/link to/import/suggest (and so on recursively).

# Install the packages according to settings described above (may take some time). Include verbose outputs.
install.packages(pkgs = pkgs,
                 lib  = "C:/Program Files/R/R-4.0.3/library",
                 destdir = "C:/Program Files/R/packages",
                 dependencies = TRUE,
                 verbose = TRUE)

