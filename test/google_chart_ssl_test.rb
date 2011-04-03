require File.expand_path('../helper', __FILE__)

class GoogleChartSslTest < Test::Unit::TestCase

	def setup
		mock_app
	end

	def test_output_some_debug_statements
		get 'http://www.example.org/hello'
		assert_equal 200, last_response.status
		assert_equal 'Hello world!', last_response.body
	end

end
