# -*- encoding: utf-8 -*-
# stub: bootsy 2.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bootsy"
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Volmer Soares"]
  s.date = "2015-11-20"
  s.description = "A beautiful WYSIWYG editor with image uploads for Rails."
  s.email = ["volmer@radicaos.com"]
  s.homepage = "http://github.com/volmer/bootsy"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "A beautiful WYSIWYG editor with image uploads for Rails."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mini_magick>, ["~> 4.3"])
      s.add_runtime_dependency(%q<carrierwave>, ["~> 0.10"])
      s.add_runtime_dependency(%q<remotipart>, ["~> 1.2"])
    else
      s.add_dependency(%q<mini_magick>, ["~> 4.3"])
      s.add_dependency(%q<carrierwave>, ["~> 0.10"])
      s.add_dependency(%q<remotipart>, ["~> 1.2"])
    end
  else
    s.add_dependency(%q<mini_magick>, ["~> 4.3"])
    s.add_dependency(%q<carrierwave>, ["~> 0.10"])
    s.add_dependency(%q<remotipart>, ["~> 1.2"])
  end
end
