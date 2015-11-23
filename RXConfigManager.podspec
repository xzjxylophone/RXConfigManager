

Pod::Spec.new do |s|
  s.name     = "RXConfigManager"
  s.version  = "0.1"
  s.license  = "MIT"
  s.summary  = "RXConfigManager is a config manager"
  s.homepage = "https://github.com/xzjxylophone/RXConfigManager"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXConfigManager.git', :tag => "v#{s.version}" }
  s.description = %{
        RXConfigManager is a config manager.
  }
  s.source_files = 'RXConfigManager/*.{h,m}'
  s.frameworks = 'Foundation', ‘UIKit’
  s.requires_arc = true
  s.dependency 'RXTableViewItem' 
  s.platform = :ios, ‘7.0'

end






