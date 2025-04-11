# Adapted from: https://github.com/dmlc/xgboost/blob/master/R-package/vignettes/xgboostPresentation.Rmd
# Updated for XGBoost 3.0.0 based on Jiaming's feedback: https://github.com/conda-forge/xgboost-feedstock/issues/221#issuecomment-2760552625

require(xgboost)
data(agaricus.train, package = "xgboost")
data(agaricus.test, package = "xgboost")
train <- agaricus.train
test <- agaricus.test
str(train)
dim(train$data)
dim(test$data)
class(train$data)[1]
class(train$label)

bst_sparse <- xgboost(
  x = train$data, y = as.factor(train$label),
  max_depth = 2,
  learning_rate = 1.0,
  nthread = 2,
  nrounds = 2,
  objective = "binary:logistic"
)
bst_dense <- xgboost(
  x = as.matrix(train$data), y = as.factor(train$label),
  max_depth = 2,
  learning_rate = 1,
  nthread = 2,
  nrounds = 2,
  objective = "binary:logistic"
)

dtrain <- xgb.DMatrix(data = train$data, label = train$label)
bst_dmatrix <- xgb.train(
  params = xgb.params(
    max_depth = 2, learning_rate = 1, nthread = 2, objective = "binary:logistic"
  ),
  data = dtrain,
  nrounds = 2
)

pred <- predict(bst_sparse, test$data)
print(length(pred))
print(head(pred))

prediction <- as.numeric(pred > 0.5)
print(head(prediction))
err0 <- mean(as.numeric(pred > 0.5) != test$label)
print(paste("test-error=", err0))

dtrain <- xgb.DMatrix(data = train$data, label = train$label)
dtest <- xgb.DMatrix(data = test$data, label = test$label)
evals <- list(train = dtrain, test = dtest)
bst <- xgb.train(
  params = xgb.params(
    max_depth = 2, learning_rate = 1, nthread = 2, objective = "binary:logistic"
  ),
  nrounds = 2,
  evals = evals,
  data = dtrain
)


pred <- predict(bst, test$data)
print(length(pred))
print(head(pred))

prediction <- as.numeric(pred > 0.5)
print(head(prediction))
err1 <- mean(as.numeric(pred > 0.5) != test$label)
print(paste("test-error=", err1))

if (abs((err0 - err1)) > 1e-5) {
  stop()
}
