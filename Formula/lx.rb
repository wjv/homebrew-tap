class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.7.0/lx-aarch64-apple-darwin"
      sha256 "3b94391ad192db798416d471dcb9462187872075ce8edefb95d4412295480cc4"
    else
      url "https://github.com/wjv/lx/releases/download/v0.7.0/lx-x86_64-apple-darwin"
      sha256 "9cc8b823c3b8bc0abcb7d46ab3cf9f62d535070c349d127eb721449a25948b3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.7.0/lx-aarch64-unknown-linux-gnu"
      sha256 "a583a745760a2947d89de2dd52cb8cfbdb5928bb380b65bb2194f15bb0e913d9"
    else
      url "https://github.com/wjv/lx/releases/download/v0.7.0/lx-x86_64-unknown-linux-gnu"
      sha256 "a4ff09e35ff9e115d9be4bc7d8aa5a348974f6cf9c43dd522b3618d5fd3511b9"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.7.0/lx.1"
    sha256 "7917c0b5266caacc5d0c98dd2d23a40bd75f0a5c3c15266c3669282e26330fd3"
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.7.0/lxconfig.toml.5"
    sha256 "f091f3f8c970e2e6f88e66178c66afad2dd0cbbdd8059d6dc449ce571a89acd3"
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
