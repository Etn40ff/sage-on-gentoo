# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="Startup scripts for Sage's Notebook server"
HOMEPAGE="http://sagemath.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="sci-mathematics/sage"

pkg_setup() {
	enewuser sage -1 -1 /var/lib/sage sage || die
}

src_prepare() {
	mkdir conf.d || die
	mkdir init.d || die
	cp "${FILESDIR}"/${PN} init.d/${PN} || die "failed to copy file"
	cp "${FILESDIR}"/${PN}.conf conf.d/${PN} || die "failed to copy file"
}

src_install() {
	doinitd init.d/${PN} || die
	doconfd conf.d/${PN} || die
}
