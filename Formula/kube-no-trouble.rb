class KubeNoTrouble < Formula
  desc "Easily check your clusters for use of deprecated APIs"
  homepage "https://www.doit-intl.com"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  version = "0.5.1"
  url "https://github.com/doitintl/kube-no-trouble/releases/download/#{version}/kubent-#{version}-darwin-#{arch}.tar.gz"
  if Hardware::CPU.intel?
    sha256 "451ebcaa3993091629892f9f6a3d67f94d84d3eade4ae5c888735d1a66b918b1" 
  else
    sha256 "5fc0fae3d9c693fa52234ba2a1a4cfe0871e591204bd49cf06526d0416eecd29"
  end
  license "MIT"

  def install
    bin.install "kubent"
  end
end
