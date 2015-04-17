Pod::Spec.new do |s|
  s.name         = "Cent"
  s.version      = "2.2.0"
  s.summary      = "Extension for common object types for Swift Language"
  s.homepage     = "https://github.com/ankurp/Dollar.swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Dollar.swift.git", :tag => "#{s.version}" }
  s.source_files = "Cent/Cent/*.{h,swift}"
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.dependency "Dollar", "~> #{s.version}"
end
