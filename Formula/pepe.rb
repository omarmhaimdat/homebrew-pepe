class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.7.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.7.0/pepe-aarch64-apple-darwin.tar.xz"
      sha256 "c01816233e57dfba131217b02c164748052c31aaadbeddeb591e909beb42f90f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.7.0/pepe-x86_64-apple-darwin.tar.xz"
      sha256 "5b4de279acfe0cfc40a7d23d11e51487ac4b488d47d04f6b1b5f8926b745889d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.7.0/pepe-aarch64-unknown-linux-musl.tar.xz"
      sha256 "4e50c56cc1923e6b720f94d8a25b35085cb87f1359b64d125b92fc571e40d880"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.7.0/pepe-x86_64-unknown-linux-musl.tar.xz"
      sha256 "9ed769ffe7989fa57faa1e0620809a27581a93a0f2049c9950c07ddb50abfecb"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "pepe"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "pepe"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "pepe"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "pepe"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
