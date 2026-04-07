class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.8.0/lx-aarch64-apple-darwin"
      sha256 "3e6d86103fb9ee993508025670f72fe23560cc6ab23c387a3c5952767149242a"
    else
      url "https://github.com/wjv/lx/releases/download/v0.8.0/lx-x86_64-apple-darwin"
      sha256 "b0f72269fc906fba664fa25b720e0fbccb4713c863901123b16025d5986f9bac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.8.0/lx-aarch64-unknown-linux-gnu"
      sha256 "594e158d14505cfec10140ef1e65c3ba039c795f84f68104d9ff1ff9f06ed7dc"
    else
      url "https://github.com/wjv/lx/releases/download/v0.8.0/lx-x86_64-unknown-linux-gnu"
      sha256 "d55c59f6a83748f8e44a084311521d30fa141785b9eb6cfd7a1dc34681e24569"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.8.0/lx.1"
    sha256 "b18713648a69737d0b8d0c41dbbc7e8294b440c64f1c671aa0e847ef93cdf3c9"
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.8.0/lxconfig.toml.5"
    sha256 "9b7afcbbacb3094b8c2d862b4fb38b1889cde83ae84910868a0a98b6a5a7c361"
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
