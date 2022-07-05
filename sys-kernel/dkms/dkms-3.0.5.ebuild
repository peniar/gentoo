# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dynamic Kernel Module Support"
HOMEPAGE="https://github.com/dell/dkms"
SRC_URI="https://github.com/dell/dkms/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -i "/gzip -9 \$(MAN)\/dkms\.8/d" Makefile
	sed -i "/eval \$sign_file/s/eval/\[\[ -x \$sign_file \]\] \&\& eval/" dkms.in

	default
}

src_compile() {
	einfo "Skipping compilation."
}

src_install() {
	default

	keepdir /var/lib/${PN}
}

