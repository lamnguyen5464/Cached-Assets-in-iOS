import UIKit
import Foundation
import Lottie

@objc
class SplashController: NSObject{
    
    @objc
    public static func bindDefaultSplash(rootView: UIView) {
        let defaultSplash: DefaultSplash = .loadFullScreenFromNib(rootView: rootView)
        rootView.addSubview(defaultSplash)
    }
    
    @objc
    public static func bindCampaignSplash(rootView: UIView){
        SplashAsyncLoader.loadAssetsFromLocal{ mapResource in
            let campaignSplash: CampaignSplash = .loadFullScreenFromNib(rootView: rootView)
            campaignSplash.setUpUI(mapResource: mapResource)
            rootView.addSubview(campaignSplash);
        }
        
        SplashAsyncLoader.cacheAssetsFromRemoteConfig()
    }
}
