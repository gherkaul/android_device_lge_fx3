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

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# 2nd-init
PRODUCT_PACKAGES += \
	2nd-init \
	cm10.sh \
	cm10.tar \
	mksh2 \
	recovery.sh \
	recovery.tar \
	taskset

# 2nd-init
#PRODUCT_COPY_FILES += \
#    device/lge/fx3/prebuilt/xbin/2nd-init:/system/xbin/2nd-init \
#    device/lge/fx3/prebuilt/xbin/cm10.sh:/system/xbin/cm10.sh \
#    device/lge/fx3/prebuilt/xbin/cm10.tar:/system/xbin/cm10.tar \
#    device/lge/fx3/prebuilt/xbin/mksh2:/system/xbin/mksh2 \
#    device/lge/fx3/prebuilt/xbin/recovery.sh:/system/xbin/recovery.sh \
#    device/lge/fx3/prebuilt/xbin/recovery.tar:/system/xbin/recovery.tar \
#    device/lge/fx3/prebuilt/xbin/taskset:/system/xbin/taskset

# Prebuilt libraries that are needed
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bin/bridgemgrd:system/bin/bridgemgrd \
    $(LOCAL_PATH)/prebuilt/bin/cnd:system/bin/cnd \
    $(LOCAL_PATH)/prebuilt/bin/ds_fmc_appd:system/bin/ds_fmc_appd \
    $(LOCAL_PATH)/prebuilt/bin/hostapd:system/bin/hostapd \
    $(LOCAL_PATH)/prebuilt/bin/mm-pp-daemon:system/bin/mm-pp-daemon \
    $(LOCAL_PATH)/prebuilt/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
    $(LOCAL_PATH)/prebuilt/bin/mpdecision:system/bin/mpdecision \
    $(LOCAL_PATH)/prebuilt/bin/nl_listener:system/bin/nl_listener \
    $(LOCAL_PATH)/prebuilt/bin/port-bridge:system/bin/port-bridge \
    $(LOCAL_PATH)/prebuilt/bin/qseecomd:system/bin/qseecomd \
    $(LOCAL_PATH)/prebuilt/bin/radish:system/bin/radish \
    $(LOCAL_PATH)/prebuilt/bin/rmt_storage:system/bin/rmt_storage \
    $(LOCAL_PATH)/prebuilt/bin/time_daemon:system/bin/time_daemon \
    $(LOCAL_PATH)/prebuilt/bin/usbhub:system/bin/usbhub \
    $(LOCAL_PATH)/prebuilt/bin/usbhub_init:system/bin/usbhub_init \
    $(LOCAL_PATH)/prebuilt/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
    $(LOCAL_PATH)/prebuilt/lib/hw/camera.msm8960.so:system/lib/hw/camera.msm8960.so \
    $(LOCAL_PATH)/prebuilt/lib/libacdbloader.so:system/lib/libacdbloader.so \
    $(LOCAL_PATH)/prebuilt/lib/libgenlock.so:obj/lib/libgenlock.so \
    $(LOCAL_PATH)/prebuilt/lib/libgenlock.so:system/lib/libgenlock.so \
    $(LOCAL_PATH)/prebuilt/lib/libcamera_client.so:system/lib/libcamera_client.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_default_video.so:system/lib/libchromatix_imx074_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_preview.so:system/lib/libchromatix_imx074_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_video_hd.so:system/lib/libchromatix_imx074_video_hd.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_zsl.so:system/lib/libchromatix_imx074_zsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx091_default_video.so:system/lib/libchromatix_imx091_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx091_preview.so:system/lib/libchromatix_imx091_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx091_video_hd.so:system/lib/libchromatix_imx091_video_hd.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx119_default_video.so:system/lib/libchromatix_imx119_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx119_preview.so:system/lib/libchromatix_imx119_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx119_vt.so:system/lib/libchromatix_imx119_vt.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_ov2720_default_video.so:system/lib/libchromatix_ov2720_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_ov2720_preview.so:system/lib/libchromatix_ov2720_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_default_video.so:system/lib/libchromatix_s5k3l1yx_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_hfr_60fps.so:system/lib/libchromatix_s5k3l1yx_hfr_60fps.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_hfr_90fps.so:system/lib/libchromatix_s5k3l1yx_hfr_90fps.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_hfr_120fps.so:system/lib/libchromatix_s5k3l1yx_hfr_120fps.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_preview.so:system/lib/libchromatix_s5k3l1yx_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_video_hd.so:system/lib/libchromatix_s5k3l1yx_video_hd.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_zsl.so:system/lib/libchromatix_s5k3l1yx_zsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k4e1_default_video.so:system/lib/libchromatix_s5k4e1_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k4e1_preview.so:system/lib/libchromatix_s5k4e1_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libCommandSvc.so:system/lib/libCommandSvc.so \
    $(LOCAL_PATH)/prebuilt/lib/libconfigdb.so:system/lib/libconfigdb.so \
    $(LOCAL_PATH)/prebuilt/lib/libDivxDrm.so:system/lib/libDivxDrm.so \
    $(LOCAL_PATH)/prebuilt/lib/libdrmdiag.so:system/lib/libdrmdiag.so \
    $(LOCAL_PATH)/prebuilt/lib/libdrmfs.so:system/lib/libdrmfs.so \
    $(LOCAL_PATH)/prebuilt/lib/libdsprofile.so:system/lib/libdsprofile.so \
    $(LOCAL_PATH)/prebuilt/lib/libdss.so:system/lib/libdss.so \
    $(LOCAL_PATH)/prebuilt/lib/libdsucsd.so:system/lib/libdsucsd.so \
    $(LOCAL_PATH)/prebuilt/lib/libgemini.so:system/lib/libgemini.so \
    $(LOCAL_PATH)/prebuilt/lib/libI420colorconvert.so:system/lib/libI420colorconvert.so \
    $(LOCAL_PATH)/prebuilt/lib/libidl.so:system/lib/libidl.so \
    $(LOCAL_PATH)/prebuilt/lib/libimage-jpeg-dec-omx-comp.so:system/lib/libimage-jpeg-dec-omx-comp.so \
    $(LOCAL_PATH)/prebuilt/lib/libimage-jpeg-enc-omx-comp.so:system/lib/libimage-jpeg-enc-omx-comp.so \
    $(LOCAL_PATH)/prebuilt/lib/libimage-omx-common.so:system/lib/libimage-omx-common.so \
    $(LOCAL_PATH)/prebuilt/lib/liblgftmitem.so:system/lib/liblgftmitem.so \
    $(LOCAL_PATH)/prebuilt/lib/libllvm-a3xx.so:system/lib/libllvm-a3xx.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_faceproc.so:system/lib/libmmcamera_faceproc.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_frameproc.so:system/lib/libmmcamera_frameproc.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_statsproc31.so:system/lib/libmmcamera_statsproc31.so \
    $(LOCAL_PATH)/prebuilt/lib/libmm-color-convertor.so:system/lib/libmm-color-convertor.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmipl.so:system/lib/libmmipl.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmjps.so:system/lib/libmmjps.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmmpo.so:system/lib/libmmmpo.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmmpod.so:system/lib/libmmmpod.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmosal.so:system/lib/libmmosal.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmparser.so:system/lib/libmmparser.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmstillomx.so:system/lib/libmmstillomx.so \
    $(LOCAL_PATH)/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    $(LOCAL_PATH)/prebuilt/lib/libOlaLGECameraJNI_3b.so:system/lib/libOlaLGECameraJNI_3b.so \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    $(LOCAL_PATH)/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    $(LOCAL_PATH)/prebuilt/lib/libqc-opt.so:system/lib/libqc-opt.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_cci.so:system/lib/libqmi_cci.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_common_so.so:system/lib/libqmi_common_so.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_csi.so:system/lib/libqmi_csi.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_encdec.so:system/lib/libqmi_encdec.so \
    $(LOCAL_PATH)/prebuilt/lib/libQSEEComAPI.so:system/lib/libQSEEComAPI.so \
    $(LOCAL_PATH)/prebuilt/lib/libtcpfinaggr.so:system/lib/libtcpfinaggr.so \
    $(LOCAL_PATH)/prebuilt/lib/libxml.so:system/lib/libxml.so \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so

# Prebuilt libraries that are needed for DRM playback
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vendor/lib/drm/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libwvdrm_L1.so:system/vendor/lib/libwvdrm_L1.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    $(LOCAL_PATH)/prebuilt/vendor/lib/libWVStreamControlAPI_L1.so:system/vendor/lib/libWVStreamControlAPI_L1.so

# Prebuilt hack fixes
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/2nd-init/su:system/xbin/su
    
# Lights
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/hw/lights.msm8960.so:/system/lib/hw/lights.msm8960.so \
    
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fx3
PRODUCT_DEVICE := fx3

# call the proprietary setup
$(call inherit-product-if-exists, vendor/lge/fx3/fx3-vendor.mk)

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
