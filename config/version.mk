#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

FORTUNE_BRAND := FortuneOS
FORTUNE_BUILD_VERSION := 15.0
FORTUNE_RELEASETYPE ?= release

FORTUNE_DATE_YEAR := $(shell date -u +%Y)
FORTUNE_DATE_MONTH := $(shell date -u +%m)
FORTUNE_DATE_DAY := $(shell date -u +%d)
FORTUNE_DATE_HOUR := $(shell date -u +%H)
FORTUNE_DATE_MINUTE := $(shell date -u +%M)
FORTUNE_BUILD_DATE_UTC := $(shell date -d '$(FORTUNE_DATE_YEAR)-$(FORTUNE_DATE_MONTH)-$(FORTUNE_DATE_DAY) $(FORTUNE_DATE_HOUR):$(FORTUNE_DATE_MINUTE) UTC' +%s)
FORTUNE_BUILD_DATE := $(FORTUNE_DATE_YEAR)$(FORTUNE_DATE_MONTH)$(FORTUNE_DATE_DAY)-$(FORTUNE_DATE_HOUR)$(FORTUNE_DATE_MINUTE)

DEVICE_LIST := $(shell cat official_devices/devices.list)

ifneq (,$(findstring $(FORTUNE_BUILD),$(DEVICE_LIST)))
    IS_OFFICIAL := true
    FORTUNE_BUILD_TYPE := OFFICIAL
    $(warning Device $(FORTUNE_BUILD) is available in the official list. FORTUNE_BUILD_TYPE is set to OFFICIAL)
else
    IS_OFFICIAL := false
    FORTUNE_BUILD_TYPE := UNOFFICIAL
    $(warning Device $(FORTUNE_BUILD) is not available in the official list. FORTUNE_BUILD_TYPE is set to UNOFFICIAL)
endif

FORTUNE_VERSION := $(FORTUNE_BRAND)_$(FORTUNE_BUILD)-$(FORTUNE_BUILD_VERSION)-$(FORTUNE_BUILD_DATE)-$(FORTUNE_BUILD_TYPE)

# FortuneOS Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    org.fortune.brand=$(FORTUNE_BRAND) \
    org.fortune.build.version=$(FORTUNE_BUILD_VERSION) \
    org.fortune.build_date=$(FORTUNE_BUILD_DATE) \
    org.fortune.build_date_utc=$(FORTUNE_BUILD_DATE_UTC) \
    org.fortune.device=$(FORTUNE_DEVICE) \
    org.fortune.releasetype=$(FORTUNE_RELEASETYPE) \
    org.fortune.version=$(FORTUNE_VERSION)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/fortune/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/fortune/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/fortune/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/fortune/signing/keys/otakey.x509.pem
endif
endif
