Work in Progress
================

Device tree for LG Optimus F3 (Virgin Mobile)

Working CWM Recovery for the VM Optimus F3:

CWM Recovery 6.0.3.7

To setup build enviornment:

$ . build/envsetup.sh

$ lunch cm_fx3s-eng

To build cwm recovery:

$ . build/tools/device/makerecoveries.sh cm_fx3s-eng

To compile rom:

$ make clean && make clobber

$ . build/envsetup.sh

$ brunch cm_fx3s-eng
