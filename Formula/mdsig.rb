class Mdsig < Formula
  desc "Embedded, append-only signatures for Markdown documents"
  homepage "https://github.com/SHIOZAKI-Shota/md-signature"
  url "https://github.com/SHIOZAKI-Shota/md-signature/archive/c594f6ef816c486dc7156e8557cc5f3f8b06aa20.tar.gz"
  version "0.0.1"
  sha256 "952203a00425bb3ce0c3813e5c4a69c8b8a16b35b46b034609475670331bf914"
  license "MIT"
  head "https://github.com/SHIOZAKI-Shota/md-signature.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/SHIOZAKI-Shota/md-signature/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/mdsig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdsig --version")
  end
end
