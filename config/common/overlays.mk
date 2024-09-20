# Non-Runtime Resource Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/fortune/overlay

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/fortune/overlay/common

# Cutout control overlay
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    DummyCutoutOverlay

# Hide navigation bar hint
PRODUCT_PACKAGES += \
    NavigationBarNoHintOverlay

# Navigation bar IME space overlay
PRODUCT_PACKAGES += \
    NavigationBarModeGesturalOverlayNarrowSpace \
    NavigationBarModeGesturalOverlayNoSpace

# SystemUI Customisation
PRODUCT_PACKAGES += \
    SystemUICustomOverlay

# Settings Customisation
PRODUCT_PACKAGES += \
    SettingsCustomOverlay

# SettingsProvider Customisation
PRODUCT_PACKAGES += \
    SettingsProviderOverlay

# Themes
PRODUCT_PACKAGES += \
    AndroidBlackThemeOverlay
