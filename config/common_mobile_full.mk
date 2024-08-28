# Inherit common fortuneOS stuff
$(call inherit-product, vendor/fortune/config/common_mobile.mk)

PRODUCT_SIZE := full

# Aperture
ifneq ($(PRODUCT_NO_CAMERA),true)
PRODUCT_PACKAGES += \
    Aperture
endif

# Extra cmdline tools
PRODUCT_PACKAGES += \
    unrar \
    zstd

# Include fortuneOS LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/fortune/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/fortune/overlay/dictionaries
