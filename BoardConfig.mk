#
# Copyright (C) 2017-2018 The LineageOS Project
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

DEVICE_PATH := device/xiaomi/rosy

# Inherit from common msm8953-common
-include device/xiaomi/msm8953-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000 loop.max_part=7 androidboot.usbconfigfs=false
TARGET_KERNEL_CONFIG := rosy-perf_defconfig
TARGET_KERNEL_VERSION := 3.18

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Partitions
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # 25765059584 - 16384
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912

# Power
#TARGET_USES_INTERACTION_BOOST := true
TARGET_TAP_TO_WAKE_NODE := "/proc/gesture/onoff"

# RIL
DISABLE_RILD_OEM_HOOK := true
ENABLE_VENDOR_RIL_SERVICE := true

# Vendor security Patch
VENDOR_SECURITY_PATCH := 2020-05-05

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/minimal

# Inherit from the proprietary version
-include vendor/xiaomi/rosy/BoardConfigVendor.mk
