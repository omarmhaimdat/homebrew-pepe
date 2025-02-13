class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.3"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.3/aarch64-apple-darwin/pepe"
    sha256 "8acd1ee52fbc04febefe64533cfddd7873568e3bccc9fb09dd345d882486c675"
  else
    url "https://pepe.mhaimdat.com/0.2.3/x86_64-apple-darwin/pepe"
    sha256 "5ba517e0308220bd9a2a580f9428ead9f040674af95e20ef40f75903fbde7292"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
