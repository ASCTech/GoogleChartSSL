# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "google_chart_ssl/version"

Gem::Specification.new do |s|
  s.name        = "google_chart_ssl"
  s.version     = GoogleChartSsl::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Michael Gee"]
  s.email       = ["michaelpgee@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Indirectly serve Google Charts through your SSL connection}
  s.description = %q{Including Google Charts in your SSL-protected site causes warnings about 'Mixed Content' (particularly in Internet Explorer.  This Rack middleware allows you to point those img tags at a local path instead of Google.  The image is retreived by your server then delivered to your client over your SSL connection.}

  s.rubyforge_project = "google_chart_ssl"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
