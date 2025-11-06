# Homebrew Formula for DirtreeDraw
# Published at: https://github.com/colinconwell/homebrew-dirtreedraw

class Dirtreedraw < Formula
  desc "Visual directory tree builder with IDE-like interface"
  homepage "https://github.com/colinconwell/DirTreeDraw"
  url "https://registry.npmjs.org/dirtreedraw/-/dirtreedraw-1.1.0.tgz"
  sha256 "6f1c46c87b96ff349daf3eea7823e94eba670a6ddf453bcf0cdff595a3c82e0e"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/dirtreedraw --version")
    assert_match version.to_s, output
  end
end

# Installation:
#   brew install colinconwell/dirtreedraw/dirtreedraw
#
# Or:
#   brew tap colinconwell/dirtreedraw
#   brew install dirtreedraw
#
# Update for new versions:
#   1. Update version in URL
#   2. Calculate new SHA256:
#      curl -sL https://registry.npmjs.org/dirtreedraw/-/dirtreedraw-VERSION.tgz | shasum -a 256
#   3. Update sha256 field
#   4. Commit and push to tap repository
