class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.2.4"

  if Hardware::CPU.arm?
    url "https://pepe.mhaimdat.com/0.2.4/aarch64-apple-darwin/pepe"
    sha256 "3884a3af0ff26cd4f9e35cadae8458305ab6f8aee4a8c65cddac3cb64150b389"
  else
    url "https://pepe.mhaimdat.com/0.2.4/x86_64-apple-darwin/pepe"
    sha256 "25c3876bae6f244ec9387770217669615a0d163513f7c584eac872d4d8f5147f"
  end

  def install
    bin.install "pepe"
  end

  test do
    system "#{bin}/pepe", "--version"
  end
end
