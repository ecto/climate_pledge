Gem::Specification.new do |s|
  s.name        = "climate_pledge"
  s.version     = "0.0.1"
  s.summary     = "A client for Climate Pledge data"
  s.description = "A client for Climate Pledge data"
  s.authors     = ["Cam Pedersen"]
  s.email       = "cam@campedersen.com"
  s.files       = ["lib/climate_pledge.rb"]
  s.homepage    =
    "https://rubygems.org/gems/climate_pledge"
  s.license       = "MIT"

  s.add_runtime_dependency "open-uri", "~> 0.4.1"
  s.add_runtime_dependency "json", "~> 2.7.2"
  s.add_runtime_dependency "date", "~> 3.3.4"
  s.add_development_dependency "minitest", "~> 5.22.3"
end
