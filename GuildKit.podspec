Pod::Spec.new do |s|
  s.name             = 'GuildKit'
  s.version          = '0.0.1'
  s.summary          = 'Framework for Traction iOS App'
 
  s.description      = <<-DESC
  Framework for Traction iOS App...
                       DESC
 
  s.homepage         = 'https://github.com/B4-Worldview/GuildKit'
  s.license          = { }
  s.author           = { 'Nobody' => 'nobody@nobody.com' }
  s.source           = { :git => 'https://github.com/B4-Worldview/GuildKit.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '13.0'
  s.source_files = 'GuildKitDemo/*.swift'
 
end