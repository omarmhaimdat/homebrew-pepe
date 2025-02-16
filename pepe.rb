class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.7"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.7/aarch64-apple-darwin/pepe"
    sha256 "aa507abdf356439ac57c64a1672b6aa38edb167e0d6e52f5b72a03dd7f798ae7"
  else
    url "https://pepe.mhaimdat.com/0.2.7/x86_64-apple-darwin/pepe"
    sha256 "a5b113029284f808ebf44de20484436ba595c2f69426b94abc1cbbe6eebd633d"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
