class Fearlezz < Formula
  desc "Proof for work done by AI agents"
  homepage "https://github.com/fearlezz-dev/fearlezz"
  version "0.5.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.3/fearlezz-aarch64-apple-darwin.tar.gz"
      sha256 "5b8465e982600c805eb56a9036904e6a497a0609e7e2b604e08346468329082d"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.3/fearlezz-x86_64-apple-darwin.tar.gz"
      sha256 "d0d0f92eca9790cdfd8fecc86edcf5d7ca999f04531199302df6a7bb45ad348f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.3/fearlezz-aarch64-unknown-linux-musl.tar.gz"
      sha256 "077e0dd1f6eb91337e40693b030f5921e032f98ec27c9e85e41ff5e57f85dc4a"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.3/fearlezz-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8699a8c7cc893e57ee524f9d3789cf98dac4b8eb943cfa7e0fd4ba9ca68d2252"
    end
  end

  def install
    bin.install "fearlezz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fearlezz --version")
  end
end
