# Homebrew Formula for DirtreeDraw
# This is a template - update URLs and SHA256 after publishing to npm

class Dirtreedraw < Formula
  desc "Visual directory tree builder with IDE-like interface"
  homepage "https://github.com/colinconwell/DirTreeDraw"
  url "https://registry.npmjs.org/dirtreedraw/-/dirtreedraw-1.0.0.tgz"
  sha256 "d76041e9329880f1b6ab88ab29925944a236cc66cc264d897ad39b3995216942"
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

# Instructions for publishing:
#
# 1. Publish to npm first:
#    npm publish
#
# 2. Get the tarball URL:
#    https://registry.npmjs.org/dirtreedraw/-/dirtreedraw-VERSION.tgz
#
# 3. Calculate SHA256:
#    curl -sL https://registry.npmjs.org/dirtreedraw/-/dirtreedraw-1.0.0.tgz | shasum -a 256
#
# 4. Update this formula with correct URL and SHA256
#
# 5. Create a tap repository:
#    mkdir homebrew-dirtreedraw
#    cp dirtreedraw.rb homebrew-dirtreedraw/Formula/
#    cd homebrew-dirtreedraw
#    git init && git add . && git commit -m "Initial formula"
#    git remote add origin git@github.com:colinconwell/homebrew-dirtreedraw.git
#    git push -u origin main
#
# 6. Users can then install with:
#    brew tap colinconwell/dirtreedraw
#    brew install dirtreedraw
#
# Or in one command:
#    brew install colinconwell/dirtreedraw/dirtreedraw
