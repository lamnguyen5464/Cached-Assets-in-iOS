import UIKit
import Lottie

@objc
class MainView: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        
        //        let splash = UINib(nibName: "DefaultSplash", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
        //
        //        splash.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        //
        //        view.addSubview(splash)
        
        let splash: DefaultSplash = .loadFullScreenFromNib(rootView: self.view)
        view.addSubview(splash);
        
        SplashAsyncLoader.loadAssetsFromLocal{ mapResource in
            let splash2: CampaignSplash = .loadFullScreenFromNib(rootView: self.view)
            splash2.setUpUI(mapResource: mapResource)
            view.addSubview(splash2);
        }

        SplashAsyncLoader.cacheAssetsFromRemoteConfig()

    }
}
