class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.10.1/lx-aarch64-apple-darwin"
      sha256 "1b5ed904940f8a1e926d80f6485c605af6f1b9c9611b4bae23fdaf3342c6fd5b"
    else
      url "https://github.com/wjv/lx/releases/download/v0.10.1/lx-x86_64-apple-darwin"
      sha256 "c692990d6bcaeac4f1bf285d093cb0fddf161f3e24e5fa8954886fb6afe39a63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.10.1/lx-aarch64-unknown-linux-gnu"
      sha256 "0468b41f4355084d32f6046e57a35d9e6003c9c8eca7e2face563c580b3dae1b"
    else
      url "https://github.com/wjv/lx/releases/download/v0.10.1/lx-x86_64-unknown-linux-gnu"
      sha256 "79c6c774c25b63175f550266d8ee6d68f0b73a883f1000db5f87c9f8a8853f16"
    end
  end

  resource "man-lx" do
    url "https://github.com/wjv/lx/releases/download/v0.10.1/lx.1"
    sha256 "59d80795b79e3a648a3e5718b3a2af2ea47873d9e63bd2dbf51485f666daaa71"
  end

  resource "man-lxconfig" do
    url "https://github.com/wjv/lx/releases/download/v0.10.1/lxconfig.toml.5"
    sha256 "67b5eaf67aaeebe5326b3d1c17cf45f9a08226338c8090c4481c7250b993a39a"
  end

  def install
    bin.install Dir["lx-*"].first => "lx"
    chmod 0755, bin/"lx"
    resource("man-lx").stage { man1.install "lx.1" }
    resource("man-lxconfig").stage { man5.install "lxconfig.toml.5" }

    generate_completions_from_executable(bin/"lx", "--completions")
  end

  test do
    assert_match "lx #{version}", shell_output("#{bin}/lx --version")
  end
end
