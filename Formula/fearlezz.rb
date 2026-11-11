class Fearlezz < Formula
  desc "Proof for work done by AI agents"
  homepage "https://github.com/fearlezz-dev/fearlezz"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.1.0/fearlezz-aarch64-apple-darwin.tar.gz"
      sha256 "6dc2f73e7834ae9f66df3db2ce1e6901404beed2847cf2b82e0b7f551ddf27c4"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.1.0/fearlezz-x86_64-apple-darwin.tar.gz"
      sha256 "170217d317ea0f494f33e232e04d307aec0d9bc29bf1949445c6584cdd46a3d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.1.0/fearlezz-aarch64-unknown-linux-musl.tar.gz"
      sha256 "825d157d0c8e46200e20a90d05545a63abff1eeefcfbf060f7a13242565c2deb"
    end
    on_intel do
      url "https://github.com/fearlezz-dev/fearlezz/releases/download/v0.1.0/fearlezz-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3fdd6523b143c8b807a06ab6b4ec8df235c0867d26ddb055ca65493bf293b15"
    end
  end

  def install
    bin.install "fearlezz"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fearlezz --version")
  end
end
