#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_DEVICE),m4)

LOCAL_PATH := $(call my-dir)
include $(call first-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# Radio Firmware linking
FIRMWARE_RADIO_IMAGES := \
    modem.b00 modem.b01 modem.b02 modem.b03 modem.b04 modem.b05 \
    modem.b06 modem.b07 modem.b08 modem.b09 modem.b10 modem.mdt \
    modem_fw.b00 modem_fw.b01 modem_fw.b02 modem_fw.b03 modem_fw.b04 modem_fw.b05 \
    modem_fw.b09 modem_fw.b10 modem_fw.b11 modem_fw.b12 modem_fw.b13 modem_fw.b15 \
    modem_fw.b16 modem_fw.b23 modem_fw.b24 modem_fw.b25 modem_fw.b27 modem_fw.b28 \
    modem_fw.b31 modem_fw.fli modem_fw.mdt

FIRMWARE_RADIO_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_RADIO_IMAGES)))
$(FIRMWARE_RADIO_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware_radio/$(notdir $@) $(subst modem_f1,modem_fw,$@)

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_RADIO_SYMLINKS)

# Q6 Firmware linking
FIRMWARE_Q6_IMAGES := \
    q6.b00 q6.b01 q6.b03 q6.b04 q6.b05 q6.b06 q6.mdt

FIRMWARE_Q6_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(FIRMWARE_Q6_IMAGES)))
$(FIRMWARE_Q6_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Q6 Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware_q6/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_Q6_SYMLINKS)

endif
