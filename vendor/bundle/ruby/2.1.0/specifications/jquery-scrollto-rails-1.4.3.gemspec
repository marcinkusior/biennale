# -*- encoding: utf-8 -*-
# stub: jquery-scrollto-rails 1.4.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-scrollto-rails"
  s.version = "1.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Colvin"]
  s.date = "2013-09-24"
  s.description = "This provides jQUery scrollTo for your Rails 3 application"
  s.email = ["colvin.john@gmail.com"]
  s.homepage = "https://github.com/JohnColvin/jquery-scrollto-rails"
  s.rubyforge_project = "jquery-scrollto-rails"
  s.rubygems_version = "2.2.2"
  s.summary = "Use jQuery scrollTo with Rails 3"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["< 5.0", "> 3.1"])
    else
      s.add_dependency(%q<railties>, ["< 5.0", "> 3.1"])
    end
  else
    s.add_dependency(%q<railties>, ["< 5.0", "> 3.1"])
  end
end
