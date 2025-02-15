class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.7"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.7/aarch64-apple-darwin/pepe"
    sha256 "70e01404574b78b9d3a7877defc330ad57cdb705e2af8d4265e36cff0cc7f465"
  else
    url "https://pepe.mhaimdat.com/0.2.7/x86_64-apple-darwin/pepe"
    sha256 "9de2dade55dcb5ff255bd51cc64ce70cff660929f44db69b38f3162dd33cdb79"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
