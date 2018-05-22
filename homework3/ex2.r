#Ex2: x_t = 10+0.1(x_t-1 -10) + 0.3(x_t-2 -10) + eps_t

n = 100
m = 10000
eps = matrix(rnorm(n*m,0,0.1),nrow=n)
x = matrix(NA,n,m)
x[1,1] = x[2,1] = 10
for (j in (1:m))
{  
  x[1,j] = 10 + 0.1*(x[1,1]-10) + 0.3*(x[1,1]-10)+eps[1,j]
  for (i in (3:n))
  {
    x[i,j] = 10 + 0.1*(x[i-1,j]-10) + 0.3*(x[i-2,j]-10)+eps[i,j]
  }
}

plot.ts(x[1,])
plot.ts(x[,1])