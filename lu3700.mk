#
# Copyright (C) 2009 The Android Open Source Project
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

# Inherit non-open-source blobs.
$(call inherit-product-if-exists, vendor/lge/lu3700/lu3700-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/lu3700/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

PRODUCT_COPY_FILES += \
    device/lge/lu3700/files/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/lge/lu3700/files/media_profiles.xml:system/etc/media_profiles.xml
# Init
PRODUCT_COPY_FILES += \
    device/lge/lu3700/files/initlogo.rle:root/initlogo.rle \
    device/lge/lu3700/files/init.qcom.rc:root/init.qcom.rc \
    device/lge/lu3700/files/init.lu3700.rc:root/init.lu3700.rc \
    device/lge/lu3700/files/init.rc:root/init.rc \
    device/lge/lu3700/files/ueventd.lu3700.rc:root/ueventd.rc

# GPS
PRODUCT_COPY_FILES += \
    device/lge/lu3700/files/gps.conf:system/etc/gps.conf

# Keylayout
PRODUCT_COPY_FILES += \
    device/lge/lu3700/files/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/lu3700/files/lu3700_keypad.kl:system/usr/keylayout/lu3700_keypad.kl

PRODUCT_PACKAGES += \
    librs_jni \
    libmm-omxcore \
    libOmxCore \
    gps.lu3700 \
    lights.lu3700 \
    copybit.lu3700 \
    gadget_id

PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    e2fsck \
    SpareParts

DISABLE_DEXPREOPT := false

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_LOCALES += mdpi

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lge/lu3700/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := lge_lu3700
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := lu3700
PRODUCT_MODEL := LG-LU3700
PRODUCT_MANUFACTURER := LGE
