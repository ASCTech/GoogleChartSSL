require File.expand_path('../helper', __FILE__)

class GoogleChartSslTest < Test::Unit::TestCase

	def test_regular_requests_go_to_the_main_application
		get '/hello'
		assert_equal 200, last_response.status
		assert_equal 'text/html', last_response.headers['Content-Type']
		assert_equal 'Hello world!', last_response.body
	end

	def test_requsts_to_our_path_go_to_google
		get '/google_chart'
		assert_equal 200, last_response.status
		assert_equal 'image/png', last_response.headers['Content-Type']
		assert_equal '20', last_response.headers['Content-Length']
		assert_equal 'some binary PNG data', last_response.body
	end

	def test_requsts_with_a_png_extension_work_too
		get '/google_chart.png'
		assert_equal 200, last_response.status
		assert_equal 'image/png', last_response.headers['Content-Type']
		assert_equal '20', last_response.headers['Content-Length']
		assert_equal 'some binary PNG data', last_response.body
	end

	def test_the_query_string_is_passed_to_google
		get '/google_chart?chs=50x20'
		assert_equal 200, last_response.status
		assert_equal 'image/png', last_response.headers['Content-Type']
		assert_equal '24', last_response.headers['Content-Length']
		assert_equal 'a 50px by 20px PNG image', last_response.body
	end

end
