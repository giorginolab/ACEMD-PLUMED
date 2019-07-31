default: test fes.dat

test:
	acemd acemd_input

fes.dat:
	plumed sum_hills --hills HILLS

clean:
	rm bck.* HILLS colvar fes.dat
