class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.40.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.40.0/pepe-aarch64-apple-darwin.tar.xz"
      sha256 "274bbbfa097a96608d00f9f4fbb11362098c885070fccb63286363cc705c1f5d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.40.0/pepe-x86_64-apple-darwin.tar.xz"
      sha256 "52c9917efb793685596af0e63f0a45331fb8ff2ab8eb9c9b26f1f4d7c4d3db75"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.40.0/pepe-aarch64-unknown-linux-musl.tar.xz"
      sha256 "476d310d473e67c8edbf1067e1716e12e63c8061044758ff1fa57ca1106b5d94"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.40.0/pepe-x86_64-unknown-linux-musl.tar.xz"
      sha256 "f304c5c8d136e6e90747e68f0367669e002825fb7b886cef4d05acb11e4d858d"
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
    bash_completion.install "completions/pepe.bash" => "pepe"
    zsh_completion.install "completions/_pepe"
    fish_completion.install "completions/pepe.fish"
    man1.install Dir["man/*.1"]

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files - ["completions", "man"]

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
