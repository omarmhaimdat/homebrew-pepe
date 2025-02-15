class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.5"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.5/aarch64-apple-darwin/pepe"
    sha256 "d972ab04774c88a6a52532ce602052a173334f2cc2f0decbc3c15709d043885c"
  else
    url "https://pepe.mhaimdat.com/0.2.5/x86_64-apple-darwin/pepe"
    sha256 "cef073c2427e71b97a6e60d38eb8750349f2a7767565f226b1ebcf585cf2f21f"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
