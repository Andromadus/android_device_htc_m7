$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/m7/m7-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/m7/overlay

LOCAL_PATH := device/htc/m7
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):/prebuilt/kernel \
    $(LOCAL_PATH)/prebuilt/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/prebuilt/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    $(LOCAL_PATH)/prebuilt/bluetooth-power.ko:system/lib/modules/bluetooth-power.ko \
    $(LOCAL_PATH)/prebuilt/dm-crypt.ko:system/lib/modules/dm-crypt.ko \
    $(LOCAL_PATH)/prebuilt/eeprom_93cx6.ko:system/lib/modules/eeprom_93cx6.ko \
    $(LOCAL_PATH)/prebuilt/evbug.ko:system/lib/modules/evbug.ko \
    $(LOCAL_PATH)/prebuilt/gspca_main.ko:system/lib/modules/gspca_main.ko \
    $(LOCAL_PATH)/prebuilt/ks8851.ko:system/lib/modules/ks8851.ko \
    $(LOCAL_PATH)/prebuilt/lcd.ko:system/lib/modules/lcd.ko \
    $(LOCAL_PATH)/prebuilt/moc_crypto.ko:system/lib/modules/moc_crypto.ko \
    $(LOCAL_PATH)/prebuilt/moc_crypto.ko.3.4.10:system/lib/modules/moc_crypto.ko.3.4.10 \
    $(LOCAL_PATH)/prebuilt/moc_crypto.ko.sig.3.4.10:system/lib/modules/moc_crypto.ko.sig.3.4.10 \
    $(LOCAL_PATH)/prebuilt/moc_platform_mod.ko:system/lib/modules/moc_platform_mod.ko \
    $(LOCAL_PATH)/prebuilt/moc_platform_mod.ko.3.4.10:system/lib/modules/moc_platform_mod.ko.3.4.10 \
    $(LOCAL_PATH)/prebuilt/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
    $(LOCAL_PATH)/prebuilt/qce40.ko:system/lib/modules/qce40.ko \
    $(LOCAL_PATH)/prebuilt/qcedev.ko:system/lib/modules/qcedev.ko \
    $(LOCAL_PATH)/prebuilt/qcrypto.ko:system/lib/modules/qcrypto.ko \
    $(LOCAL_PATH)/prebuilt/reset_modem.ko:system/lib/modules/reset_modem.ko \
    $(LOCAL_PATH)/prebuilt/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/spidev.ko:system/lib/modules/spidev.ko \
    $(LOCAL_PATH)/prebuilt/wp_mod.ko:system/lib/modules/wp_mod.ko \
    $(LOCAL_PATH)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/recovery/sbin/power_test:recovery/root/sbin/power_test

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_m7
PRODUCT_DEVICE := m7
