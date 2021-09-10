class MambembeCli < Formula
  desc "Authy compatible cli"
  homepage "https://github.com/jaysonsantos/mambembe"
  url "https://github.com/jaysonsantos/mambembe/releases/download/0.1.1/mambembe-cli-with-keyring-0.1.1-x86_64-apple-darwin.zip"
  sha256 "fc102d092b6692759612b781d8a0a1d3bda986b6ddfd723576835d3c3bdfce85"

  def install
    bin.install "mambembe-cli"
  end
end
