$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/hawaii/hawaii-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/hawaii/overlay

LOCAL_PATH := device/samsung/hawaii
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := kylevexx
PRODUCT_DEVICE := kyleve

# Files needed for recovery image
PRODUCT_COPY_FILES += \
device/samsung/hawaii/recovery/recovery:/recovery/root/sbin/recovery \
device/samsung/hawaii/recovery/ueventd:/recovery/root/sbin/ueventd \
device/samsung/hawaii/recovery/ueventd.hawaii_ss_kyleve.rc:/recovery/root/ueventd.hawaii_ss_kyleve.rc 

# Init files
PRODUCT_COPY_FILES += \
device/samsung/hawaii/rc/ueventd.hawaii_ss_kyleve.rc:root/ueventd.hawaii_ss_kyleve.rc	\
device/samsung/hawaii/rc/lpm.rc:root/lpm.rc	\
device/samsung/hawaii/rc/init.usb.rc:root/init.usb.rc	\
device/samsung/hawaii/rc/init.trace.rc:root/init.trace.rc	\
device/samsung/hawaii/rc/init.hawaii_ss_kyleve.rc:root/init.hawaii_ss_kyleve.rc	\
device/samsung/hawaii/rc/init.bt.rc:root/init.bt.rc	\
device/samsung/hawaii/rc/init.bcm2166x.usb.rc:root/init.bcm2166x.usb.rc\
device/samsung/hawaii/fstab.hawaii_ss_kyleve:root/fstab.hawaii_ss_kyleve

PRODUCT_COPY_FILES += \
        device/samsung/hawaii/vold.fstab:system/etc/vold.fstab

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
        device/samsung/hawaii/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
        device/samsung/hawaii/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
        device/samsung/hawaii/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
		device/samsung/hawaii/qwerty.kl:system/usr/keylayout/qwerty.kl \
		device/samsung/hawaii/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs

PRODUCT_PACKAGES += \
	e2fsck \
	libexifa \
	libjpega \
	libkeyutils \
	audio.a2dp.default \
	libasound \
    libasound_module_pcm_bcmfilter \
	bcm_dut

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	mobiledata.interfaces=rmnet0 \
	ro.telephony.ril_class=SamsungBCMRIL \
	
# Charger
PRODUCT_PACKAGES += \
        charger \
        charger_res_images
		
		# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
        frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
