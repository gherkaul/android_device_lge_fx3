#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/fx3/fx3-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/fx3/overlay

CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase.ms=$(CDMA_GOOGLE_BASE) \
    ro.com.google.clientidbase.am=$(CDMA_GOOGLE_BASE) \
    ro.com.google.clientidbase.yt=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

LOCAL_PATH := device/lge/fx3
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.fx3.rc \
    init.fx3s.rc \
    init.lge.early.rc \
    init.lge.rc \
    init.lge.usb.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    lgdms.fota.rc \
    lgdms.fota_update.rc \
    ueventd.fx3s.rc \
    ueventd.qcom.rc
    
# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:/root/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/init.fx3.rc:/root/init.fx3.rc \
    $(LOCAL_PATH)/rootdir/etc/init.fx3s.rc:/root/init.fx3s.rc \
    $(LOCAL_PATH)/rootdir/etc/init.lge.early.rc:/root/init.lge.early.rc \
    $(LOCAL_PATH)/rootdir/etc/init.lge.rc:/root/init.lge.rc \
    $(LOCAL_PATH)/rootdir/etc/init.lge.usb.rc:/root/init.lge.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:/root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:/root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/lgdms.fota.rc:/root/lgdms.fota.rc \
    $(LOCAL_PATH)/rootdir/etc/lgdms.fota_update.rc:/root/lgdms.fota_update.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.fx3s.rc:/root/ueventd.fx3s.rc \
    $(LOCAL_PATH)/rootdir/etc/ueventd.qcom.rc:/root/ueventd.qcom.rc

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/configs/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh

# QC thermald config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald-8064.conf:system/etc/thermald-8064.conf \
    $(LOCAL_PATH)/configs/thermald-8930.conf:system/etc/thermald-8930.conf \
    $(LOCAL_PATH)/configs/thermald-8930-empty.conf:system/etc/thermald-8930-empty.conf \
    $(LOCAL_PATH)/configs/thermald-8960.conf:system/etc/thermald-8960.conf \
    $(LOCAL_PATH)/configs/thermald-8960ab.conf:system/etc/thermald-8960ab.conf

PRODUCT_PACKAGES += \
    libnetcmdiface

# Wifi config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/p2p_supplicant.conf:/system/etc/wifi/p2p_supplicant.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf
    
# Audio config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/dsp/snd_soc_msm/snd_soc_msm_Sitar:system/etc/snd_soc_msm/snd_soc_msm_Sitar

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml
    
