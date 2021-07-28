import UIKit
import Lottie

@objc
class DefaultSplash: UIView{
    @IBOutlet weak var logo: AnimationView!
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib Campaign")
        
        logo.animationSpeed = 1;
        logo.loopMode = .loop;
        logo.play();
    }
}
