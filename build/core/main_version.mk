# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY),true)
ADDITIONAL_SYSTEM_PROPERTIES  += \
    persist.vendor.recovery_update=true
endif

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES += \
    org.fortune.brand=$(FORTUNE_BRAND) \
    org.fortune.build.version=$(FORTUNE_BUILD_VERSION) \
    org.fortune.build_date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build_date_utc=$(FORTUNE_BUILD_DATE_UTC) \
    org.fortune.device=$(FORTUNE_DEVICE) \
    org.fortune.releasetype=$(FORTUNE_RELEASETYPE) \
    org.fortune.version=$(FORTUNE_VERSION)
