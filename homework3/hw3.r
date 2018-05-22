#Ex1:  x_t = 0.5*eps_t-1 + eps_t

n = 100                               # Number of trajectories
m = 10000                             # Length (periods of time) for each trajectory
eps = matrix(rnorm(n*m,0,0.1),nrow=n) # The normal white noise WNN(0,0.1)
x = matrix(NA,n,m)                    # Transition matrix n x m
x0 = 10                               # Initial value of the processs x_t at t=0
for (j in (1:m))
{  
  x[1,j] = 0.5*x0 + eps[1,j]          # Generating x_t with t=1
  for (i in (2:n))
  {
    x[i,j] = 0.5*x[i-1,j] + eps[i,j] # Simulatiing transition x_t with t=2,...,n
  }
}

plot.ts(x[1,])
plot.ts(x[,1])

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

#Ex4: x_t = 0.5 + x_t-1 + eps_t 

n = 100
m = 10000
eps = matrix(rnorm(n*m,0,0.1),nrow=n)
x = matrix(NA,n,m)
x[1,1] = 1
for (j in (1:m))
{ 
  x[1,j] = 0.5 + x[1,1] + eps[1,j]
  for (i in (2:n))
  {
    x[i,j] = 0.5 + x[i-1,j] + eps[i,j]
  }
}

plot.ts(x[1,])
plot.ts(x[,1])
