#
# Copyright (C) 2024 FortuneOS
#
# SPDX-License-Identifier: Apache-2.0
#

# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.low_ram?=false \
    ro.lmk.kill_heaviest_task?=false \
    ro.lmk.kill_timeout_ms?=100 \
    ro.lmk.use_minfree_levels?=true \
    ro.lmk.critical_upgrade?=true \
    ro.lmk.upgrade_pressure?=40 \
    ro.lmk.downgrade_pressure?=60 \
    ro.lmk.filecache_min_kb?=153600 \
    ro.lmk.thrashing_limit?=30 \
    ro.lmk.thrashing_limit_decay?=50 \
    ro.lmk.log_stats?=false \
    ro.lmk.stall_limit_critical?=40
