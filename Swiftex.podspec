Pod::Spec.new do |s|

  s.name         = "Swiftex"
  s.version      = "0.0.7"
  s.summary      = "Swift extensions"

  s.homepage     = "https://github.com/vitkuzmenko/Swiftex"

  s.license      = { :type => "Apache 2.0", :file => "LICENSE" }

  s.author             = { "Vitaliy" => "kuzmenko.v.u@gmail.com" }
  s.social_media_url   = "http://twitter.com/vitkuzmenko"

  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/vitkuzmenko/Swiftex.git", :tag => s.version.to_s }

  s.source_files  = "Extensions/*/*.swift"
  
  s.requires_arc = 'true'

  end