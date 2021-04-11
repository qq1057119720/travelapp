#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint nim_plugin.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'nim_plugin'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.resources = 'Classes/Resources/*.*'
  s.dependency 'Flutter'
  s.dependency 'NIMSDK', '~> 6.5.5'
  s.dependency 'SVProgressHUD'
  s.dependency 'SDAutoLayout'
#  s.dependency 'SDWebImage', '~> 4.4.6'
  s.dependency 'Toast', '~> 4.0'
  s.dependency 'M80AttributedLabel', '~> 1.6.3'
  s.dependency 'TZImagePickerController', '~> 3.0.7'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
