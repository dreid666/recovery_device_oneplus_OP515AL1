#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2019-Present A-Team Digital Solutions
#

DEVICE_PATH := device/oneplus/OP515AL1

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true
BUILD_BROKEN_DUP_RULES := true

# Bootloader
TARGET_USES_UEFI := true

# Assert
TARGET_OTA_ASSERT_DEVICE := OP515AL1

# Build Error Bypass Fix
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Build Flags
TW_MAINTAINER := PizzaG
TW_DEVICE_VERSION := v0.01
RECOVERY_VARIANT := TWRP_12.1
ALLOW_MISSING_DEPENDENCIES := true
LC_ALL := "C"

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE += twrpfastboot=1
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3
BOARD_KERNEL_CMDLINE += buildvariant=eng
BOARD_KERNEL_CMDLINE += cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0x04C8C000
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image 
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += pcie_ports=compat
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=0
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000

KERNEL_LD := LLVM=1
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := OP515AL1_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/OP515AL1

# kernel Prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb

# Disable For Prebuilt Kernel
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true
#BOARD_KERNEL_SEPARATED_DTBO := true

# Metadata
#BOARD_USES_METADATA_PARTITION := true
#BOARD_ROOT_EXTRA_FOLDERS += metadata

PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

#BOARD_USES_QCOM_FBE_DECRYPTION := true
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#TW_USE_FSCRYPT_POLICY := 1

TARGET_RECOVERY_DEVICE_MODULES += \
    libandroidicu \
    libion 

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/system/lib64/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 167772160
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 167772160

# Super Partition
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 11190403072
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 11186208768 # (BOARD_SUPER_PARTITION_SIZE - 4MB)

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := holi

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_FSTAB_FILE += $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXCLUDE_TWRPAPP := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone79/temp"
TW_Y_OFFSET := 120
TW_H_OFFSET := -120
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_APEX := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true

# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := false
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd

# TWRP Installer
RECOVERY_INSTALLER_PATH := bootable/recovery/installer
USE_RECOVERY_INSTALLER := true

# TWRP Load Modules
TW_LOAD_VENDOR_MODULES := "oplus_bsp_tp_gt9886.ko oplus_bsp_tp_goodix_comnon.ko apr_dlkm.ko oplus_bsp_tp_notify.ko q6_notifier_dlkm.ko q6_pdr_dlkm.ko snd_event_dlkm.ko adsp_loader_dlkm.ko oplus_chg.ko"

# TWRP Ramdisk Compression
#BOARD_RAMDISK_USE_LZMA := true
#LZMA_RAMDISK_TARGETS := boot

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
