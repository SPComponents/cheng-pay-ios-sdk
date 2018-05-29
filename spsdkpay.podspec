Pod::Spec.new do |s|
  s.name         = 'SPSDKPay'
  s.version      = '1.0.10'
  s.summary      = 'Supay iOS SDK'
  s.description  = <<-DESC
                   移动应用支付接口。
                   开发者不再需要编写冗长的代码，简单几步就可以使你的应用获得支付功能。
                   让你的移动应用接入支付像大厦接入电力一样简单，方便，和温暖。
                   支持微信支付，支付宝支付。
                   DESC
  s.homepage     = 'https://xxxxxx.com'
  s.license      = 'COMMERCIAL'
  s.author       = { 'Afon Weng' => 'lm.zou@rechengit.com' }
  s.platform     = :ios, '7.0'
  s.source       = { :http => "https://git.rechengit.com/front-end/cheng-pay-ios-sdk",
                     :sha1 => "" }
  s.requires_arc = true
  s.default_subspec = 'Core', 'Alipay', 'Wx'

  s.subspec 'Core' do |core|
    core.source_files = 'lib/*.h', 'lib/Dependencies/Network/*.h'
    core.public_header_files = 'lib/*.h', 'lib/Dependencies/Network/*.h'
    core.vendored_libraries = 'lib/*.a', 'lib/Dependencies/Network/*.a'
    core.resource = 'lib/*.bundle'
    core.frameworks = 'CFNetwork', 'SystemConfiguration', 'Security', 'CoreLocation'
    core.ios.library = 'c++', 'stdc++', 'z'
    core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'Alipay' do |ss|
    ss.vendored_libraries = 'lib/Channels/Alipay/*.a'
    ss.frameworks = 'CoreMotion', 'CoreTelephony'
    ss.dependency 'SPSDKPay/Core'
    ss.dependency 'SPSDKPayAlipaySDK', '~> 15.5'
  end

  s.subspec 'CBAlipay' do |ss|
    ss.dependency 'SPSDKPay/Alipay'
  end

  s.subspec 'AlipayNoUTDID' do |ss|
    ss.vendored_libraries = 'lib/Channels/Alipay/*.a'
    ss.frameworks = 'CoreMotion', 'CoreTelephony'
    ss.dependency 'SPSDKPay/Core'
    ss.dependency 'SPSDKPayAlipaySDKNoUTDID', '~> 15.5'
  end

  s.subspec 'Wx' do |ss|
    ss.dependency 'SPSDKPay/Core'
  end

  s.subspec 'UI' do |ss|
    ss.frameworks = 'QuartzCore'
    ss.source_files = 'lib/UI/*.h'
    ss.public_header_files = 'lib/UI/*.h'
    ss.vendored_libraries = 'lib/UI/*.a'
    ss.dependency 'SPSDKPay/Core'
  end

  s.subspec 'WebView' do |ss|
    ss.vendored_libraries = 'lib/Dependencies/WebView/*.a'
    ss.dependency 'SPSDKPay/Core'
  end

end
