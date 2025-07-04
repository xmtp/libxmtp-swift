Pod::Spec.new do |s|
  s.name             = 'LibXMTP'
  s.version          = '4.3.0-dev.d8c7ed3'
  s.summary          = 'XMTP shared Rust code that powers cross-platform SDKs'

  s.homepage         = 'https://github.com/xmtp/libxmtp-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XMTP Labs' => 'eng@xmtp.com' }

  s.platform         = :ios, '14.0', :macos, '11.0'
  s.swift_version    = '5.3'

  s.source           = { :http => "https://github.com/xmtp/libxmtp/releases/download/swift-bindings-1.3.0-dev.d8c7ed3/LibXMTPSwiftFFI.zip", :type => :zip }
  s.vendored_frameworks = 'LibXMTPSwiftFFI.xcframework'
  s.source_files = 'Sources/LibXMTP/**/*'
end
