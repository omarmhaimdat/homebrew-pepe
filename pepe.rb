class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.1.5"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.1.5/aarch64-apple-darwin/pepe"
    sha256 "70cc5af5c12cf2b0575d89bbea5dec873b497d8b3027fd77469575a20067ee04"
  else
    url "https://pepe.mhaimdat.com/0.1.5/x86_64-apple-darwin/pepe"
    sha256 "c391199f9a6ff98120288e5878a05208c17ae353b49762bca0237608e05104e3"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
