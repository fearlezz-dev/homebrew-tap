class Fearlezz < Formula
  desc "Proof for work done by AI agents"
  homepage "https://github.com/fearlezz-dev/fearlezz"
  version "0.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.1/fearlezz-aarch64-apple-darwin.tar.gz"
      sha256 "fc406ff584a6fe854870042d1331945df0293fdc9b45d7fce710f6c563e618d6"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.1/fearlezz-x86_64-apple-darwin.tar.gz"
      sha256 "4b5351b2735e87cd347fb6601dc135d20f0f6aae7def453796b46cc18d55d11b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.1/fearlezz-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d2c6035e54644b5a21ed2518e58e6e0a24859206ec2ada7850998b85434a13c6"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.1/fearlezz-x86_64-unknown-linux-musl.tar.gz"
      sha256 "39df3715fe1cf7b8342eb5072b00e8c8c1c0d69fdd0ad1c1bae764b70f7fa26d"
    end
  end

  def install
    bin.install "fearlezz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fearlezz --version")
  end
end
