class Lx < Formula
  desc "A modern file lister with personality"
  homepage "https://github.com/wjv/lx"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.6.3/lx-aarch64-apple-darwin"
      sha256 "9335d45b53e7de90a61225e29c8e739cbe342f18d136e5b7107841e30992c1f0"
    else
      url "https://github.com/wjv/lx/releases/download/v0.6.3/lx-x86_64-apple-darwin"
      sha256 "53d67ede06280d3c367bdc3f576b5a7b7992fc2f039fd461a1a0e8a40fbe73d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wjv/lx/releases/download/v0.6.3/lx-aarch64-unknown-linux-gnu"
      sha256 "ac3d04fe908a8ce738b671ab9195a140b5e47656dee5b9470b1c3b1e1c2bc936"
    else
      url "https://github.com/wjv/lx/releases/download/v0.6.3/lx-x86_64-unknown-linux-gnu"
      sha256 "3e18f81f2a45b4ea3631bd9d174edbddc3ed5bbf6f287d2bd9a48a3886854cc8"
    end
  end

  def install
    bin.install Dir["lx-*"].first => "lx"
  end

  test do
    assert_match "lx #{version}", shell_output("#{bin}/lx --version")
  end
end
