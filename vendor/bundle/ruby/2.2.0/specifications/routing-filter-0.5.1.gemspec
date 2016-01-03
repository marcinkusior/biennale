# -*- encoding: utf-8 -*-
# stub: routing-filter 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "routing-filter"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Sven Fuchs"]
  s.date = "2015-09-01"
  s.description = "Routing filters wraps around the complex beast that the Rails routing system is, allowing for unseen flexibility and power in Rails URL recognition and generation."
  s.email = "svenfuchs@artweb-design.de"
  s.homepage = "http://github.com/svenfuchs/routing-filter"
  s.rubyforge_project = "[none]"
  s.rubygems_version = "2.4.8"
  s.summary = "Routing filters wraps around the complex beast that the Rails routing system is, allowing for unseen flexibility and power in Rails URL recognition and generation"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, ["~> 4.2"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 4.2"])
      s.add_development_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<test_declarative>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.6.2"])
      s.add_development_dependency(%q<rails>, ["~> 4.2"])
    else
      s.add_dependency(%q<actionpack>, ["~> 4.2"])
      s.add_dependency(%q<activesupport>, ["~> 4.2"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<test_declarative>, [">= 0"])
      s.add_dependency(%q<rack-test>, ["~> 0.6.2"])
      s.add_dependency(%q<rails>, ["~> 4.2"])
    end
  else
    s.add_dependency(%q<actionpack>, ["~> 4.2"])
    s.add_dependency(%q<activesupport>, ["~> 4.2"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<test_declarative>, [">= 0"])
    s.add_dependency(%q<rack-test>, ["~> 0.6.2"])
    s.add_dependency(%q<rails>, ["~> 4.2"])
  end
end
