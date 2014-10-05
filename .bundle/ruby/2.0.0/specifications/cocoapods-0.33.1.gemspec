# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cocoapods"
  s.version = "0.33.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eloy Duran", "Fabio Pelosin"]
  s.date = "2014-05-20"
  s.description = "CocoaPods manages library dependencies for your Xcode project.\n\nYou specify the dependencies for your project in one easy text file. CocoaPods resolves dependencies between libraries, fetches source code for the dependencies, and creates and maintains an Xcode workspace to build your project.\n\nUltimately, the goal is to improve discoverability of, and engagement in, third party open-source libraries, by creating a more centralized ecosystem."
  s.email = ["eloy.de.enige@gmail.com", "fabiopelosin@gmail.com"]
  s.executables = ["pod", "sandbox-pod"]
  s.files = ["bin/pod", "bin/sandbox-pod"]
  s.homepage = "https://github.com/CocoaPods/CocoaPods"
  s.licenses = ["MIT"]
  s.post_install_message = "\nCHANGELOG:\n\n## 0.33.1\n\n##### Bug Fixes\n\n* Fix `pod spec lint` for `json` podspecs.  \n  [Fabio Pelosin][irrationalfab]\n  [#2157](https://github.com/CocoaPods/CocoaPods/issues/2157)\n\n* Fixed downloader issues related to `json` podspecs.  \n  [Fabio Pelosin][irrationalfab]\n  [#2158](https://github.com/CocoaPods/CocoaPods/issues/2158)\n\n* Fixed `--no-ansi` flag in help banners.  \n  [Fabio Pelosin][irrationalfab]\n  [#34](https://github.com/CocoaPods/CLAide/issues/34)\n\n"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.0.14"
  s.summary = "An Objective-C library package manager."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cocoapods-core>, ["= 0.33.1"])
      s.add_runtime_dependency(%q<claide>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<xcodeproj>, ["~> 0.17.0"])
      s.add_runtime_dependency(%q<cocoapods-downloader>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<cocoapods-plugins>, ["~> 0.2.0"])
      s.add_runtime_dependency(%q<cocoapods-try>, ["~> 0.3.0"])
      s.add_runtime_dependency(%q<cocoapods-trunk>, ["~> 0.1.1"])
      s.add_runtime_dependency(%q<colored>, ["~> 1.2"])
      s.add_runtime_dependency(%q<escape>, ["~> 0.0.4"])
      s.add_runtime_dependency(%q<json_pure>, ["~> 1.8"])
      s.add_runtime_dependency(%q<open4>, ["~> 1.3"])
      s.add_runtime_dependency(%q<activesupport>, ["< 4", ">= 3.2.15"])
      s.add_runtime_dependency(%q<nap>, ["~> 0.7"])
      s.add_development_dependency(%q<bacon>, ["~> 1.1"])
    else
      s.add_dependency(%q<cocoapods-core>, ["= 0.33.1"])
      s.add_dependency(%q<claide>, ["~> 0.6.1"])
      s.add_dependency(%q<xcodeproj>, ["~> 0.17.0"])
      s.add_dependency(%q<cocoapods-downloader>, ["~> 0.6.1"])
      s.add_dependency(%q<cocoapods-plugins>, ["~> 0.2.0"])
      s.add_dependency(%q<cocoapods-try>, ["~> 0.3.0"])
      s.add_dependency(%q<cocoapods-trunk>, ["~> 0.1.1"])
      s.add_dependency(%q<colored>, ["~> 1.2"])
      s.add_dependency(%q<escape>, ["~> 0.0.4"])
      s.add_dependency(%q<json_pure>, ["~> 1.8"])
      s.add_dependency(%q<open4>, ["~> 1.3"])
      s.add_dependency(%q<activesupport>, ["< 4", ">= 3.2.15"])
      s.add_dependency(%q<nap>, ["~> 0.7"])
      s.add_dependency(%q<bacon>, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<cocoapods-core>, ["= 0.33.1"])
    s.add_dependency(%q<claide>, ["~> 0.6.1"])
    s.add_dependency(%q<xcodeproj>, ["~> 0.17.0"])
    s.add_dependency(%q<cocoapods-downloader>, ["~> 0.6.1"])
    s.add_dependency(%q<cocoapods-plugins>, ["~> 0.2.0"])
    s.add_dependency(%q<cocoapods-try>, ["~> 0.3.0"])
    s.add_dependency(%q<cocoapods-trunk>, ["~> 0.1.1"])
    s.add_dependency(%q<colored>, ["~> 1.2"])
    s.add_dependency(%q<escape>, ["~> 0.0.4"])
    s.add_dependency(%q<json_pure>, ["~> 1.8"])
    s.add_dependency(%q<open4>, ["~> 1.3"])
    s.add_dependency(%q<activesupport>, ["< 4", ">= 3.2.15"])
    s.add_dependency(%q<nap>, ["~> 0.7"])
    s.add_dependency(%q<bacon>, ["~> 1.1"])
  end
end
