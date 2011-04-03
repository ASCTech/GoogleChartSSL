class Autotest::Testunit < Autotest
  def initialize
    super

    @test_mappings = {
      %r[^test/.*\_test.rb$] => proc { |filename, _|
        filename
      },
      %r[^lib/(.*)\.rb$] => proc { |_, m|
        "test/#{m[1]}_test.rb"
      },
      %r[^test/helper.rb$] => proc {
        files_matching %r[^test/.*_test\.rb$]
      },
    }
  end

  # Given the string filename as the path, determine
  # the corresponding tests for it, in an array.
  def tests_for_file(filename)
    super.select { |f| @files.has_key? f }
  end
end
