class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.1"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.1/aarch64-apple-darwin/pepe"
    sha256 "08ec537fede771c7454dd2aa373fdef234513a9ba9b94a657dcf1256971ccbdc"
  else
    url "https://pepe.mhaimdat.com/0.2.1/x86_64-apple-darwin/pepe"
    sha256 "3c380c364611ff36d7378c3a421637aef2231abc7fb00f4c90a4e72d7d84744d"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
