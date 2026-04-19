class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.9.0/lx-aarch64-apple-darwin"
      sha256 "5cdfb8f32088ef97de693c943f2449d3005bfb44e5e7c3f6d6ca38bc7d1c778e"
    else
      url "https://github.com/wjv/lx/releases/download/v0.9.0/lx-x86_64-apple-darwin"
      sha256 "7af76d3880c87af09f339e3e8e68022e6189e89d7a9485e26d2094d3795d7e49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.9.0/lx-aarch64-unknown-linux-gnu"
      sha256 "b835d23dc793dbdaad0eb571d9d4eed3db7e6c06a2a7cd2ee80068e6b1b15de9"
    else
      url "https://github.com/wjv/lx/releases/download/v0.9.0/lx-x86_64-unknown-linux-gnu"
      sha256 "56facbdf976c716e74493a2bcb6d67d4297e4d832144e1debc8caa0a8f0ab8c5"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.9.0/lx.1"
    sha256 "657e5c3a6142743e490cfbc1b9ddaa171302636de31ab0e12ca2929f190c05ad"
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.9.0/lxconfig.toml.5"
    sha256 "35290a8b09f97ff0b537f3c756edabe6e5a5823ce337ff62ae6e2876b83f9484"
  end

  def install
    bin.install Dir["lx-*"].first => "lx"
    resource("man-lx").stage { man1.install "lx.1" }
    resource("man-lxconfig").stage { man5.install "lxconfig.toml.5" }
  end

  test do
    assert_match "lx #{version}", shell_output("#{bin}/lx --version")
  end
end
