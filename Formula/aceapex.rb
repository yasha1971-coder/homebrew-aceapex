class Aceapex < Formula
  desc "Parallel block LZ77 compressor with random access (ACEPX2 format)"
  homepage "https://github.com/yasha1971-coder/aceapex"
  url "https://github.com/yasha1971-coder/aceapex/archive/refs/tags/v2.6.4.tar.gz"
  sha256 "d23c4556e13b0230ba8f31a27cbea7f9f45d153787cdef93ca5906a2152ef236"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build # CMake falls back to pkg-config when zstd has no CMake package
  depends_on "zstd"

  def install
    # CMakeLists.txt forces no optimisation flags (std_cmake_args: Release, -O3); the version string is the release's
    # (without it the CLI reports "2.6.4-dev", the default of a source build)
    system "cmake", "-S", ".", "-B", "build",
           "-DCMAKE_CXX_FLAGS=-DACEAPEX_BUILD_ID=\\\"#{version}\\\"",
           *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"in.txt").write("ACEAPEX homebrew test: the same line many times\n" * 2000)
    system bin/"aceapex", "c", "--in", testpath/"in.txt", "--out", testpath/"in.aet"
    system bin/"aceapex", "d", "--in", testpath/"in.aet", "--out", testpath/"out.txt"
    assert_equal (testpath/"in.txt").binread, (testpath/"out.txt").binread
    assert_match version.to_s, shell_output("#{bin}/aceapex --version")
  end
end