# bin
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/bin/ATFWD-daemon:/system/bin/ATFWD-daemon \
    device/lge/fx3/prebuilt/system/bin/atd:/system/bin/atd \
    device/lge/fx3/prebuilt/system/bin/bridgemgrd:/system/bin/bridgemgrd \
    device/lge/fx3/prebuilt/system/bin/cnd:/system/bin/cnd \
    device/lge/fx3/prebuilt/system/bin/ds_fmc_appd:/system/bin/ds_fmc_appd \
    device/lge/fx3/prebuilt/system/bin/e2fsck:/system/bin/e2fsck \
    device/lge/fx3/prebuilt/system/bin/hostapd:/system/bin/hostapd \
    device/lge/fx3/prebuilt/system/bin/mm-adec-omxaac-test:/system/bin/mm-adec-omxaac-test \
    device/lge/fx3/prebuilt/system/bin/mm-aenc-omxaac-test:/system/bin/mm-aenc-omxaac-test \
    device/lge/fx3/prebuilt/system/bin/mm-aenc-omxamr-test:/system/bin/mm-aenc-omxamr-test \
    device/lge/fx3/prebuilt/system/bin/mm-aenc-omxevrc-test:/system/bin/mm-aenc-omxevrc-test \
    device/lge/fx3/prebuilt/system/bin/mm-aenc-omxqcelp13-test:/system/bin/mm-aenc-omxqcelp13-test \
    device/lge/fx3/prebuilt/system/bin/mm-gs-camctrl-test:/system/bin/mm-gs-camctrl-test \
    device/lge/fx3/prebuilt/system/bin/mm-jpeg-dec-test:/system/bin/mm-jpeg-dec-test \
    device/lge/fx3/prebuilt/system/bin/mm-jpeg-dec-test-client:/system/bin/mm-jpeg-dec-test-client \
    device/lge/fx3/prebuilt/system/bin/mm-jpeg-enc-test:/system/bin/mm-jpeg-enc-test \
    device/lge/fx3/prebuilt/system/binmm-jpeg-enc-test-client:/system/bin/mm-jpeg-enc-test-client \
    device/lge/fx3/prebuilt/system/bin/mm-jps-enc-test:/system/bin/mm-jps-enc-test \
    device/lge/fx3/prebuilt/system/bin/mm-mpo-dec-test:/system/bin/mm-mpo-dec-test \
    device/lge/fx3/prebuilt/system/bin/mm-mpo-enc-test:/system/bin/mm-mpo-enc-test \
    device/lge/fx3/prebuilt/system/bin/mm-pp-daemon:/system/bin/mm-pp-daemon \
    device/lge/fx3/prebuilt/system/bin/mm-qcamera-daemon:/system/bin/mm-qcamera-daemon \
    device/lge/fx3/prebuilt/system/bin/mm-qcamera-test:/system/bin/mm-qcamera-test \
    device/lge/fx3/prebuilt/system/bin/mm-qcamera-testsuite-client:/system/bin/mm-qcamera-testsuite-client \
    device/lge/fx3/prebuilt/system/bin/mm-vdec-omx-test:/system/bin/mm-vdec-omx-test \
    device/lge/fx3/prebuilt/system/bin/mm-venc-omx-test720p:/system/bin/mm-venc-omx-test720p \
    device/lge/fx3/prebuilt/system/bin/mm-video-driver-test:/system/bin/mm-video-driver-test \
    device/lge/fx3/prebuilt/system/bin/mm-video-encdrv-test:/system/bin/mm-video-encdrv-test \
    device/lge/fx3/prebuilt/system/bin/mpdecision:/system/bin/mpdecision \
    device/lge/fx3/prebuilt/system/bin/netmgrd:/system/bin/netmgrd \
    device/lge/fx3/prebuilt/system/bin/nl_listener:/system/bin/nl_listener \
    device/lge/fx3/prebuilt/system/bin/port-bridge:/system/bin/port-bridge \
    device/lge/fx3/prebuilt/system/bin/qmiproxy:/system/bin/qmiproxy \
    device/lge/fx3/prebuilt/system/bin/qmuxd:/system/bin/qmuxd \
    device/lge/fx3/prebuilt/system/bin/qseecomd:/system/bin/qseecomd \
    device/lge/fx3/prebuilt/system/bin/radish:/system/bin/radish \
    device/lge/fx3/prebuilt/system/bin/rild:/system/bin/rild \
    device/lge/fx3/prebuilt/system/bin/rmt_storage:/system/bin/rmt_storage \
    device/lge/fx3/prebuilt/system/bin/sensors.qcom:/system/bin/sensors.qcom \
    device/lge/fx3/prebuilt/system/bin/thermald:/system/bin/thermald \
    device/lge/fx3/prebuilt/system/bin/time_daemon:/system/bin/time_daemon \
    device/lge/fx3/prebuilt/system/bin/usbhub:/system/bin/usbhub \
    device/lge/fx3/prebuilt/system/bin/usbhub_init:/system/bin/usbhub_init \
    device/lge/fx3/prebuilt/system/bin/v4l2-qcamera-app:/system/bin/v4l2-qcamera-app
    
# etc/firmware
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/etc/firmware/a225_pfp.fw:/system/etc/firmware/a225_pfp.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a225_pm4.fw:/system/etc/firmware/a225_pm4.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a225p5_pm4.fw:/system/etc/firmware/a225p5_pm4.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a300_pfp.fw:/system/etc/firmware/a300_pfp.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a300_pm4.fw:/system/etc/firmware/a300_pm4.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/cyttsp_8064_mtp.hex:/system/etc/firmware/cyttsp_8064_mtp.hex \
    device/lge/fx3/prebuilt/system/etc/firmware/cyttsp_8960_cdp.hex:/system/etc/firmware/cyttsp_8960_cdp.hex \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd.bin:/system/etc/firmware/fw_bcmdhd.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd_apsta.bin:/system/etc/firmware/fw_bcmdhd_apsta.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd_mfg.bin:/system/etc/firmware/fw_bcmdhd_mfg.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd_p2p.bin:/system/etc/firmware/fw_bcmdhd_p2p.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/leia_pfp_470.fw:/system/etc/firmware/leia_pfp_470.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/leia_pm4_470.fw:/system/etc/firmware/leia_pm4_470.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc.b00:/system/etc/firmware/vidc.b00 \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc.b01:/system/etc/firmware/vidc.b01 \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc.b02:/system/etc/firmware/vidc.b02 \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc.b03:/system/etc/firmware/vidc.b03 \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc.mdt:/system/etc/firmware/vidc.mdt \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc_1080p.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/vidcfw.elf:/system/etc/firmware/vidcfw.elf
    
