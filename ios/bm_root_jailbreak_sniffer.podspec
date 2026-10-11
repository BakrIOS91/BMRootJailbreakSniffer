Pod::Spec.new do |s|
  s.name             = 'bm_root_jailbreak_sniffer'
  s.version          = '1.1.5'
  s.summary          = 'Root and jailbreak detection (Magisk Hide aware on Android) with Swift Package Manager support on iOS'
  s.description      = <<-DESC
Fork of root_jailbreak_sniffer 1.1.4 that adds Swift Package Manager support on iOS. Android detection is unchanged.
                       DESC
  s.homepage         = 'https://github.com/BakrIOS91/BMRootJailbreakSniffer'
  s.license          = { :type => 'Apache-2.0', :file => '../LICENSE' }
  s.author           = { 'romikavinda' => 'romikavinda@yahoo.com' }
  s.source           = { :path => '.' }
  s.source_files = 'bm_root_jailbreak_sniffer/Sources/bm_root_jailbreak_sniffer/**/*.swift'
  s.dependency 'Flutter'
  s.dependency 'IOSSecuritySuite', '~> 1.9.10'
  s.platform = :ios, '12.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
