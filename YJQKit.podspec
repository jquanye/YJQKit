Pod::Spec.new do |s|
  s.name         = 'YJQKit'
  s.version      = '0.1.0'
  s.summary      = 'My custom iOS UI components'
  s.description  = 'A collection of personal UI components for iOS projects'
  s.homepage     = 'https://github.com/jquanye/YJQKit'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'jquanye' => '576032408@qq.com' }
  s.platform     = :ios, '11.0'
  s.source       = { :git => 'git@github-personal:jquanye/YJQKit.git', :tag => s.version.to_s }
  s.source_files = '*.h', '*.m'   # 你的组件文件
end