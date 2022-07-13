class WpLocalInstance < Formula
    desc ""
    homepage ""
    url "https://github.com/PaulBalanche/wp-local-instance/archive/refs/heads/master.zip"
    version "0.0.9"
    sha256 ""
    license ""
  
    def install
      system "./configure", *std_configure_args, "--disable-silent-rules"
    end
  
    test do
      system "false"
    end
  end
  