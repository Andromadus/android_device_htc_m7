# Include path
TARGET_SPECIFIC_HEADER_PATH := device/htc/m7/include

BOARD_VENDOR := htc

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/m7/BoardConfigVendor.mk 

TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true

# cat /proc/emmc:
# dev: size erasesize name
# mmcblk0p19: 000ffa00 00000200 "misc"
# mmcblk0p34: 00fffe00 00000200 "recovery"
# mmcblk0p33: 01000000 00000200 "boot"
# mmcblk0p35: 73fffc00 00000200 "system"
# mmcblk0p26: 00140200 00000200 "local"
# mmcblk0p36: 27fffe00 00000200 "cache"
# mmcblk0p37: 680000000 00000200 "userdata"
# mmcblk0p22: 01400000 00000200 "devlog"
# mmcblk0p24: 00040000 00000200 "pdata"
# mmcblk0p27: 00010000 00000200 "extra"
# mmcblk0p31: 04b00200 00000200 "radio"
# mmcblk0p16: 03c00400 00000200 "adsp"
# mmcblk0p15: 00100000 00000200 "dsps"
# mmcblk0p17: 007ffa00 00000200 "radio_config"
# mmcblk0p20: 00400000 00000200 "modem_st1"
# mmcblk0p21: 00400000 00000200 "modem_st2"
# mmcblk0p28: 00100000 00000200 "cdma_record"
# mmcblk0p18: 02000000 00000200 "reserve_1"
# mmcblk0p30: 034ffa00 00000200 "reserve_2"
# mmcblk0p32: 05fffc00 00000200 "reserve_3"
# mmcblk0p29: 06069e00 00000200 "reserve"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1946156032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27917287424
BOARD_FLASH_BLOCK_SIZE := 131072

# Flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
TARGET_QCOM_AUDIO_VARIANT := caf

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# QCOM GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_HAVE_OLD_ION_API := true
BOARD_EGL_CFG := device/htc/m7/configs/egl.cfg

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_PROVIDES_POWERHAL := true

# RIL
BOARD_RIL_CLASS := "../../../device/htc/m7/libril/"

# Time
KERNEL_HAS_GETTIMEOFDAY_HELPER := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=m7 user_debug=31
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01400000

TARGET_PREBUILT_KERNEL := device/htc/m7/prebuilt/kernel
TARGET_KERNEL_SOURCE := kernel/htc/msm8960
TARGET_KERNEL_CONFIG := jet_defconfig

BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_INITRC := device/htc/m7/recovery/init.rc
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/m7/bluetooth

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 38
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Merged Wifi Defines
WIFI_BAND := 802_11_ABGN
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_STA := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_NAME := bcmdhd
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

