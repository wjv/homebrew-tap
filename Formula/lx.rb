class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.7.1/lx-aarch64-apple-darwin"
      sha256 "5613861a1413f184b8e23f6966826b0e1c6775021566079f6883e49ed5d748a1"
    else
      url "https://github.com/wjv/lx/releases/download/v0.7.1/lx-x86_64-apple-darwin"
      sha256 "5fc57f84e2f1b255ae8dae5e7b7bc85b4f1bf761b1df8d63ce9bbba8bbd028f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.7.1/lx-aarch64-unknown-linux-gnu"
      sha256 "3cb28ef188da64fbda143c7ca8a3501e9e26ec39fc5b776e92956b5afe53cc0f"
    else
      url "https://github.com/wjv/lx/releases/download/v0.7.1/lx-x86_64-unknown-linux-gnu"
      sha256 "243c9d1c6eccef8924ed95b822fa8f186b49c75b1f9fba4984b8e5c9f6d36d23"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.7.1/lx.1"
    sha256 "7917c0b5266caacc5d0c98dd2d23a40bd75f0a5c3c15266c3669282e26330fd3"
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.7.1/lxconfig.toml.5"
    sha256 "f091f3f8c970e2e6f88e66178c66afad2dd0cbbdd8059d6dc449ce571a89acd3"
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
