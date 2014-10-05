# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "motion-require"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Clay Allsopp"]
  s.date = "2014-03-04"
  s.description = "Dependency management for RubyMotion, using a pseudo `require`"
  s.email = ["clay@usepropeller.com"]
  s.homepage = "https://github.com/clayallsopp/motion-require"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Dependency management for RubyMotion, using a pseudo `require`"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.5"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.5"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.5"])
  end
end
