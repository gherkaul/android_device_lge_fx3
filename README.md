Work in Progress
================

Device tree for LG Optimus F3 (Virgin Mobile)

**Working CWM Recovery for the VM Optimus F3:**
CWM Recovery 6.0.3.7

To setup build enviornment:
```
$ . build/envsetup.sh
$ lunch cm_fx3s-eng
```
**To build cwm recovery:**
```
$ . build/tools/device/makerecoveries.sh cm_fx3s-eng
```
**To compile rom:**
```
$ make clean
$ . build/envsetup.sh
$ brunch cm_fx3s-eng
```


**Current ~/.bashrc setup:**
```
export PATH=~/bin:$PATH
export USE_CCACHE=1

# Android Toolchain
export ARCH=arm
export CCOMPILE=$CROSS_COMPILE
export CROSS_COMPILE=arm-eabi-
export PATH=$PATH:~/android/source/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin
```

