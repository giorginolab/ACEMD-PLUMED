
Installation
------------

This demo relies on PLUMED 2. The easiest way to obtain it is to
install the corresponding packages through Acellera's conda channel,
which includes the required ACEMD-compatible version of PLUMED
packaged as a shared library. If you installed acemd via Conda, you
may already have it in your system.



Set-up
------

The files `libplumed1plugin.so` and/or `libplumed2plugin.so` should be
found in one of the directories indicated by `acemd
--command pluginload`.  This should be taken care by
the conda installer. If not, or you want to use custom builds, 
the following command set different paths:

    export ACEMD_PLUGIN_DIR=$(dirname "$(which conda)")/../lib



