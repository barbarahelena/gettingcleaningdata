## Assignment getting & cleaning data course 
## Tidying Human Activity Recognition Using Smartphones Data Set
## 8th July 2020
## Barbara Verhaar

library('dplyr')
library('stringr')

## Opening data files. Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
dir <- 'data/'
testSet <- read.table(str_c(dir, 'test/X_test.txt'), header = FALSE)
testLabels <- read.table(str_c(dir, 'test/Y_test.txt'), header = FALSE)
testSubj <- read.table(str_c(dir, 'test/subject_test.txt'), header = FALSE)
trainSet <- read.table(str_c(dir, '/train/X_train.txt'), header = FALSE)
trainLabels <- read.table(str_c(dir, '/train/Y_train.txt'), header = FALSE)
trainSubj <- read.table(str_c(dir, 'train/subject_train.txt'), header = FALSE)
actLabels <- read.table(str_c(dir, 'activity_labels.txt'), header = FALSE)
features <- read.table(str_c(dir, 'features.txt'), header = FALSE)

## Preprocessing of data files (binding subject ids and labels); labeling data sets with var names from features file.
rewrite_labels <- function(x){a <- str_remove(x, pattern="[0-9]+[ ]+")
                              b <- str_replace_all(a, '-', '_')
                              return(b)} # Function to remove numbers and spaces and replace dashes by underscores
labs <- sapply(features[2], rewrite_labels) # Rename variable names from features file

test <- testSet %>% mutate_if(is.character, as.numeric)
str(test)
colnames(test) <- labs # Labeling variables with labels created above
test$lab <- testLabels$V1 # Labels for measurements from Y_test
test$id <- as.integer(testSubj$V1) # Subject ids from subject_test

train <- trainSet %>% mutate_if(is.character, as.numeric)
colnames(train) <- labs # Labeling variables with labels created above
train$lab <- trainLabels$V1 # Labels from Y_train
train$id <- as.integer(trainSubj$V1) # Subject ids from subject_train

## Merging (first checks, then rbind)
(testid <- unique(test$id)) # 2  4  9 10 12 13 18 20 24
(trainid <- unique(train$id)) # 1  3  5  6  7  8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30
all(!(testid %in% trainid)) # Check if there is no overlap in test subjects / train subjects
dim(train)
dim(test)
ncol(test)==ncol(train) # Check if no of columns is the same for test and train set -> TRUE

merge_df <- rbind(test, train) # Binding test and train set

## Replace activity labels with descriptive names (from activity_labels file)
act <- actLabels %>% select(n=V1, act=V2) %>% 
  mutate(n=as.integer(n), act=str_to_lower(str_replace(act, '_', ''))) # Tidying activity labels (lower case and removing _)
merge_df$activity <- ifelse(merge_df$lab %in% act$n, act$act[match(merge_df$lab, act$n)], NA) # Match labels with activity descriptions
any(is.na(testSet$act)) # Check if any row has a missing activity label -> FALSE

## Selecting variables with means or standard deviations
dataSet <- merge_df %>% 
  select(id, activity, contains('mean()') | contains('std'))
colnames(dataSet) <- str_remove_all(colnames(dataSet), '\\(\\)') # Remove all parentheses from var names

## Data set with the average of each variable for each activity and each subject.
averages <- dataSet %>%
  group_by(id, activity) %>% 
  select(contains('mean') | contains('std')) %>% 
  summarise_all(.funs = c(mean='mean'))

write.table(averages, file = 'averages.txt', row.names = FALSE) # write txt file to submit assignment
