platform :ios, '10.0'

target 'ArtistSearch' do
  use_modular_headers!

  def shared_pods
    pod 'Alamofire', '~> 4.8.2'
    pod 'RealmSwift', '~> 3.17.3'
    pod 'SwiftLint', '~> 0.30.0'
  end

  pod 'SVProgressHUD'
  shared_pods

  target 'ArtistSearchTests' do
    inherit! :search_paths
    # Pods for UnitTesting
    shared_pods
  end

  target 'ArtistSearchUITests' do
    inherit! :search_paths
    # Pods for UItesting
  end

end
