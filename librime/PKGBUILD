# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

_pkgname=librime
pkgname=$_pkgname-git
pkgver=1.5.3.r35.g19596af2
pkgrel=1
epoch=1
pkgdesc="Rime input method engine with plugins"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'capnproto' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'lua' 'google-glog' 'marisa')
makedepends=('cmake' 'boost' 'git' 'gtest' 'gmock' 'ninja')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/amosbird/librime.git"
        "git+https://github.com/lotem/librime-octagram"
        "git+https://github.com/rime/librime-charcode"
        "git+https://github.com/amosbird/librime-lua")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd $_pkgname/plugins
  rm -rf librime-*
  ln -sf ../../librime-* .
}

pkgver() {
  cd $_pkgname
  echo 99999.$(git describe --long --tags | sed 's/^rime-//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd $_pkgname
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off -DENABLE_EXTERNAL_PLUGINS=On
  cmake --build build
}

check() {
  cd $_pkgname/build
  ninja test
}

package() {
  cd $_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
