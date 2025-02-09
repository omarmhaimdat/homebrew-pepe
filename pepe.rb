class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.0/aarch64-apple-darwin/pepe"
    sha256 "f332b5289e0dee3f50c4f61e3da2b1d0b2e54cd901f867038972787220c6b0fe"
  else
    url "https://pepe.mhaimdat.com/0.2.0/x86_64-apple-darwin/pepe"
    sha256 "4c46f0eaa7abe79f213022bd7097d11ab6155c06a74eebb41e9a94c944d4233d"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
