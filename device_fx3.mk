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
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fx3
PRODUCT_DEVICE := fx3

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
