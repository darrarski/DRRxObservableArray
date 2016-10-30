Pod::Spec.new do |s|
  s.name                  = 'DRRxObservableArray'
  s.version               = '1.0.0'
  s.summary               = 'Generic observable array for RxSwift'
  s.homepage              = 'https://github.com/darrarski/DRRxObservableArray'
  s.author                = { 'Dariusz Rybicki' => 'darrarski@gmail.com' }
  s.social_media_url      = 'https://twitter.com/darrarski'
  s.license               = { :type => 'MIT', 
                              :file => 'LICENSE' }
  s.source                = { :git => 'https://github.com/darrarski/DRRxObservableArray.git', 
                              :tag => "v#{s.version}" }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.source_files          = 'DRRxObservableArray'
  s.requires_arc          = true
  s.dependency            'RxSwift', '~> 3.0'
end
