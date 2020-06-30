default: run fes.dat

run:
	acemd3 acemd_input

fes.dat:
	plumed sum_hills --hills HILLS

fes.png: fes.dat
	gnuplot fes.gp


clean:
	-rm bck.* restart.* HILLS colvar fes.dat plumed.log output.*

