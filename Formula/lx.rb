class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.10.0/lx-aarch64-apple-darwin"
      sha256 "e21a95294ec1332de27b449dad68f54b1ee37e0b67129fb529dc6fcbdb444da0"
    else
      url "https://github.com/wjv/lx/releases/download/v0.10.0/lx-x86_64-apple-darwin"
      sha256 "068e01184108a46f473360ed241aabfb6547aa9e88d62706b5a7729be4e68edb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.10.0/lx-aarch64-unknown-linux-gnu"
      sha256 "cf5b965dbcf8385de94a35957f2bee1117234c40f500cafdc5b52757fafe2f16"
    else
      url "https://github.com/wjv/lx/releases/download/v0.10.0/lx-x86_64-unknown-linux-gnu"
      sha256 "0300e308b720ddb85e7f2f9bf2389d0d12b56f73f965321303c712fef756daf0"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.10.0/lx.1"
    sha256 "59d80795b79e3a648a3e5718b3a2af2ea47873d9e63bd2dbf51485f666daaa71"
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.10.0/lxconfig.toml.5"
    sha256 "67b5eaf67aaeebe5326b3d1c17cf45f9a08226338c8090c4481c7250b993a39a"
  end

  def install
    bin.install Dir["lx-*"].first => "lx"
    resource("man-lx").stage { man1.install "lx.1" }
    resource("man-lxconfig").stage { man5.install "lxconfig.toml.5" }

    generate_completions_from_executable(bin/"lx", "--completions")
  end

  test do
    assert_match "lx #{version}", shell_output("#{bin}/lx --version")
  end
end
