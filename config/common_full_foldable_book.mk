$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)

# Inherit common PixelExperience stuff
$(call inherit-product, vendor/fortune/config/common_full_phone.mk)

# Enable support of one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode?=true

# Settings
PRODUCT_PRODUCT_PROPERTIES += \
    persist.settings.large_screen_opt.enabled=true
