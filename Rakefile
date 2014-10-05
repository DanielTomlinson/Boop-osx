# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Boop'
  app.identifier = 'lt.danie.hacks.boop'

  app.codesign_certificate = "Mac Developer:  Danielle Lancashire(3K87M24N94)"
  app.codesign_for_development = true

  app.entitlements['com.apple.developer.aps-environment'] = 'development'
  app.entitlements['com.apple.application-identifier'] = "2GC3DM3XAQ.lt.danie.hacks.boop"

  app.frameworks << 'Security'
  app.pods do
    pod 'libqrencode'
    pod 'AFNetworking'
  end

  app.vendor_project 'vendor/qrgen', :static
end

task 'clean_build' => ['clean:all', 'pod:install', 'build']

task :fuck_this do
  exec "cp ./embedded.provisionprofile ./build/MacOSX-10.10-Development/Contents/embedded.provisionprofile"
end