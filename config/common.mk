# Branding
$(call inherit-product, vendor/fortune/config/branding.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_SYSTEM_PROPERTIES += \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_PROPERTIES += \
    ro.control_privapp_permissions=enforce

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_PROPERTIES += ro.adb.secure=0
PRODUCT_SYSTEM_PROPERTIES += ro.adb.secure.recovery=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_PROPERTIES += ro.adb.secure=1

# Disable extra StrictMode features on all non-engineering builds
PRODUCT_SYSTEM_PROPERTIES += persist.sys.strictmode.disable=true
endif

# To prevent rebooting due to crashing services
PRODUCT_SYSTEM_PROPERTIES += \
    init.svc_debug.no_fatal.zygote=true \
    persist.device_config.configuration.disable_rescue_party=true

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

$(call inherit-product, vendor/fortune/config/common/apps.mk)
$(call inherit-product, vendor/fortune/config/common/configs.mk)
$(call inherit-product, vendor/fortune/config/common/fonts.mk)
$(call inherit-product, vendor/fortune/config/common/languages.mk)
$(call inherit-product, vendor/fortune/config/common/optimisation.mk)
$(call inherit-product, vendor/fortune/config/common/properties.mk)
$(call inherit-product, vendor/fortune/config/common/overlays.mk)
$(call inherit-product, vendor/fortune/config/common/tools.mk)

-include $(WORKSPACE)/build_env/image-auto-bits.mk
