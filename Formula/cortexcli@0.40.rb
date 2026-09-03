class CortexcliAT040 < Formula
  desc "Cortex CLI"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.40.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.1/cortexcli-0.38.1-darwin-arm64.tar.gz"
      sha256 "97934ec71f13b85d0bef9d53f39da26ce8f2b8375557b378747bf614ac303a4b"
    end
    on_intel do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.1/cortexcli-0.38.1-darwin-amd64.tar.gz"
      sha256 "64b96a0c582c871ff7010bb82c3477d34c93080e6c826b202a202357be6e387d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.1/cortexcli-0.38.1-linux-arm64.tar.gz"
      sha256 "50f25de08b2668ee0cb5d3f94726871c4f936f1e2ef838c993fa9926c78c9ecb"
    end
    on_intel do
      url "https://github.com/evyatarpalo/paloalto/releases/download/v0.40.1/cortexcli-0.38.1-linux-amd64.tar.gz"
      sha256 "c0d6713cb0be60c41092feb130aa37907a7154d48fab47ef19ff3ba6d2fdce4a"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "cortexcli.pkg" => "cortexcli"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"cortexcli" if OS.mac?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cortexcli --version")
  end
end
