# http://gnuplot-surprising.blogspot.it/2012/04/new-version-of-gnuplot-makes-iterations.html

# plumed sum_hills --stride 100 --hills HILLS 

reset
set term gif animate
set output "animate.gif"
n=1000                         # n. frames
set cbrange [0:6]
do for [i=0:n]{
  fn=sprintf("fes_%d.dat",i)
  ng=sprintf("ΔG (kJ/mol), %.1f k gaussians",(i+1)/10.)
  plot fn w image title ng
}
set output

# ffmpeg -i animate.gif animate.mp4
