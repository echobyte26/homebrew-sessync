class Sessync < Formula
  desc "Cross-device sync for Claude Code agent sessions, with client-side encryption"
  homepage "https://github.com/echobyte26/sessync"
  version "0.7.0"
  url "https://github.com/echobyte26/sessync/releases/download/v#{version}/sessync-v#{version}-macos-universal.tar.gz"
  # Replace with `shasum -a 256 sessync-v0.1.0-macos-universal.tar.gz` output
  # printed by the release workflow (or read from the .sha256 sidecar in the
  # release assets).
  sha256 "de5039131bff574e3ab601a9064c3b2786e944be56f5d46784d184f8192a946c"
  license "MIT"

  depends_on :macos

  def install
    bin.install "sessync"
  end

  def caveats
    <<~EOS
      sessync stores its passphrase in the macOS Keychain. The first time you
      run a sessync command after install, macOS will prompt you to authorize
      access — click "Always Allow" so subsequent commands don't re-prompt.

      Get started:
        sessync init           # configure OSS backend
        sessync init --mock    # OR configure local-fs backend (for smoke tests)

      Two-machine setup is documented at:
        https://github.com/echobyte26/sessync#two-machine-setup
    EOS
  end

  test do
    assert_match "sessync #{version}", shell_output("#{bin}/sessync --version")
  end
end
