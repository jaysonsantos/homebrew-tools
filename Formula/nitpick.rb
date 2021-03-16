class Nitpick < Formula
    desc "Enforce the same settings across multiple language-independent projects."
    homepage "https://github.com/andreoliwa/nitpick"
    url "https://filebin.xyz/vpdPUKPufTAMxqGAYISGCf3r"
    head "https://github.com/andreoliwa/nitpick.git"
    sha256 "ceacdb6f24a3c26b9260552b3ae0c011c07ab6c4063e4acbda84fdeac081e01e"
    version "0.0.0"
  
    # This depends won't work
    # depends_on :codesign => [:identity => "-"]
    def sign(f)
        system "/usr/bin/codesign", "-f", "-s", "-", f
    end

    def install
        sign "nitpick"
        Dir.glob(["**/*.so", "**/*.dylib"]).map { |lib| sign lib}
        libexec.install Dir["*"]
        (libexec/"nitpick").chmod 0755
        
        nitpick_bin = (bin/"nitpick")
        nitpick_bin.write <<~EOS
            #!/bin/sh
            #{libexec/"nitpick"} $@
        EOS
        nitpick_bin.chmod 0755
    end
  end
  