import UIKit
import Lottie

@objc
class MainView: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad();
        SplashController.bindDefaultSplash(rootView: self.view)
        SplashController.bindCampaignSplash(rootView: self.view)
    }
}
