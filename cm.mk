## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := hawaii

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/hawaii/device_hawaii.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := hawaii
PRODUCT_NAME := cm_hawaii
PRODUCT_BRAND := samsung
PRODUCT_MODEL := hawaii
PRODUCT_MANUFACTURER := samsung
