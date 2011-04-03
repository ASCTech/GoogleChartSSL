class GoogleChartSsl

	def initialize(app, options = {})
		@app, @options = app, options
	end

	def call(env)
		@req = Rack::Request.new(env)
		puts "path: #{@req.path}"
		puts "query_string: #{@req.query_string}"

		@app.call(env)
	end

end
