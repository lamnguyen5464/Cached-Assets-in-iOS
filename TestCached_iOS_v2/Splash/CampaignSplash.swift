import UIKit

class CampaignSplash: UIView{
    
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var imageFooter: UIImageView!
    @IBOutlet weak var imageBackground: UIImageView!
    
    private var mapComponents = [String: UIImageView]()
    
    override func awakeFromNib() {
        print("awakeFromNib Campaign")
        mapComponents["img_mmct_background"] = imageBackground
        mapComponents["img_mmct_header"] = imageHeader
        mapComponents["img_mmct_footer"] = imageFooter
    }
    
    func setUpUI(mapResource: [String: UIImage]){
        Array(mapResource.keys).forEach{ key in
            let component = mapComponents[key]
            let image = mapResource[key]
            guard component != nil, image != nil else {
                return
            }
            component?.image = image
        }
    }
}
