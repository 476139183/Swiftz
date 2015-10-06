Pod::Spec.new do |s|
  s.name        = "Swiftz"
  s.version     = "0.3.0"
  s.summary     = "Swiftz is a Swift library for functional programming."
  s.homepage    = "https://github.com/typelift/Swiftz"
  s.license     = { :type => "BSD" }
  s.authors     = { "CodaFi" => "devteam.codafi@gmail.com", "pthariensflame" => "alexanderaltman@me.com" }

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/typelift/Swiftz.git", :tag => "v#{s.version}", :submodules => true }
  s.source_files = "Swiftz/*.swift", "**/Swiftx/*.swift", "Carthage/Checkouts/Operadics/*.swift"
end
