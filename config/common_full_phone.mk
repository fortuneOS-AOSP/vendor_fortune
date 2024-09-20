# Telephony

IS_PHONE := true

ifneq ($(TARGET_REQUIRES_APN_CONF),false)
# World APN list
PRODUCT_PACKAGES += \
    apns-conf.xml
endif

# Telephony packages
PRODUCT_PACKAGES += \
    Stk

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_PROPERTIES += \
    net.tethering.noprovisioning=true

# Disable mobile data by default
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.android.mobiledata=false

# Inherit full common PixelExperience stuff
$(call inherit-product, vendor/fortune/config/common_full.mk)
