class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.6"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.6/aarch64-apple-darwin/pepe"
    sha256 "cc9d2a1565fb4a82797f5d743cb2b583cfe44ec023fcfdc15879c22aa7658097"
  else
    url "https://pepe.mhaimdat.com/0.2.6/x86_64-apple-darwin/pepe"
    sha256 "a72678a0e1de44dc6002ae1ddd67ebf1a58cae9ebb147937bdf0fe4ff4669f18"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
