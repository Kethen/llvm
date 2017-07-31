LOCAL_PATH := $(call my-dir)

LLVM39_ROOT_PATH := $(LOCAL_PATH)/../..


#===---------------------------------------------------------------===
# llvm-readobj command line tool
#===---------------------------------------------------------------===

llvm_readobj_SRC_FILES39 := $(sort $(notdir $(wildcard $(LOCAL_PATH)/*.cpp)))

llvm_readobj_STATIC_LIBRARIES := \
  libLLVM39ARMInfo \
  libLLVM39AArch64Info \
  libLLVM39MipsInfo \
  libLLVM39X86Info \
  libLLVM39DebugInfoCodeView \
  libLLVM39Object \
  libLLVM39BitReader \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39Core \
  libLLVM39Support \

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-readobj
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_IS_HOST_MODULE := true

LOCAL_SRC_FILES := $(llvm_readobj_SRC_FILES39)

LOCAL_STATIC_LIBRARIES := $(llvm_readobj_STATIC_LIBRARIES)

LOCAL_LDLIBS += -lpthread -lm -ldl

include $(LLVM39_ROOT_PATH)/llvm.mk
include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)
