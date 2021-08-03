import UIKit

class CampaignSplash: UIView{
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var imageFooter: UIImageView!
    @IBOutlet weak var imageSurrounding: UIImageView!
    
    private var mapComponents = [String: UIImageView]()
    
    public static let listKeysAssets = [
        "img_campaign_background",
        "img_campaign_surrounding",
        "img_campaign_header",
        "img_campaign_footer",
        //add new assets here
    ];
    
    override func awakeFromNib() {
        mapComponents["img_campaign_background"] = imageBackground
        mapComponents["img_campaign_header"] = imageHeader
        mapComponents["img_campaign_footer"] = imageFooter
        mapComponents["img_campaign_surrounding"] = imageSurrounding
        //...and add new assets here
    }
    
    func setUpUI(mapResource: [String: UIImage]){
        CampaignSplash.listKeysAssets.forEach{ key in
            let component = mapComponents[key]
            let image = mapResource[key]
            
            guard component != nil, image != nil else {
                return
            }
            component?.image = image
        }
        
        //custom
        imageFooter.stickToBottom()
    }
}
