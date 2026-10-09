class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.19.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.19.1/pepe-aarch64-apple-darwin.tar.xz"
      sha256 "d3f3cccd10ae4fb41a9e0ce2f6f073427e7ff04ee1b7f49f5c6a5be928bc84ba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.19.1/pepe-x86_64-apple-darwin.tar.xz"
      sha256 "822de87f8729d2e5c2a93f8362861e22d462b1972d8e01a5cb0851d84d261b58"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.19.1/pepe-aarch64-unknown-linux-musl.tar.xz"
      sha256 "91ad9401477f07fa79b99e41ec5a2de0c2024163805328784ceadd388fe9c7b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.19.1/pepe-x86_64-unknown-linux-musl.tar.xz"
      sha256 "79abe9fcc23aa8128235e7a3e8e261cb9d03efa46fc85ba4e7af54b4e5bbab69"
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
