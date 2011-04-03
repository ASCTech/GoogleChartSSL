require 'test/unit'
require 'rack/mock'
require 'rack/test'
require 'fake_web'
require 'google_chart_ssl'

class Test::Unit::TestCase
  include Rack::Test::Methods

	FakeWeb.allow_net_connect = false

	FakeWeb.register_uri(:get, 'http://chart.apis.google.com/chart?chs=50x20',
	                     :body => 'a 50px by 20px PNG image',
	                     :content_type => 'image/png')

	FakeWeb.register_uri(:get, %r{\Ahttp://chart.apis.google.com},
	                     :body => 'some binary PNG data',
	                     :content_type => 'image/png')

  def app
		@app ||= Rack::Builder.app do
			use Rack::Lint
			use GoogleChartSsl
			run lambda {|env| [200, {'Content-Type' => "text/html"}, ['Hello world!']]}
		end
  end

end
