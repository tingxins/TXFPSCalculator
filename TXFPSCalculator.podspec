
Pod::Spec.new do |s|
  s.name         = "TXFPSCalculator"
  s.version      = "1.0.0"
  s.summary      = "The easy way to show FPS.（显示当前 FPS）"
  s.homepage     = "https://github.com/tingxins/TXFPSCalculator"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "tingxins" => "tingxins@sina.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/tingxins/TXFPSCalculator.git", :tag => 'v1.0.0' }
  s.source_files  = 'TXFPSCalculator/**/*.{h,m}'
  s.requires_arc = true
end
