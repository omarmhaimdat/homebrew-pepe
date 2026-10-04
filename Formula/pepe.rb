class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.13.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.13.0/pepe-aarch64-apple-darwin.tar.xz"
      sha256 "66aedc57f58f9686169c08cd26870e250f357dfe17b295f64cc39d8a6fda20e1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.13.0/pepe-x86_64-apple-darwin.tar.xz"
      sha256 "50c012be7944f7cd6acd94179ca60cf6db80bedfdda530cf3bfaeca55eacbc52"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.13.0/pepe-aarch64-unknown-linux-musl.tar.xz"
      sha256 "21cc037f4d8ad9e040bbbb80ea8cbe4c9688205b873795cdffa948ce4cfcb1a7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.13.0/pepe-x86_64-unknown-linux-musl.tar.xz"
      sha256 "52211dc431e0993ff9a8bd6ad3b764be925befd2d1665f01505fb300943ceafe"
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
