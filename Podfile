source 'git://github.com/CocoaPods/Specs.git'
use_frameworks!

def pod_dependencies()
  pod 'RxSwift', '~> 3.0'
end

def pod_tests() 
  pod 'Quick', '~> 0.10'
  pod 'Nimble', '~> 5.0'
  pod 'RxBlocking', '~> 3.0'
end

target 'DRRxObservableArrayTests-iOS' do
  platform :ios, '10.0'
  pod_dependencies()
  pod_tests()
end

target 'DRRxObservableArrayTests-macOS' do
  platform :osx, '10.12'
  pod_dependencies()
  pod_tests()
end
