
platform :ios, '12.0'
inhibit_all_warnings!
use_frameworks!

def universal_pods
  
  # SDK
  pod 'WechatOpenSDK' # 微信
  
  # Swift
  pod 'Alamofire' # 网络
  pod 'CHTCollectionViewWaterfallLayout/Swift'
  pod 'CryptoSwift'
  pod 'HandyJSON' # JSON序列化与反序列化
  pod 'IQKeyboardManagerSwift' # 键盘监听
  pod 'KeychainAccess'
  pod 'Kingfisher' # 图片
  pod 'RxCocoa'
  pod 'RxSwift'
  pod 'SnapKit' # 布局
  pod 'SwiftImageEffects'
  pod 'SwiftyJSON' # JSON解析
  pod 'SwipeCellKit'
  
  # Objective-C
  pod 'CYLTabBarController'
  pod 'DZNEmptyDataSet'
  pod 'MBProgressHUD'
  pod 'MJRefresh'
  pod 'pop'
  pod 'RTRootNavigationController'
  pod 'STPopup'
  pod 'WMPageController'
  pod 'YBImageBrowser'

end

target 'SimonWongSwift' do
  
  universal_pods
  
end

post_install do |installer_representation|
  installer_representation.pods_project.build_configurations.each do |config|
    config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = 'YES'
    config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
  end
  installer_representation.pods_project.targets.each do |target| # all target
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      config.build_settings['CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED'] = 'YES'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
    end
  end
end
