# Non-Runtime Resource Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/fortune/overlay

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/fortune/overlay/common

# SystemUI Customisation
PRODUCT_PACKAGES += \
    SystemUICustomOverlay

# Settings Customisation
PRODUCT_PACKAGES += \
    SettingsCustomOverlay

# SettingsProvider Customisation
PRODUCT_PACKAGES += \
    SettingsProviderOverlay
