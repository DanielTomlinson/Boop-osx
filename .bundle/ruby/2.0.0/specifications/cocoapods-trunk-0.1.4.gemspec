# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cocoapods-trunk"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eloy Dur\u{e1}n"]
  s.date = "2014-07-04"
  s.email = ["eloy.de.enige@gmail.com"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Interact with trunk.cocoapods.org"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nap>, [">= 0.6"])
      s.add_runtime_dependency(%q<json_pure>, ["~> 1.8"])
      s.add_runtime_dependency(%q<netrc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<nap>, [">= 0.6"])
      s.add_dependency(%q<json_pure>, ["~> 1.8"])
      s.add_dependency(%q<netrc>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<nap>, [">= 0.6"])
    s.add_dependency(%q<json_pure>, ["~> 1.8"])
    s.add_dependency(%q<netrc>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
