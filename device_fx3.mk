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
    
# NFC
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt)

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
    com.android.nfc_extras
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml
    
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# OMX
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libstagefrighthw

# hostapd
PRODUCT_PACKAGES += \
    hostapd

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs
    
# MSM8960 firmware
PRODUCT_COPY_FILES += \
    device/lge/fx3/prebuilt/system/etc/firmware/a225_pfp.fw:/system/etc/firmware/a225_pfp.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a225_pm4.fw:/system/etc/firmware/a225_pm4.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a225p5_pm4.fw:/system/etc/firmware/a225p5_pm4.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a300_pfp.fw:/system/etc/firmware/a225_pfp.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/a300_pm4.fw:/system/etc/firmware/a225_pm4.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/cyttsp_8064_mtp.hex:/system/etc/firmware/cyttsp_8064_mtp.hex \
    device/lge/fx3/prebuilt/system/etc/firmware/cyttsp_8960_cdp.hex:/system/etc/firmware/cyttsp_8960_cdp.hex \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd.bin:/system/etc/firmware/fw_bcmdhd.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd_apsta.bin:/system/etc/firmware/fw_bcmdhd_apsta.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd_mfg.bin:/system/etc/firmware/fw_bcmdhd_mfg.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/fw_bcmdhd_p2p.bin:/system/etc/firmware/fw_bcmdhd_p2p.bin \
    device/lge/fx3/prebuilt/system/etc/firmware/leia_pfp_470.fw:/system/etc/firmware/leia_pfp_470.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/leia_pm4_470.fw:/system/etc/firmware/leia_pm4_470.fw \
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc.b00
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc.b01
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc.b02
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc.b03
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc.mdt
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc_1080p.fw
    device/lge/fx3/prebuilt/system/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidcfw.elf
    
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
    

    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fx3
PRODUCT_DEVICE := fx3

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
