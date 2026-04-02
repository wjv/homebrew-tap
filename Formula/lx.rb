class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.6.1/lx-aarch64-apple-darwin"
      sha256 "79da13da61e3b0ea283760d751dca5f545305781c9d0cb5dbf31652ddf1e8781"
    else
      url "https://github.com/wjv/lx/releases/download/v0.6.1/lx-x86_64-apple-darwin"
      sha256 "96990c532bdb0df39fdc0a4018db37bf4173a7532b230fd02aa34e4edd3b91fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.6.1/lx-aarch64-unknown-linux-gnu"
      sha256 "46324d59cb55f0bbe2351e146063068a0e038bd3b59515830b8a14e5bf26acf0"
    else
      url "https://github.com/wjv/lx/releases/download/v0.6.1/lx-x86_64-unknown-linux-gnu"
      sha256 "0bd762ede42b249143f80864ca98375e5dc7dc968b8e8f2399062e9abddd4eed"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.6.1/lx.1"
    sha256 ""  # TODO: fill once man pages are in release assets
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.6.1/lxconfig.toml.5"
    sha256 ""  # TODO: fill once man pages are in release assets
  end

  def install
    bin.install Dir["lx-*"].first => "lx"
    man1.install resource("man-lx") => "lx.1"
    man5.install resource("man-lxconfig") => "lxconfig.toml.5"
  end

  test do
    assert_match "lx #{version}", shell_output("#{bin}/lx --version")
  end
end
