

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=mentohust-v4-proxy
PKG_VERSION:=4.0.0
PKG_RELEASE:=3df2edb93a10d80a88dbc5f1e967d7270f700f2f

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.xz
PKG_SOURCE_URL:=https://github.com/Dark-Existed/mentohust-v4-proxy.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_RELEASE)
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:=Dark-Existed
PKG_LICENSE:=GPL-2.0

PKG_BUILD_DEPENDS:=gettext-full/host

include $(INCLUDE_DIR)/package.mk

define Package/mentohust-v4-proxy/Default
  CATEGORY:=X
  SUBMENU:=Mentohust
  DEPENDS:= +libpcap
endef

define Package/mentohust-v4-proxy
  $(call Package/mentohust-v4-proxy/Default)
  TITLE:=Mentohust V4 proxy
endef

define Package/mentohust-v4-proxy/description
 Mentohust V4 proxy
endef

define Build/Configure
endef

define Package/mentohust-v4-proxy/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mentohust $(1)/usr/sbin/mentohust-v4-proxy
endef

define Build/Configure
	( cd $(PKG_BUILD_DIR); ./autogen.sh )
	$(call Build/Configure/Default)
endef

$(eval $(call BuildPackage,mentohust-v4-proxy))
