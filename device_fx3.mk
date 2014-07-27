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
    device/lge/fx3/prebuilt/system/etc/vold.fstab:/system/etc/vold.fstab \
    device/lge/fx3/prebuilt/system/etc/AAA:/system/etc/AAA \
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fx3
PRODUCT_DEVICE := fx3

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
