#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

KEEPER_LIST = $(shell cat fortune-keepers/keepers.list)
DEVICE_LIST = $(shell cat fortune-keepers/devices.list)

ifeq ($(filter $(FORTUNE_BUILD), $(DEVICE_LIST)), $(FORTUNE_BUILD))
   ifeq ($(filter $(FORTUNE_KEEPER), $(KEEPER_LIST)), $(FORTUNE_KEEPER))
      FORTUNE_BUILD_TYPE := COMMUNITY
  else
     # the builder is overriding official flag on purpose
     ifeq ($(FORTUNE_BUILD_TYPE), COMMUNITY)
       $(error **********************************************************)
       $(error *     A violation has been detected, aborting build      *)
       $(error **********************************************************)
       FORTUNE_BUILD_TYPE := HOMEMADE
     else
       $(warning **********************************************************************)
       $(warning *   There is already an official maintainer for $(FORTUNE_BUILD)    *)
       $(warning *              Setting build type to HOMEMADE                      *)
       $(warning *    Please contact current official maintainer before distributing  *)
       $(warning *              the current build to the community.                   *)
       $(warning **********************************************************************)
       FORTUNE_BUILD_TYPE := HOMEMADE
     endif
  endif
else
   ifeq ($(FORTUNE_BUILD_TYPE), COMMUNITY)
     $(error **********************************************************)
     $(error *     A violation has been detected, aborting build      *)
     $(error **********************************************************)
   endif
  FORTUNE_BUILD_TYPE := HOMEMADE
endif

ifdef FORTUNE_KEEPER
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   org.fortune.keeper=$(FORTUNE_KEEPER)
endif
