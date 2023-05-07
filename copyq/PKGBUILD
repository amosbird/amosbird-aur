pkgname=copyq-git
pkgver=r99999.4.1.0
pkgrel=9
epoch=1
pkgdesc="Clipboard manager with searchable and editable history"
url="https://github.com/amosbird/${pkgname}"
depends=('hicolor-icon-theme' 'qt5-svg' 'qt5-wayland' 'knotifications')
makedepends=('extra-cmake-modules' 'qt5-tools')
license=('GPL3')
arch=('x86_64')
provides=("copyq=${pkgver%%.r*}-${pkgrel}")
conflicts=('copyq')
source=("$pkgname::git+https://github.com/amosbird/CopyQ.git")
md5sums=('SKIP')

build() {
    cmake -B build -S copyq-git -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r99999.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
