LOCAL_PATH:= $(call my-dir)

llvm_link_SRC_FILES39 := \
  llvm-link.cpp

llvm_link_STATIC_LIBRARIES := \
  libLLVM39Linker \
  libLLVM39IRReader \
  libLLVM39Object \
  libLLVM39MC \
  libLLVM39MCParser \
  libLLVM39BitReader \
  libLLVM39BitWriter \
  libLLVM39AsmParser \
  libLLVM39TransformUtils \
  libLLVM39Analysis \
  libLLVM39Target \
  libLLVM39Core \
  libLLVM39Support

#===---------------------------------------------------------------===
# llvm-link command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES39)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread

include $(LLVM39_HOST_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

#===---------------------------------------------------------------===
# llvm-link command line tool (target)
#===---------------------------------------------------------------===

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES39)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)

include $(LLVM39_DEVICE_BUILD_MK)
include $(LLVM39_GEN_ATTRIBUTES_MK)
include $(BUILD_EXECUTABLE)
endif