# etc/snd_soc_msm
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3_auxpcm:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3_auxpcm \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_2x_auxpcm:/system/etc/snd_soc_msm/snd_soc_msm_2x_auxpcm \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_Sitar:/system/etc/snd_soc_msm/snd_soc_msm_Sitar \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_Sitar_auxpcm:/system/etc/snd_soc_msm/snd_soc_msm_Sitar_auxpcm \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_Taiko:/system/etc/snd_soc_msm/snd_soc_msm_Taiko \
    device/lge/fx3/prebuilt/system/etc/snd_soc_msm/snd_soc_msm_auxpcm:/system/etc/snd_soc_msm/snd_soc_msm_auxpcm
    
# etc/wifi
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/etc/wifi/FTM_PowerTable.XML:/system/etc/wifi/FTM_PowerTable.XML \
    device/lge/fx3/prebuilt/system/etc/wifi/bcmdhd.cal:/system/etc/wifi/bcmdhd.cal
    
# etc
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/etc/OperatorPolicy.xml:/system/etc/OperatorPolicy.xml \
    device/lge/fx3/prebuilt/system/etc/UserPolicy.xml:/system/etc/UserPolicy.xml \
    device/lge/fx3/prebuilt/system/etc/apns-conf.xml:/system/etc/apns-conf.xml \
    device/lge/fx3/prebuilt/system/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    device/lge/fx3/prebuilt/system/init.goldfish.sh/AAA:/system/etc/init.goldfish.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.audio.sh:/system/etc/init.qcom.audio.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.efs.sync.sh:/system/etc/init.qcom.efs.sync.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.mdm_links.sh:/system/etc/init.qcom.mdm_links.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.modem_links.sh:/system/etc/init.qcom.modem_links.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.post_fs.sh:/system/etc/init.qcom.post_fs.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.thermald_conf.sh:/system/etc/init.qcom.thermald_conf.sh \
    device/lge/fx3/prebuilt/system/etc/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh \
    device/lge/fx3/prebuilt/system/etc/install-recovery.sh:/system/etc/install-recovery.sh \
    device/lge/fx3/prebuilt/system/etc/last_kmsg_backup.sh:/system/etc/last_kmsg_backup.sh \
    device/lge/fx3/prebuilt/system/etc/logging_android.sh:/system/etc/logging_android.sh \
    device/lge/fx3/prebuilt/system/etc/logging_android_apart.sh:/system/etc/logging_android_apart.sh \
    device/lge/fx3/prebuilt/system/etc/logging_kernel.sh:/system/etc/logging_kernel.sh \
    device/lge/fx3/prebuilt/system/etc/logging_kernel_apart.sh:/system/etc/logging_kernel_apart.sh \
    device/lge/fx3/prebuilt/system/etc/logging_prepare.sh:/system/etc/logging_prepare.sh \
    device/lge/fx3/prebuilt/system/etc/make_packet_log.sh:/system/etc/make_packet_log.sh \
    device/lge/fx3/prebuilt/system/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    device/lge/fx3/prebuilt/system/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    device/lge/fx3/prebuilt/system/etc/nfcee_access.xml:/system/etc/nfcee_access.xml \
    device/lge/fx3/prebuilt/system/etc/thermald-8064.conf:/system/etc/thermald-8064.conf \
    device/lge/fx3/prebuilt/system/etc/thermald-8930-empty.conf:/system/etc/thermald-8930-empty.conf \
    device/lge/fx3/prebuilt/system/etc/thermald-8930.conf:/system/etc/thermald-8930.conf \
    device/lge/fx3/prebuilt/system/etc/thermald-8960.conf:/system/etc/thermald-8960.conf \
    device/lge/fx3/prebuilt/system/etc/thermald-8960ab.conf:/system/etc/thermald-8960ab.conf \
    device/lge/fx3/prebuilt/system/etc/vold.fstab:/system/etc/vold.fstab
    
