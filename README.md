METADYNAMICS ON ALANINE DIPEPTIDE: PHI-PSI FREE ENERGY DEMO
===========================================================

Toni Giorgino 2017

National Research Council of Italy


This is a test case reproducing the phi-psi alanine dipeptide free
energy plot shown e.g. in references [1] via ACEMD [3] and PLUMED 1 [2]
or PLUMED 2 [4]. See the directions in the respective directories.

For information, tutorial and documentation about PLUMED see
http://www.plumed.org/.


Methods
-------

This demo computes the phi-psi free energy landscape of the alanine
dipeptide via well-tempered metadynamics [1]. The dipeptide is
modelled in vacuo with the CHARMM forcefield.  The total length of the
run is 10 ns, simulated with a timestep of 1 fs. There are 100,000
gaussians in total, deposited at a rate of 1 every 100 fs.


Remarks
-------

Note that the simulation will start even if the plugin is not found!

Consider that Plumed computes forces on the CPU, thus it will likely
slow down ACEMD. Also, keep into account that, by default (i.e., not
using GRID), the computation burden increases with each accumulated
hill.

Restarts are supported in PLUMED1, but they require special care to be
in sync with ACEMD's checkpoints. 



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



