Pod::Spec.new do |s|
  s.name         = "Dollar"
  s.version      = "0.3.0"
  s.summary      = "A functional tool-belt for Swift Language"
  s.homepage     = "https://github.com/ankurp/Dollar.swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Dollar.swift.git", :tag => "0.3.0" }
  s.source_files  = "Dollar/Dollar/*.{h,swift}"
  s.frameworks   = "Foundation"
  s.requires_arc = true
end
