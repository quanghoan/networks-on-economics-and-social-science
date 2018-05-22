#Ex3: x_t = x_t-1 + eps_t 

n = 100
m = 10000
eps = matrix(rnorm(n*m,0,0.1),nrow=n)
x = matrix(NA,n,m)
x[1,1] = 2
for (j in (1:m))
{ 
  x[1,j] = x[1,1] + eps[1,j]
  for (i in (2:n))
  {
    x[i,j] = x[i-1,j] + eps[i,j]
  }
}

plot.ts(x[1,])
plot.ts(x[,1])
