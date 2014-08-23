Pod::Spec.new do |s|
  s.name         = "Cent"
  s.version      = "0.5.0"
  s.summary      = "Extension for common object types for Swift Language"
  s.homepage     = "https://github.com/ankurp/Dollar.swift"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Ankur Patel" => "ankur.patel@ymail.com" }
  s.source       = { :git => "https://github.com/ankurp/Dollar.swift.git", :tag => "0.5.0" }
  s.source_files = "Cent/Cent/*.{h,swift}"
  s.frameworks   = "Foundation"
  s.requires_arc = true
  s.dependency "Dollar", "~> 0.5.0"
end
