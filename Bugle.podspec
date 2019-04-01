Pod::Spec.new do |s|
  s.name             = 'Bugle'
  s.version          = '2.0.0'
  s.summary          = 'Bugle, is a helper for displaying alerts without writing boilerplate code.'
  s.homepage         = 'https://github.com/yellowme/Bugle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luis Burgos' => 'luisarturo.burgos@gmail.com' }
  s.source           = { :git => 'https://github.com/yellowme/Bugle.git', :tag => s.version.to_s }
 
  s.swift_version = '4.0'
  s.ios.deployment_target = '10.0'
  s.source_files  = [
    "Bugle/Sources/**/*.{swift,h,m,c}",
  ]
end
