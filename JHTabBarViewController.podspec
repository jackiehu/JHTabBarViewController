 
Pod::Spec.new do |s|
  s.name             = 'JHTabBarViewController'
  s.version          = '0.1.0'
  s.summary          = 'JHTabBarViewController.'
 
  s.description      = <<-DESC
							JHTabBarViewController.
                       DESC

  s.homepage         = 'https://github.com/jackiehu/' 
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HU' => '814030966@qq.com' }
  s.source           = { :git => 'https://github.com/jackiehu/JHTabBarViewController.git', :tag => s.version.to_s }
 
  s.platform         = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source_files = 'JHTabBarViewController/JHTabBarViewController/Class/**/*.{h,m}'
  s.frameworks   = "UIKit", "Foundation" #支持的框架
  s.requires_arc        = true

end
