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

# Detach packages
# detach("package:dplyr", unload = TRUE)
