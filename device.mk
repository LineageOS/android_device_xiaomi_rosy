#
# Copyright (C) 2017 The LineageOS Project
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

$(call inherit-product, vendor/xiaomi/rosy/rosy-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Inherit from msm8953-common
$(call inherit-product, device/xiaomi/msm8953-common/msm8953.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Audio configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
	$(LOCAL_PATH)/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml

# Camera
PRODUCT_PACKAGES += \
    camera.device@3.2-impl \
    vendor.qti.hardware.camera.device@1.0 \
    vendor.qti.hardware.camera.device@1.0_vendor

# Offline Charger
PRODUCT_PACKAGES += \
    charger_res_images

# HEALTH
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/ft5x06_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ft5x06_ts.kl

# ConsumerIr
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_rosy

# Properties
-include device/xiaomi/rosy/prop.mk

# Ramdisk
PRODUCT_PACKAGES += \
    init.rosy.rc \

PRODUCT_PACKAGES += \
    init.goodix.sh \
    init.baseband.sh \

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/xiaomi/rosy

# Ship Miui Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/adspso.bin:install/firmware-update/adspso.bin \
    $(LOCAL_PATH)/firmware/cmnlib64_30.mbn:install/firmware-update/cmnlib64_30.mbn \
    $(LOCAL_PATH)/firmware/cmnlib_30.mbn:install/firmware-update/cmnlib_30.mbn \
    $(LOCAL_PATH)/firmware/devcfg.mbn:install/firmware-update/devcfg.mbn \
    $(LOCAL_PATH)/firmware/emmc_appsboot.mbn:install/firmware-update/emmc_appsboot.mbn \
    $(LOCAL_PATH)/firmware/keymaster.mbn:install/firmware-update/keymaster.mbn \
    $(LOCAL_PATH)/firmware/lksecapp.mbn:install/firmware-update/lksecapp.mbn \
    $(LOCAL_PATH)/firmware/NON-HLOS.bin:install/firmware-update/NON-HLOS.bin \
    $(LOCAL_PATH)/firmware/rpm.mbn:install/firmware-update/rpm.mbn \
    $(LOCAL_PATH)/firmware/sbl1.mbn:install/firmware-update/sbl1.mbn \
    $(LOCAL_PATH)/firmware/tz.mbn:install/firmware-update/tz.mbn \
    $(LOCAL_PATH)/firmware/splash.img:install/firmware-update/splash.img

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf
