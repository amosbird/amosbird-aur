# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=2.1.0
pkgrel=1
pkgdesc="A Rofi plugin for selecting emojis"
arch=('x86_64')
url="https://github.com/amosbird/rofi-emoji"
license=('BSD')
depends=('rofi')
optdepends=('xsel: X11 support'
            'xclip: X11 support'
            'wl-clipboard: Wayland support')
source=("$pkgname::git+https://github.com/amosbird/rofi-emoji.git")
sha512sums=('SKIP')

build() {
  cd "$pkgname"

  autoreconf -i
  mkdir -p build
  cd build

  ../configure --prefix /usr
  make
}

package() {
  cd "$pkgname/build"

  make DESTDIR="$pkgdir/" install
}
