Pod::Spec.new do |s|
  s.name             = 'LibXMTP'
  s.version          = 'test-timeout2'
  s.summary          = 'XMTP shared Rust code that powers cross-platform SDKs'

  s.homepage         = 'https://github.com/xmtp/libxmtp-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XMTP Labs' => 'eng@xmtp.com' }
  s.source           = { :git => 'https://github.com/xmtp/libxmtp-swift.git', :tag => s.version.to_s }

  s.platform         = :ios, '13.0', :macos, '11.0'
  s.swift_version    = '5.3'

  s.vendored_frameworks = 'LibXMTPRust.xcframework'

  s.source_files = 'Sources/LibXMTP/**/*'
end
