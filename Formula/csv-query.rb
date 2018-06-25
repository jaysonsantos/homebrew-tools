class CsvQuery < Formula
  desc "Run SQL queries over CSV files"
  homepage "https://github.com/jaysonsantos/csv-query-rs"
  url "https://github.com/jaysonsantos/csv-query-rs/archive/0.1.0.tar.gz"
  sha256 "159e78bffe3692a949683f769dad46ced23984ed981bcbd6e1efa842ad4492cd"

  depends_on "sqlite"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
    test_file = "#{testpath}/test.csv"
    File.open(test_file, "w") do |file|
      file.write("name;age\njohn;10\nclara;30\njohn;20")
    end
    system "#{bin}/csv-query", "--files", test_file, "-q", "select 1"
  end
end
