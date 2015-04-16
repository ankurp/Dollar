Pod::Spec.new do |s|
  s.name         = "Dollar"
  s.version      = "2.1.1"
  s.summary      = "A functional tool-belt for Swift Language"
  s.homepage     = "https://github.com/ankurp/Dollar.swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Dollar.swift.git", :branch => "xcode-6.3-beta-swift-1.2" }
  s.source_files  = "Dollar/Dollar/*.{h,swift}"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.requires_arc = true

  s.subspec "Cent" do |cs|
    cs.name         = "Cent"
    cs.version      = "2.1.1"
    cs.summary      = "Extension for common object types for Swift Language"
    cs.homepage     = "https://github.com/ankurp/Dollar.swift"
    cs.license      = { :type => "MIT", :file => "LICENSE" }
    cs.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
    cs.source       = { :git => "https://github.com/ankurp/Dollar.swift.git", :branch => "xcode-6.3-beta-swift-1.2" }
    cs.source_files = "Cent/Cent/*.{h,swift}"
    cs.requires_arc = true
    cs.ios.deployment_target = "8.0"
    cs.osx.deployment_target = "10.10"
  end
end
