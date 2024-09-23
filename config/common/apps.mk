# Battery Status Viewer
PRODUCT_PACKAGES += \
    BatteryStatsViewer

# BtHelper
PRODUCT_PACKAGES += \
    BtHelper

# Camera
ifneq ($(PRODUCT_NO_CAMERA),true)
ifneq ($(TARGET_INCLUDE_APERTURE),false)
PRODUCT_PACKAGES += \
    Aperture

PRODUCT_PACKAGES += \
    PixelConfigOverlayAperture \
    PixelLauncherCustomOverlayAperture \
    SystemUICustomOverlayAperture
endif #TARGET_INCLUDE_APERTURE
endif #PRODUCT_NO_CAMERA

# Game Space
PRODUCT_PACKAGES += \
    GameSpace

# SystemUI Flag configuration
PRODUCT_PACKAGES += \
    SystemUIFlagFlipper

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# TouchGestures
PRODUCT_PACKAGES += \
    TouchGestures

# Updater
ifneq ($(TARGET_INCLUDE_UPDATER),false)
PRODUCT_PACKAGES += \
    Updater
endif #TARGET_INCLUDE_UPDATER
