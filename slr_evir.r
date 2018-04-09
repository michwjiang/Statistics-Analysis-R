
one <- c(1,1) 
xval <- c(1,2) 
yval <- c(2,5) 
X <- matrix(c(one,xval),nrow=2,ncol=2) 
Y <- matrix(c(yval),nrow=2,ncol=1)

solve(t(X) %*% X) %*% t(X) %*% Y 

one <- c(1,1,1) 
x1val <- c(1,4,3) 
x2val <- c(2,-1,1) 
yval <- c(9,3,9) 

X <- matrix(c(one,x1val,x2val),nrow=3,ncol=3) 
Y <- matrix(c(yval),nrow=3,ncol=1)

solve(t(X) %*% X) %*% t(X) %*% Y

one <- c(1,1,1) 

xval <- c(1,2,3) 

yval <- c(2,5,4) 

X <- matrix(c(one,xval),nrow=3,ncol=2) 

Y <- matrix(c(yval),nrow=3,ncol=1) 

solve(t(X) %*% X) %*% t(X) %*% Y

one <- c(1,1,1) 

xval <- c(1,2,3) 

yval <- c(2,5,4) 

X <- matrix(c(one,xval),nrow=3,ncol=2) 

Y <- matrix(c(yval),nrow=3,ncol=1) 

betahat = solve(t(X) %*% X) %*% t(X) %*% Y 
betahat

SSE = t(Y) %*% Y - t(betahat) %*% t(X) %*% Y 
SSE

x <- c(3,5,7,9) 
y <- c(17,23,41,50) 

t_line = lm(y ~ x) 
t_line


coeffs = coefficients(t_line)
b0 = coeffs[1] 
b1 = coeffs[2] 
yhat = b1 * x + b0
sum((y-yhat)^2)

tsum = sum((y-mean(y))^2)
tsum

n = length(x)
df = n - 2
se = sqrt(sum((y-yhat)^2)/df)
se

tsum = sum((x-mean(x))^2)
tsum 

clevel=.95
atl = clevel + (1 - clevel)/2 
t = qt(atl,df)
t

lb = b1 - t * se/sqrt(tsum) 
ub = b1 + t * se/sqrt(tsum) 
lb 
ub

library(evir)
data(danish)
length(danish)


emplot(danish) 


emplot(danish, alog="xy")


meplot(danish, omit=5)


meplot(bmw, omit=5)

meplot(siemens, omit=5)

tp <- tailplot(gpdfittedparameters)
gpd.q(tp, pp = 0.999, ci.p = 0.95)

tp <- tailplot(gpdfittedparameters)
gpd.q(tp, pp = 0.99)
gpd.sfall(tp, 0.99)
