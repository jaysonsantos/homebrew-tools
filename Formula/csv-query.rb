class CsvQuery < Formula
  desc "Run SQL queries over CSV files"
  homepage "https://github.com/jaysonsantos/csv-query-rs"
  url "https://github.com/jaysonsantos/csv-query-rs/archive/0.5.0.tar.gz"
  sha256 "e320f698c71354e581db5611b5ac10ac4b642d0cf048f0724380c4d664b1cec2"

  depends_on "sqlite"
  depends_on "rust" => :build

  def install
    Dir.chdir "csv-query-cli"
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
