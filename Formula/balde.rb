class Balde < Formula
  desc "Micro framework written in C"
  homepage "https://github.com/balde/balde"
  url "https://github.com/balde/balde/releases/download/v0.1.2/balde-0.1.2.tar.xz"
  sha256 "d73a601479a1b29b26a0722ff2fe8ef38abf0ede04168217c729bb9d7a34915a"

  depends_on "automake"
  depends_on "fcgi"
  depends_on "glib"
  depends_on "peg"
  depends_on "pkg-config"
  depends_on "shared-mime-info"
  depends_on "zlib"

  def install
    ENV['PATH'] = "#{ENV['PATH']}:/usr/local/bin"

    system "./autogen.sh"
    system "./configure", "--prefix", prefix
    system "make", "install"
  end
end
