## Example code for packages
## packages <- c(# Standard packages
##               "tidyverse", "ggplot2", "dplyr",
##               # Specific packages for task
##               "foreign")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

# Debugging when packages fail to install
# Step 1: Look in the right repository
# setRepositories()
# setRepositories(ind = c(1:6, 8))
# Step 2: Package is not in the selected repositories
# ap <- available.packages()
# View(ap)
# "foobarbaz" %in% rownames(ap)
# Step 3: Look up the package in CRAN-mirror and see if you have wrong client
# library(installr)
# updateR()
# Cred: Richie Cotton @ 
# https://stackoverflow.com/questions/25721884/how-should-i-deal-with-package-xxx-is-not-available-for-r-version-x-y-z-wa 

# Detach packages
# detach("package:dplyr", unload = TRUE)

# Check if packages are loaded
# Solution A
# loaded_packages <- library()$results[, 1]
# "package_name" %in% tolower(loaded_packages)
# Solution B
# (.packages())
# "dplyr" %in% tolower((.packages()))
# Solution C
# And load it if it's not loaded yet
# if(! "dplyr" %in% tolower((.packages()))){
#   library("dplyr")
#   (.packages())
# }
# Cred: https://rpubs.com/Mentors_Ubiqum/list_packages