# lib/egl
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/lib/egl/egl.cfg:/system/lib/egl/egl.cfg \
    device/lge/fx3/prebuilt/system/lib/egl/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/lge/fx3/prebuilt/system/lib/egl/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/lge/fx3/prebuilt/system/lib/egl/libGLES_android.so:/system/lib/egl/libGLES_android.so \
    device/lge/fx3/prebuilt/system/lib/egl/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/lge/fx3/prebuilt/system/lib/egl/libGLESv2S3D_adreno200.so:/system/lib/egl/libGLESv2S3D_adreno200.so \
    device/lge/fx3/prebuilt/system/lib/egl/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/lge/fx3/prebuilt/system/lib/egl/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so
    
# lib/hw
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/lib/hw/camera.msm8960.so:/system/lib/hw/camera.msm8960.so \
    device/lge/fx3/prebuilt/system/lib/hw/gps.default.so:/system/lib/hw/gps.default.so \
    device/lge/fx3/prebuilt/system/lib/hw/lights.msm8960.so:/system/lib/hw/lights.msm8960.so
    
# lib
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/lib/libC2D2.so:/system/lib/libC2D2.so \
    device/lge/fx3/prebuilt/system/lib/libCommandSvc.so:/system/lib/libCommandSvc.so \
    device/lge/fx3/prebuilt/system/lib/libDivxDrm.so:/system/lib/libDivxDrm.so \
    device/lge/fx3/prebuilt/system/lib/libI420colorconvert.so:/system/lib/libI420colorconvert.so \
    device/lge/fx3/prebuilt/system/lib/libOlaLGECameraJNI_3b.so:/system/lib/libOlaLGECameraJNI_3b.so \
    device/lge/fx3/prebuilt/system/lib/libOmxAacDec.so:/system/lib/libOmxAacDec.so \
    device/lge/fx3/prebuilt/system/lib/libOmxVdec.so:/system/lib/libOmxVdec.so \
    device/lge/fx3/prebuilt/system/lib/libOmxWmaDec.so:/system/lib/libOmxWmaDec.so \
    device/lge/fx3/prebuilt/system/lib/libOpenCL.so:/system/lib/libOpenCL.so \
    device/lge/fx3/prebuilt/system/lib/libOpenVG.so:/system/lib/libOpenVG.so \
    device/lge/fx3/prebuilt/system/lib/libQSEEComAPI.so:/system/lib/libQSEEComAPI.so \
    device/lge/fx3/prebuilt/system/lib/libacdbloader.so:/system/lib/libacdbloader.so \
    device/lge/fx3/prebuilt/system/lib/libaudcal.so:/system/lib/libaudcal.so \
    device/lge/fx3/prebuilt/system/lib/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/lge/fx3/prebuilt/system/lib/libc2d2_z180.so:/system/lib/libc2d2_z180.so \
    device/lge/fx3/prebuilt/system/lib/libcamera_client.so:/system/lib/libcamera_client.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx074_default_video.so:/system/lib/libchromatix_imx074_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx074_preview.so:/system/lib/libchromatix_imx074_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx074_video_hd.so:/system/lib/libchromatix_imx074_video_hd.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx074_zsl.so:/system/lib/libchromatix_imx074_zsl.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx091_default_video.so:/system/lib/libchromatix_imx091_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx091_preview.so:/system/lib/libchromatix_imx091_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx091_video_hd.so:/system/lib/libchromatix_imx091_video_hd.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx119_default_video.so:/system/lib/libchromatix_imx119_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx119_preview.so:/system/lib/libchromatix_imx119_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_imx119_vt.so:/system/lib/libchromatix_imx119_vt.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_mt9e013_default_video.so:/system/lib/libchromatix_mt9e013_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_mt9e013_preview.so:/system/lib/libchromatix_mt9e013_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_mt9e013_video_hfr.so:/system/lib/libchromatix_mt9e013_video_hfr.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov2720_default_video.so:/system/lib/libchromatix_ov2720_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov2720_hfr.so:/system/lib/libchromatix_ov2720_hfr.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov2720_preview.so:/system/lib/libchromatix_ov2720_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov2720_zsl.so:/system/lib/libchromatix_ov2720_zsl.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov5647_default_video.so:/system/lib/libchromatix_ov5647_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov5647_preview.so:/system/lib/libchromatix_ov5647_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov8825_default_video.so:/system/lib/libchromatix_ov8825_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov8825_preview.so:/system/lib/libchromatix_ov8825_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov9726_default_video.so:/system/lib/libchromatix_ov9726_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_ov9726_preview.so:/system/lib/libchromatix_ov9726_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_default_video.so:/system/lib/libchromatix_s5k3l1yx_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_hfr_120fps.so:/system/lib/libchromatix_s5k3l1yx_hfr_120fps.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_hfr_60fps.so:/system/lib/libchromatix_s5k3l1yx_hfr_60fps.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_hfr_90fps.so:/system/lib/libchromatix_s5k3l1yx_hfr_90fps.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_preview.so:/system/lib/libchromatix_s5k3l1yx_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_video_hd.so:/system/lib/libchromatix_s5k3l1yx_video_hd.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k3l1yx_zsl.so:/system/lib/libchromatix_s5k3l1yx_zsl.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k4e1_default_video.so:/system/lib/libchromatix_s5k4e1_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k4e1_preview.so:/system/lib/libchromatix_s5k4e1_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k4e5ya_default_video.so:/system/lib/libchromatix_s5k4e5ya_default_video.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k4e5ya_preview.so:/system/lib/libchromatix_s5k4e5ya_preview.so \
    device/lge/fx3/prebuilt/system/lib/libchromatix_s5k4e5ya_zsl.so:/system/lib/libchromatix_s5k4e5ya_zsl.so \
    device/lge/fx3/prebuilt/system/lib/libconfigdb.so:/system/lib/libconfigdb.so \
    device/lge/fx3/prebuilt/system/lib/libdiag.so:/system/lib/libdiag.so \
    device/lge/fx3/prebuilt/system/lib/libdl.so:/system/lib/libdl.so \
    device/lge/fx3/prebuilt/system/lib/libdrmdiag.so:/system/lib/libdrmdiag.so \
    device/lge/fx3/prebuilt/system/lib/libdrmfs.so:/system/lib/libdrmfs.so \
    device/lge/fx3/prebuilt/system/lib/libdrmtime.so:/system/lib/libdrmtime.so \
    device/lge/fx3/prebuilt/system/lib/libdsi_netctrl.so:/system/lib/libdsi_netctrl.so \
    device/lge/fx3/prebuilt/system/lib/libdsprofile.so:/system/lib/libdsprofile.so \
    device/lge/fx3/prebuilt/system/lib/libdss.so:/system/lib/libdss.so \
    device/lge/fx3/prebuilt/system/lib/libdsucsd.so:/system/lib/libdsucsd.so \
    device/lge/fx3/prebuilt/system/lib/libdsutils.so:/system/lib/libdsutils.so \
    device/lge/fx3/prebuilt/system/lib/libgemini.so:/system/lib/libgemini.so \
    device/lge/fx3/prebuilt/system/lib/libgps.utils.so:/system/lib/libgps.utils.so \
    device/lge/fx3/prebuilt/system/lib/libgsl.so:/system/lib/libgsl.so \
    device/lge/fx3/prebuilt/system/lib/libidl.so:/system/lib/libidl.so \
    device/lge/fx3/prebuilt/system/lib/libimage-jpeg-dec-omx-comp.so:/system/lib/libimage-jpeg-dec-omx-comp.so \
    device/lge/fx3/prebuilt/system/lib/libimage-jpeg-enc-omx-comp.so:/system/lib/libimage-jpeg-enc-omx-comp.so \
    device/lge/fx3/prebuilt/system/lib/libimage-omx-common.so:/system/lib/libimage-omx-common.so \
    device/lge/fx3/prebuilt/system/lib/liblgftmitem.so:/system/lib/liblgftmitem.so \
    device/lge/fx3/prebuilt/system/lib/libllvm-a3xx.so:/system/lib/libllvm-a3xx.so \
    device/lge/fx3/prebuilt/system/lib/libloc_adapter.so:/system/lib/libloc_adapter.so \
    device/lge/fx3/prebuilt/system/lib/libloc_api_v02.so:/system/lib/libloc_api_v02.so \
    device/lge/fx3/prebuilt/system/lib/libloc_eng.so:/system/lib/libloc_eng.so \
    device/lge/fx3/prebuilt/system/lib/libloc_ext.so:/system/lib/libloc_ext.so \
    device/lge/fx3/prebuilt/system/lib/libmm-color-convertor.so:/system/lib/libmm-color-convertor.so \
    device/lge/fx3/prebuilt/system/lib/libmmcamera_faceproc.so:/system/lib/libmmcamera_faceproc.so \
    device/lge/fx3/prebuilt/system/lib/libmmcamera_frameproc.so:/system/lib/libmmcamera_frameproc.so \
    device/lge/fx3/prebuilt/system/lib/libmmcamera_statsproc31.so:/system/lib/libmmcamera_statsproc31.so \
    device/lge/fx3/prebuilt/system/lib/libmmipl.so:/system/lib/libmmipl.so \
    device/lge/fx3/prebuilt/system/lib/libmmjpeg.so:/system/lib/libmmjpeg.so \
    device/lge/fx3/prebuilt/system/lib/libmmjps.so:/system/lib/libmmjps.so \
    device/lge/fx3/prebuilt/system/lib/libmmmpo.so:/system/lib/libmmmpo.so \
    device/lge/fx3/prebuilt/system/lib/libmmmpod.so:/system/lib/libmmmpod.so \
    device/lge/fx3/prebuilt/system/lib/libmmosal.so:/system/lib/libmmosal.so \
    device/lge/fx3/prebuilt/system/lib/libmmparser.so:/system/lib/libmmparser.so \
    device/lge/fx3/prebuilt/system/lib/libmmstillomx.so:/system/lib/libmmstillomx.so \
    device/lge/fx3/prebuilt/system/lib/libnetmgr.so:/system/lib/libnetmgr.so \
    device/lge/fx3/prebuilt/system/lib/liboemcamera.so:/system/lib/liboemcamera.so \
    device/lge/fx3/prebuilt/system/lib/libqc-opt.so:/system/lib/libqc-opt.so \
    device/lge/fx3/prebuilt/system/lib/libqdi.so:/system/lib/libqdi.so \
    device/lge/fx3/prebuilt/system/lib/libqdp.so:/system/lib/libqdp.so \
    device/lge/fx3/prebuilt/system/lib/libqmi.so:/system/lib/libqmi.so \
    device/lge/fx3/prebuilt/system/lib/libqmi_cci.so:/system/lib/libqmi_cci.so \
    device/lge/fx3/prebuilt/system/lib/libqmi_common_so.so:/system/lib/libqmi_common_so.so \
    device/lge/fx3/prebuilt/system/lib/libqmi_csi.so:/system/lib/libqmi_csi.so \
    device/lge/fx3/prebuilt/system/lib/libqmi_encdec.so:/system/lib/libqmi_encdec.so \
    device/lge/fx3/prebuilt/system/lib/libqmiservices.so:/system/lib/libqmiservices.so \
    device/lge/fx3/prebuilt/system/lib/libreference-ril.so:/system/lib/libreference-ril.so \
    device/lge/fx3/prebuilt/system/lib/libril-qc-qmi-1.so:/system/lib/libril-qc-qmi-1.so \
    device/lge/fx3/prebuilt/system/lib/libril-qcril-hook-oem.so:/system/lib/libril-qcril-hook-oem.so \
    device/lge/fx3/prebuilt/system/lib/libril.so:/system/lib/libril.so \
    device/lge/fx3/prebuilt/system/lib/libsc-a2xx.so:/system/lib/libsc-a2xx.so \
    device/lge/fx3/prebuilt/system/lib/libsc-a3xx.so:/system/lib/libsc-a3xx.so \
    device/lge/fx3/prebuilt/system/lib/libsensor1.so:/system/lib/libsensor1.so \
    device/lge/fx3/prebuilt/system/lib/libsensor_reg.so:/system/lib/libsensor_reg.so \
    device/lge/fx3/prebuilt/system/lib/libv8.so:/system/lib/libv8.so \
    device/lge/fx3/prebuilt/system/lib/libxml.so:/system/lib/libxml.so \
    device/lge/fx3/prebuilt/system/lib/libxml2.so:/system/lib/libxml2.so
    
# usr/idc
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/usr/idc/melfas-ts.idc:/system/usr/idc/melfas-ts.idc \
    device/lge/fx3/prebuilt/system/usr/idc/qwerty.idc:/system/usr/idc/qwerty.idc \
    device/lge/fx3/prebuilt/system/usr/idc/qwerty2.idc:/system/usr/idc/qwerty2.idc
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fx3
PRODUCT_DEVICE := fx3

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
