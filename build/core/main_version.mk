# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)
FORTUNE_DEVICE ?= $(TARGET_DEVICE)
BUILD_SIGNATURE_KEYS := release-keys
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(FORTUNE_DEVICE)/$(FORTUNE_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

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
