# Inherit common mobile FortuneOS stuff
$(call inherit-product, vendor/fortune/config/common.mk)

# Legal
PRODUCT_PRODUCT_PROPERTIES += \
    ro.lineagelegal.url=https://lineageos.org/legal

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true
