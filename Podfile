# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'bunjang' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

pod 'KakaoSDK'
  pod 'SnapKit', '~> 5.6.0'
pod 'Then'
post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
end
end

end
  # Pods for bunjang

  target 'bunjangTests' do
    inherit! :search_paths
    # Pods for testing


  target 'bunjangUITests' do
    # Pods for testing
  
end
end

end
