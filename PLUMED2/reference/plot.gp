# http://gnuplot-surprising.blogspot.it/2012/04/new-version-of-gnuplot-makes-iterations.html

# plumed sum_hills --stride 1000 --hills HILLS 

reset
set term gif animate
set output "animate.gif"
n=100 #n frames
do for [i=0:n]{
  fn=sprintf("fes_%d.dat",i)
  ng=sprintf("%d k gaussians",i+1)
  plot fn w image title ng
}
set output
