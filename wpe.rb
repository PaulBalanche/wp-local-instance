class WpLocalInstance < Formula
    desc ""
    homepage ""
    url "https://github.com/PaulBalanche/wp-local-instance/archive/refs/tags/0.0.9.tar.gz"
    sha256 "77477bfc56f6486cb08f51ac0edf3a9cae7b779ea04d18e1ce070aab811e483b"
    license ""
  
    def install
      system "./configure", *std_configure_args, "--disable-silent-rules"
    end
  
    test do
      system "false"
    end
  end
  