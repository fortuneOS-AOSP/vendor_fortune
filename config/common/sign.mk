# Signing
ifeq (user,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/fortune/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/fortune/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/fortune/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/fortune/signing/keys/otakey.x509.pem
endif
endif
