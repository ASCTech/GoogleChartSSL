require 'test/unit'
require 'rack/mock'
require 'rack/test'
require 'google_chart_ssl'

class Test::Unit::TestCase
  include Rack::Test::Methods

	attr_reader :app

  def mock_app(options = {})
    main_app = lambda { |env|
      request = Rack::Request.new(env)
      [200, {'Content-Type' => "text/html"}, ['Hello world!']]
    }

		@app = Rack::Builder.app do
			use Rack::Lint
			use GoogleChartSsl
			run main_app
		end
  end

end
