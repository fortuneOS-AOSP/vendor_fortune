# Inherit common stuff
$(call inherit-product, vendor/fortune/config/common_mobile.mk)

PRODUCT_SIZE := full

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd
