# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit flag-o-matic

MY_P="rubiks-${PV}"

DESCRIPTION="Dik T. Winter's rubik's cube solver and related tools"
HOMEPAGE="http://www.sagemath.org"
SRC_URI="mirror://sageupstream/rubiks/${MY_P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

RESTRICT=primaryuri

DEPEND=""
RDEPEND=""

PATCHES=(
	"${FILESDIR}"/${PN}-20070912_p10-fix-missing-includes.patch
	"${FILESDIR}"/${PN}-20070912_p10-fix-LDFLAGS.patch
	)

S="${WORKDIR}"/${MY_P}/dik

src_compile() {
	append-cflags -DLARGE_MEM -DVERBOSE

	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" all
}

src_install() {
	dobin dikcube size222 size333c sizesquare sizedom sizekoc1 sizekoc2
	dodoc README
}
