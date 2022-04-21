# -*- encoding: utf-8 -*-
# stub: swagger-docs 0.2.9 ruby lib

Gem::Specification.new do |s|
  s.name = "swagger-docs".freeze
  s.version = "0.2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rich Hollis".freeze]
  s.date = "2016-08-10"
  s.description = "Generates json files for rails apps to use with swagger-ui".freeze
  s.email = ["richhollis@gmail.com".freeze]
  s.homepage = "https://github.com/richhollis/swagger-docs".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.11".freeze
  s.summary = "Generates swagger-ui json files for rails apps with APIs. You add the swagger DSL to your controller classes and then run one rake task to generate the json files.".freeze

  s.installed_by_version = "3.3.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_development_dependency(%q<appraisal>.freeze, ["~> 1"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 3"])
    s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 10"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 1"])
    s.add_dependency(%q<rails>.freeze, [">= 3"])
    s.add_dependency(%q<activesupport>.freeze, [">= 3"])
  end
end
