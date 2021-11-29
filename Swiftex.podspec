Pod::Spec.new do |s|

  s.name         = "Swiftex"
  s.version      = "0.2.14"
  s.summary      = "Swift extensions"

  s.homepage     = "https://github.com/vitkuzmenko/Swiftex.git"

  s.license      = { :type => "Apache 2.0", :file => "LICENSE" }

  s.author             = { "Vitaliy" => "kuzmenko.v.u@gmail.com" }
  s.social_media_url   = "http://twitter.com/vitkuzmenko"

  s.swift_version = '5'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'

  s.source       = { :git => s.homepage, :tag => s.version.to_s }

  s.source_files  = "Extensions/*/*.swift"
  
  s.requires_arc = 'true'

  end
