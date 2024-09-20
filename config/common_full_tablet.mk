TARGET_DEVICE_IS_TABLET := true

# Tablet extension
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Settings
PRODUCT_PRODUCT_PROPERTIES += \
    persist.settings.large_screen_opt.enabled=true

# Inherit full common PixelExperience stuff
$(call inherit-product, vendor/fortune/config/common_full_phone.mk)
