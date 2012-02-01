require 'net/http'

class GoogleChartSsl

  def initialize(app, options = {})
    @app, @options = app, options
  end

  Google = Net::HTTP.new('chart.apis.google.com', 80)

  def call(env)
    @req = Rack::Request.new(env)
    if @req.path =~ %r[/google_chart(\.png)?\z]
      path = '/chart?' + @req.query_string
      resp = Google.request(Net::HTTP::Get.new(path))
      headers = {
        'Content-Length' => resp.content_length.to_s,
        'Content-Type' => resp.content_type,
      }
      [resp.code, headers, [resp.body]]
    else
      @app.call(env)
    end
  end

end
