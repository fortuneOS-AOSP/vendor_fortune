# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.sip.voip.xml

# LineageHW
PRODUCT_COPY_FILES += \
    vendor/fortune/config/permissions/privapp-permissions-lineagehw.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-lineagehw.xml

# Permissions for lineage sdk services
PRODUCT_COPY_FILES += \
    vendor/fortune/config/permissions/org.lineageos.health.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.lineageos.health.xml \
    vendor/fortune/config/permissions/org.lineageos.livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.lineageos.livedisplay.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/fortune/config/permissions/custom-power-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/custom-power-whitelist.xml

# Keylayout
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_045e_Product_0719.kl \
    vendor/fortune/misc/keylayout/Vendor_2dc8_Product_6006.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_2dc8_Product_6006.kl
