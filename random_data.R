
n = 1000
k = 3

set.seed(123)


results = data.frame(
  Throw = seq(1:n)
)



for (i in 1:k) {
  column_name = paste("Dice", i, sep = "_")
  results[[column_name]] = sample(1:6, n, replace = TRUE)
}

