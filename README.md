Work in Progress
================

Device tree for LG Optimus F3 (Virgin Mobile LS720 or VM720)

**Working CWM Recovery for the VM Optimus F3:** (CWM Recovery 6.0.3.7)

To setup build enviornment:
```
$ . build/envsetup.sh
$ lunch cm_fx3-eng
```
**To build cwm recovery:**
```
$ . build/tools/device/makerecoveries.sh cm_fx3-eng
```
**To compile rom:**
```
$ make clean
$ . build/envsetup.sh
$ brunch cm_fx3-eng
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

**Requirements**
```
$ cd ~/android/source
$ git clone https://github.com/hroark13/hardware_qcom_media-legacy.git -b master hardware/qcom/media-legacy
$ git clone https://github.com/hroark13/hardware_qcom_display-legacy.git -b master hardware/qcom/display-legacy
$ rm -rf hardware/qcom/media
$ rm -rf hardware/qcom/msm8960
$ git clone https://android.googlesource.com/platform/hardware/qcom/media hardware/qcom/media
$ git clone https://android.googlesource.com/platform/hardware/qcom/msm8960 hardware/qcom/msm8960
```
