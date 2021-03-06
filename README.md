Running biased simulations with PLUMED and ACEMD
=======================

Toni Giorgino, 2019

National Research Council of Italy


This is a test case reproducing the phi-psi alanine dipeptide free
energy plot shown e.g. in [1] via a metadynamics-biased simulation.
We use [ACEMD](https://www.htmd.org/docs/latest/acemd.html). [3]
The current version, ACEMD3, supports PLUMED 2 [4]. Input files are
provided in the corresponding subdirectories of this repository.

For information, tutorial and documentation about PLUMED see
http://www.plumed.org/.


Methods
-------

This demo computes the phi-psi free energy landscape of the alanine
dipeptide via well-tempered metadynamics [1]. The dipeptide is
modelled in vacuo with the CHARMM forcefield.  The total length of the
run is 10 ns, simulated with a timestep of 1 fs. There are 100,000
gaussians in total, deposited at a rate of 1 every 100 fs.


Installation
------------

This demo relies on PLUMED 2 and ACEMD3 version >=3.3.0. 
The easiest way to obtain them is to
install the corresponding packages through Acellera's conda channel,
which includes the required ACEMD-compatible version of PLUMED
packaged as a shared library. If you installed acemd via Conda, you
may already have it in your system.




Reconstruction of the free energy landscape
--------------------------

Reconstruction of the free energy landscape occurs post-processing the
HILLS files via the `sum_hills` utility. For PLUMED 1 it is a separate
utility, while for PLUMED 2 it is invoked via `plumed sum_hills`. So,

    shell> plumed sum_hills --hills HILLS   # PLUMED2

generates a `fes.dat` file which can be plotted as follows:

    gnuplot> plot 'fes.dat' with image
	

Notes:

 * You can try "sum_hills" then "gnuplot" even while the simulation is
   running. This allows you to see metadynamics in action, gradually
   filling the free energy surface.
 * The animation files in the reference directories show an
   illustration of what's happening. There are 1000 animation frames
   taken at 10 ps intervals. Between each frame and the next, 100
   gaussians are deposited. Observe how (at the beginning) the free
   energy basins are alternatively filled.



Metadynamics parameters
-----------------------

These are set in `META_INP` or `plumed.dat`, respectively. (The files
can be renamed; here we used the "traditional" names.)

 * CV1: Torsion between atoms 13 15 17 1
 * CV2: Torsion between atoms 15 17 1  3
 * Hill width 0.2 Å on both CVs
 * Hill height 0.1 kcal/mol/rad², deposition rate 1/100 fs  (10 per ps)
 * Well-tempered metadynamics at T=300°K and bias factor 10.
 
 









References
----------

[1] A Laio and F L Gervasio. Metadynamics: a method to simulate rare
events and reconstruct the free energy in biophysics, chemistry and
material science. Rep. Prog. Phys. 71 (2008)
doi:10.1088/0034-4885/71/12/126601

[2] M Bonomi et al, PLUMED: a portable plugin for free-energy
calculations with molecular dynamics. arXiv:0902.0874v3

[3] M. Harvey, G. Giupponi and G. De Fabritiis, ACEMD: Accelerated
molecular dynamics simulations in the microseconds timescale,
J. Chem. Theory and Comput. 5, 1632 (2009).

[4] Gareth A. Tribello, Massimiliano Bonomi, Davide Branduardi, Carlo
Camilloni, Giovanni Bussi, PLUMED 2: New feathers for an old bird,
Computer Physics Communications, Volume 185, Issue 2, 2014, Pages
604-613, ISSN 0010-4655, http://dx.doi.org/10.1016/j.cpc.2013.09.018.



