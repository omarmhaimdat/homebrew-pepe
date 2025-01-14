class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.1.4"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.1.4/aarch64-apple-darwin/pepe"
    sha256 "25169caaa8c0033fb1f8c6e0cefc644359acde220ee6997d3763c938312c161a"
  else
    url "https://pepe.mhaimdat.com/0.1.4/x86_64-apple-darwin/pepe"
    sha256 "b50ad27e0f41f4e308e4cd5d58e6c6d1deaf9fccbe17f8efeb75001e145d1d2b"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
