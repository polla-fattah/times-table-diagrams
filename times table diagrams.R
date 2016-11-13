# Change these parameters at will
R <- 50 # Radius 
N <- 200 # Number of points or the modulus
M <- 100 # maximum multiplier
S <- 1 # multiplier steps

#create the circle 
points <- 0:(N - 1)
points.x <- -R * cos(points * 2 * pi / N)
points.y <-  R * sin(points * 2 * pi / N)

# generate segments for each circle 
#  each multiplier will be saved in a png file
for(m in seq(2, M, S)){
  print(m)
  png(paste0(m,'.png'),width = 800, height = 840)
  plot(points.x, points.y, col=floor(m), 
       pch = '.', xlab = '', ylab = '', 
       xaxt='n', yaxt='n', ann=FALSE)

  for(i in (points+1)){
    j <- floor(m * i) %% N
    segments(x0=points.x[i+1], y0=points.y[i+1], 
             x1=points.x[j+1], y1 =points.y[j+1], col=floor(m))
  }
  dev.off()
}
