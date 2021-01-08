
include(begin.m4)
include(centos-repo.m4)
include(libaom.m4)
include(end.m4)dnl

PREAMBLE
FROM OS_NAME:OS_VERSION AS build

INSTALL_CENTOS_REPO(epel-release)
ENABLE_CENTOS_REPO(PowerTools)
INSTALL_CENTOS_RPMFUSION_REPO(OS_VERSION)
INSTALL_CENTOS_OKEY_REPO(OS_VERSION)
INSTALL_CENTOS_RAVEN_RELEASE_REPO(OS_VERSION)

BUILD_ALL()dnl
CLEANUP()dnl

FROM OS_NAME:OS_VERSION
LABEL Description="This is the showcase image for SVT OS_NAME OS_VERSION"
LABEL Vendor="Intel Corporation"
WORKDIR /home

INSTALL_CENTOS_REPO(epel-release)
ENABLE_CENTOS_REPO(PowerTools)
INSTALL_CENTOS_RPMFUSION_REPO(OS_VERSION)
INSTALL_CENTOS_OKEY_REPO(OS_VERSION)
INSTALL_CENTOS_RAVEN_RELEASE_REPO(OS_VERSION)

# Install
INSTALL_ALL(runtime,build)
