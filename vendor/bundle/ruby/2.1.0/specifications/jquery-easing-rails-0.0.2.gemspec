# -*- encoding: utf-8 -*-
# stub: jquery-easing-rails 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-easing-rails"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrew Kozloff"]
  s.date = "2014-10-22"
  s.description = "Jquery easing plugin for Rails 3.1+ asset pipeline"
  s.email = ["demerest@gmail.com"]
  s.homepage = "https://github.com/rocsci/jquery-easing-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Jquery easing plugin for Rails 3.1+ asset pipeline"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rails>, [">= 3.1.0"])
      s.add_development_dependency(%q<gem-release>, [">= 0.4.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rails>, [">= 3.1.0"])
      s.add_dependency(%q<gem-release>, [">= 0.4.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rails>, [">= 3.1.0"])
    s.add_dependency(%q<gem-release>, [">= 0.4.1"])
  end
end
