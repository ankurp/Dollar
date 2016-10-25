Pod::Spec.new do |s|
  s.name         = "Dollar"
  s.version      = "6.1.0"
  s.summary      = "A functional tool-belt for Swift Language"
  s.homepage     = "https://github.com/ankurp/Dollar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Dollar.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/*.{h,swift}"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.0"
  s.requires_arc = true
end
