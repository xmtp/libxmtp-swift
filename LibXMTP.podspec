Pod::Spec.new do |s|
  s.name             = 'LibXMTP'
  s.version          = '0.4.3-beta6'
  s.summary          = 'XMTP shared Rust code that powers cross-platform SDKs'

  s.homepage         = 'https://github.com/xmtp/libxmtp-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XMTP Labs' => 'eng@xmtp.com' }

  s.platform         = :ios, '13.0', :macos, '11.0'
  s.swift_version    = '5.3'

  s.source       = { :http => "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-dfe225e/LibXMTPSwiftFFI.zip", :type => :zip }
  s.vendored_frameworks = 'LibXMTPSwiftFFI.xcframework'
  s.source_files = 'Sources/LibXMTP/**/*'
end
