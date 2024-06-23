# Red Wine Quality Analysis

This project analyzes the quality of red wine using various machine learning models, including linear regression, polynomial regression, decision trees, and random forests. The analysis uses the red wine quality dataset, exploring relationships between chemical properties and wine quality ratings.

## Introduction

The goal of this project is to predict the quality of red wine based on its chemical properties. The dataset used for this project is the "Wine Quality" dataset, which contains various physicochemical properties of red wine along with quality ratings.

## Prerequisites

- R (version 4.0 or later)
- Various R packages including:
  - tidyverse
  - caret
  - rpart
  - randomForest
  - ggplot2
  - corrplot

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/red-wine-quality-analysis.git
cd red-wine-quality-analysis
```
2. Ensure you have R installed on your system.
   
3. Install the required R packages:
```R
install.packages(c("tidyverse", "caret", "rpart", "rpart.plot", "randomForest", "ggcorrplot", "corrplot", "ppcor", "splines", "devtools", "Hmisc", "rms", "EFAtools", "rlang", "ggplot2", "gtable"))
```
4. Place the "winequality-red.csv" dataset in the appropriate directory.

## Usage
Run the R script in your preferred R environment (e.g., RStudio). The script will:

  1) Load and preprocess the data
  2) Perform exploratory data analysis with visualizations
  3) Conduct correlation analysis
  4) Build and evaluate multiple regression models
  5) Create and analyze decision trees
  6) Implement random forest models

## Data
The dataset used is "winequality-red.csv", which contains various chemical properties of red wines and their quality ratings.
## Results
The script outputs various plots, correlation matrices, and model summaries. It compares the performance of different models in predicting wine quality.
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
