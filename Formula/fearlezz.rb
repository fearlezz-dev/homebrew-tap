class Fearlezz < Formula
  desc "Proof for work done by AI agents"
  homepage "https://github.com/fearlezz-dev/fearlezz"
  version "0.5.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.2/fearlezz-aarch64-apple-darwin.tar.gz"
      sha256 "6425dfa032fcb24227b5481dfde4bda56d899307deca8f40cccea482ade992b3"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.2/fearlezz-x86_64-apple-darwin.tar.gz"
      sha256 "9038116aa687081b0f45a6d8c7c8499e627ea79fdb41ba429307e7c8866ef3c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.2/fearlezz-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1e0c454f179ed74498eaa786d01b54ed534644937db5a771e24bf8445491bd25"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.5.2/fearlezz-x86_64-unknown-linux-musl.tar.gz"
      sha256 "65a72efaef3d10d5b70e85f0cc691e11676d8813e4ea8ac0ae99611e55567149"
    end
  end

  def install
    bin.install "fearlezz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fearlezz --version")
  end
end
