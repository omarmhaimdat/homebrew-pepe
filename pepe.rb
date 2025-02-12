class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.2"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.2/aarch64-apple-darwin/pepe"
    sha256 "cc335102b0d3203ecb5182a5b3273e55bfe2e20761ddc80fce2bd20c8051fea5"
  else
    url "https://pepe.mhaimdat.com/0.2.2/x86_64-apple-darwin/pepe"
    sha256 "7edecde970d4b42367969d2e9d1574445ee120bae2a21667b0f0540787d40d28"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
