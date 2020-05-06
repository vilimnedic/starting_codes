# Define packages
packages <- c(# Standard packages
              "tidyverse", "ggplot2", "dplyr",
              # Specific packages for task
              "foreign")

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