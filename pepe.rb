class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.9"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.9/aarch64-apple-darwin/pepe"
    sha256 "0b769a055fe8da0f6b023a7b60b764454d761984f901f1016ec9da5c47170634"
  else
    url "https://pepe.mhaimdat.com/0.2.9/x86_64-apple-darwin/pepe"
    sha256 "71f6539ec1637c07b7ccc4734c1ab543768d319572a6de7c80a44876bb7bebe3"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
