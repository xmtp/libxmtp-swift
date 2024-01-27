Pod::Spec.new do |s|
  s.name             = 'LibXMTP'
  s.version          = '0.0.1-timeout0'
  s.summary          = 'XMTP shared Rust code that powers cross-platform SDKs'

  s.homepage         = 'https://github.com/xmtp/libxmtp-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XMTP Labs' => 'eng@xmtp.com' }

  s.platform         = :ios, '13.0', :macos, '11.0'
  s.swift_version    = '5.3'

  s.vendored_frameworks = 'LibXMTPRust.xcframework'
  s.source       = { :http => "https://github.com/xmtp/libxmtp/releases/download/test-swift-bindings-refs%2Fheads%2Fcv%2Frelease-swift-bindings/LibXMTPSwiftFFI.zip" }

  s.source_files = 'Sources/LibXMTP/**/*'
end
