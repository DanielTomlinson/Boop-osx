# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "afmotion"
  s.version = "2.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Clay Allsopp"]
  s.date = "2014-09-06"
  s.description = "A RubyMotion Wrapper for AFNetworking"
  s.email = ["clay.allsopp@gmail.com"]
  s.homepage = "https://github.com/clayallsopp/AFMotion"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "A RubyMotion Wrapper for AFNetworking"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<motion-cocoapods>, [">= 1.4.1"])
      s.add_runtime_dependency(%q<motion-require>, [">= 0.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<webstub>, [">= 0"])
    else
      s.add_dependency(%q<motion-cocoapods>, [">= 1.4.1"])
      s.add_dependency(%q<motion-require>, [">= 0.1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<webstub>, [">= 0"])
    end
  else
    s.add_dependency(%q<motion-cocoapods>, [">= 1.4.1"])
    s.add_dependency(%q<motion-require>, [">= 0.1"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<webstub>, [">= 0"])
  end
end
