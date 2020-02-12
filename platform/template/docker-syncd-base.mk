# docker image for syncd


DOCKER_SYNCD_BASE_STEM = docker-syncd-$(DOCKER_SYNCD_PLATFORM_CODE)
DOCKER_SYNCD_BASE = $(DOCKER_SYNCD_BASE_STEM).gz
DOCKER_SYNCD_BASE_DBG = $(DOCKER_SYNCD_BASE_STEM)-$(DBG_IMAGE_MARK).gz

$(DOCKER_SYNCD_BASE)_PATH = $(PLATFORM_PATH)/docker-syncd-$(DOCKER_SYNCD_PLATFORM_CODE)

$(DOCKER_SYNCD_BASE)_FILES += $(SUPERVISOR_PROC_EXIT_LISTENER_SCRIPT)

$(DOCKER_SYNCD_BASE)_LOAD_DOCKERS += $(DOCKER_CONFIG_ENGINE_STRETCH)

$(DOCKER_SYNCD_BASE)_DBG_DEPENDS += $($(DOCKER_CONFIG_ENGINE_STRETCH)_DBG_DEPENDS)

$(DOCKER_SYNCD_BASE)_DBG_IMAGE_PACKAGES = $($(DOCKER_CONFIG_ENGINE_STRETCH)_DBG_IMAGE_PACKAGES)

SONIC_DOCKER_IMAGES += $(DOCKER_SYNCD_BASE)
SONIC_STRETCH_DOCKERS += $(DOCKER_SYNCD_BASE)
ifneq ($(ENABLE_SYNCD_RPC),y)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_SYNCD_BASE)
endif

SONIC_DOCKER_DBG_IMAGES += $(DOCKER_SYNCD_BASE_DBG)
SONIC_STRETCH_DBG_DOCKERS += $(DOCKER_SYNCD_BASE_DBG)
ifneq ($(ENABLE_SYNCD_RPC),y)
SONIC_INSTALL_DOCKER_DBG_IMAGES += $(DOCKER_SYNCD_BASE_DBG)
endif


$(DOCKER_SYNCD_BASE)_CONTAINER_NAME = syncd
$(DOCKER_SYNCD_BASE)_RUN_OPT += --privileged -t
$(DOCKER_SYNCD_BASE)_RUN_OPT += -v /host/machine.conf:/etc/machine.conf
$(DOCKER_SYNCD_BASE)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro

