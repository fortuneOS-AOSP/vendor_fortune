# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE ?= true

include vendor/fortune/config/BoardConfigKernel.mk

# Dex2oat
ifeq ($(TARGET_CPU_VARIANT),cortex-a510)
    DEX2OAT_TARGET_CPU_VARIANT := cortex-a76
    DEX2OAT_TARGET_CPU_VARIANT_RUNTIME := cortex-a76
endif

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
	include build/make/target/board/BoardConfigPixelCommon.mk
	include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/fortune/config/BoardConfigSoong.mk
