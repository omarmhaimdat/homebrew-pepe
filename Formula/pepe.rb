class Pepe < Formula
  desc "HTTP load generator and performance testing tool"
  homepage "https://github.com/omarmhaimdat/pepe"
  version "0.48.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.48.0/pepe-aarch64-apple-darwin.tar.xz"
      sha256 "72166a6762f1d10317ef3318e2985740406c251417b5958bac7e009022dd42cc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.48.0/pepe-x86_64-apple-darwin.tar.xz"
      sha256 "fb33045d97ef800c166d703391dfee05ec06318c1972f86bb4c387239c3dc703"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.48.0/pepe-aarch64-unknown-linux-musl.tar.xz"
      sha256 "9310d51c9a1298b77dce5025cb2aeb0dfbe80995ae51e4898edde1d955ebbb9a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/omarmhaimdat/pepe/releases/download/v0.48.0/pepe-x86_64-unknown-linux-musl.tar.xz"
      sha256 "dd2eea1664a776a4cfe43b51ecc9b8c74b5df9db04203d8bc93af211874b7a1d"
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
