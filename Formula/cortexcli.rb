class Cortexcli < Formula
  desc "Cortex CLI"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.40.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.0/cortexcli-0.40.0-darwin-arm64.tar.gz"
      sha256 "cf3bcdb703379655786dc732ed5d9cc3ad68b47883e582c7963c098e07826b37"
    end
    on_intel do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.0/cortexcli-0.40.0-darwin-amd64.tar.gz"
      sha256 "1000a13e9704b2cdc28333c89a2f6d8cdfb8dccc18cce392082944bf893232be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.0/cortexcli-0.40.0-linux-arm64.tar.gz"
      sha256 "c9eb39901425faa3857b597c67d8a8654327b8e4e11ace6c57749f65be19bab0"
    end
    on_intel do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.0/cortexcli-0.40.0-linux-amd64.tar.gz"
      sha256 "76f4d94002410d86190507594af6b3e65020843f3aeb7c21a7820fdeb0e28da7"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "cortexcli"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"cortexcli" if OS.mac?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cortexcli --version")
  end
end
