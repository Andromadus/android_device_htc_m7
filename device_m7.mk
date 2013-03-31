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

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    init.qcom.sh \
    init.qcom.usb.rc \
    init.qcom.rc \
    ueventd.qcom.rc

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/htc/m7/configs/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    device/htc/m7/configs/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh \
    device/htc/m7/configs/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh \
    device/htc/m7/configs/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler

# Bluetooth
PRODUCT_PACKAGES += \
    hci_qcomm_init

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960

# GPS
PRODUCT_PACKAGES += \
    libloc_adapter \
    libloc_eng \
    libgps.utils \
    gps.msm8960

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    liboverlay

# Lights
PRODUCT_PACKAGES += \
    lights.msm8960

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    power.msm8960

# HDMI
PRODUCT_PACKAGES += \
    hdmid

# QCOM rngd
PRODUCT_PACKAGES += \
    qrngd

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# GPS config
PRODUCT_COPY_FILES += \
    device/htc/m7/configs/gps.conf:system/etc/gps.conf

# Media config
PRODUCT_COPY_FILES += \
    device/htc/m7/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/m7/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/m7/configs/media_codecs.xml:system/etc/media_codecs.xml

# Common build properties
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    debug.composition.type=dyn \
    debug.egl.hw=1 \
    debug.mdpcomp.logs=0 \
    debug.sf.hw=1 \
    dev.pm.dyn_samplingrate=1 \
    lpa.decode=true \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    persist.audio.speaker.location=high \
    persist.gps.qmienabled=true \
    persist.hwc.mdpcomp.enable=true \
    persist.thermal.monitor=true \
    ro.baseband.arch=msm \
    ro.opengles.version=131072 \
    ro.qc.sdk.audio.fluencetype=fluence \
    ro.qualcomm.bt.hci_transport=smd \
    ro.telephony.ril_class=HTC8960RIL \
    ro.use_data_netmgrd=true \
    wifi.interface=wlan0
