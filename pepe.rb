class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.8"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.8/aarch64-apple-darwin/pepe"
    sha256 "edf6e3672476ba8720484acd33ca8a978b8429e3ebb3662e2e51a93ebced3b2f"
  else
    url "https://pepe.mhaimdat.com/0.2.8/x86_64-apple-darwin/pepe"
    sha256 "587ac435956381b81ff37f213c47e5a106f6a49e480d62153f6656287a3b827c"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
