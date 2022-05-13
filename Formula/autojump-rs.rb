class AutojumpRs < Formula
  desc "A fast drop-in replacement of autojump written in Rust"
  homepage "https://github.com/xen0n/autojump-rs"
  url "https://github.com/xen0n/autojump-rs/releases/download/0.4.0/autojump-0.4.0-x86_64-apple-darwin.tar.gz"
  sha256 "009e8efb66daef6f889000ee26fedffc2df21a074eae408abd7e03b78bfc2b15"

  resource "repo" do
    # current develop
    url "https://github.com/xen0n/autojump-rs/archive/fa1cf88282c48a1618d6d1419d30d44be0f4efda.tar.gz"
    sha256 "90979f60b9b2a29262d47d38180705734bad7fc4ffd9d4451f43129133c422bf"
  end

  def install
    bin.install "autojump"
    resource("repo").stage do
      pkgshare.install Dir["integrations/*"]
    end
  end
end
