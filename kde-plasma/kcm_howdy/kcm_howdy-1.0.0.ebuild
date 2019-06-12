# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="kcm module for Howdy"

HOMEPAGE="https://github.com/dusekpe2/kcm_howdy/"
SRC_URI="https://github.com/dusekpe2/kcm_howdy/raw/master/kcm_howdy-1.0.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BUILD_DIR=build

src_configure() {
	mkdir ${BUILD_DIR}
	cd ${BUILD_DIR}
	cmake .. -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix`
 
}

src_compile() {
	cd ${BUILD_DIR}
	emake
}

src_install() {
	cd ${BUILD_DIR}
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	elog "Complete"
}
