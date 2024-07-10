
n = 10000
k = 3

set.seed(123)


results = data.frame(
  Throw = seq(1:n)
)


# Generating results of rolling symmetrical dices 

for (i in 1:k) {
  column_name = paste("Dice", i, sep = "_")
  results[[column_name]] = sample(1:6, n, replace = TRUE)
}


# Generating results of rolling asymmetric dices 

for (i in 1:k) {
  column_name = paste("Dice", i, sep = "_")
  if(i == 2){
    results[[column_name]] = sample(1:6, n, replace = TRUE, prob = c(0.16, 0.2, rep(0.16, 4)))
  }
  else if(i == 3){
    probabilities = c(rep(c(10,11), 3))
    probabilities = probabilities / sum(probabilities)
    results[[column_name]] = sample(1:6, n, replace = TRUE, prob = probabilities)
  }
  else{
    results[[column_name]] = sample(1:6, n, replace = TRUE)
  }
  
}



# Results

par(mfrow = c(k, 1))
for (i in 1:k) {
  column_name = paste("Dice", i, sep = "_")
  hist(results[[column_name]], main = paste("Histogram -", column_name), 
       xlab = "Wynik", ylab = "Częstotliwość", breaks = seq(0.5, 6.5, by = 1), 
       col = "lightblue", xlim = c(0.5, 6.5), xaxt = 'n')
  axis(1, at = 1:6)
}