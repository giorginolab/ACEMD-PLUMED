# ACEMD+PLUMED2 example: dipeptide phi-psi free energy demo 


Toni Giorgino 2017

National Research Council of Italy



Requirements
------------

This demo relies on PLUMED 1. The easiest way to obtain it is to
install the plumed1 package in Acellera's conda channel, which
includes the required ACEMD-compatible version of PLUMED packaged as a
shared library. If you installed acemd via Conda, you may already have
it in your system.


Set-up
------

We assume that you have ACEMD and PLUMED installed and tested. The
file *libplumed1plugin.so* should be linked in your current directory,
or be copied in one of the directories explained by `acemd --command
pluginload'.  For example, issue this:

    ln -s `dirname \`which conda\``/../lib/libplumed1plugin.so .
    
Note that, even if the plugin is not found, the simulation will start 
nevertheless, and give wrong (unbiased) results!


Run the simulation
------------------

To launch the simulation, type

	shell>  acemd acemd_input

This will take several hours. 



Compute and plot the free-energy surface
----------------------------------------

Use the "sum_hills" program, part of the PLUMED distribution, to
compute the 2D free energy surface.

	shell>	sum_hills -ndim 2 -ndw 1 2 -pi 1 -pi 2 


The landscape can be plotted with gnuplot or other programs.

	shell>	gnuplot
	gnuplot>  plot "fes.dat" with image



Animations
----------

You can try "sum_hills" then "gnuplot" even while the simulation is
running. This allows you to see metadynamics in action, gradually
filling the free energy surface. 

The "reference/animate_fes_100k.avi" file shows an animation of what's
happening. There are 1000 animation frames taken at 10 ps
intervals. Between each frame and the next, 100 gaussians are
deposited. Observe how (at the beginning) the free energy basins are
alternatively filled.

Note that you will need a recent movie player application to display
the animation, which is encoded in the h264 format. VLC and mplayer
will do.


Remarks
-------

Note that the simulation will start even if the plugin is not found!

Consider that Plumed computes forces on the CPU, thus it will likely
slow down ACEMD. Also, keep into account that, by default (i.e., not
using GRID), the computation burden increases with each accumulated
hill.

Restarts are supported in PLUMED1, but they require special care to be
in sync with ACEMD's checkpoints. 




Acemd parameters (extract from acemd_input)
----------

```
  switchdist 		20
  cutoff 		22
  timestep 		1
  langevin            	on
  langevindamping     	1
  langevintemp        	300
  run	     		10000000
```


PLUMED parameters (extract from META_INP)
----------

```
  TORSION LIST 13 15 17 1 SIGMA 0.2
  TORSION LIST 15 17  1 3 SIGMA 0.2
  HILLS HEIGHT 0.1 W_STRIDE 100
  WELLTEMPERED SIMTEMP 300 BIASFACTOR 10
```


Total run length is 10 ns, or 100000 gaussians.
