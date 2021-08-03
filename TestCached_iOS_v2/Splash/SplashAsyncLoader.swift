import UIKit

class SplashAsyncLoader{
    
    public static var loadAssetsSuccessfully = true
    
    public static func loadAssetsFromLocal(completion: ([String: UIImage]) -> ()){
        let params = SplashConfigRepo.getConfigLocal();
        
        guard params != nil, params?.getStringSafely(field: "status") == "on" else {
            print("param is nil")
            return
        }
        
        var mapResource = [String: UIImage] ()
        CampaignSplash.listKeysAssets.forEach{ key in
            let url = URL(string: (params?.getStringSafely(field: key))!)
            let image = UIImage.loadImageLocal(imageUrl: url!)
            mapResource[key] = image
        }
        completion(mapResource)
    }
    
    public static func cacheAssetsFromRemoteConfig(){
        DispatchQueue.global().async {
            //            let strData = """
            //                {
            //                "img_campaign_background": "https://cdn.mservice.com.vn/app/img/splash/img_campaign_background.png",
            //                "img_campaign_surrounding": "https://cdn.mservice.com.vn/app/img/splash/img_campaign_surrounding.png",
            //                "img_campaign_header": "https://cdn.mservice.com.vn/app/img/splash/img_campaign_header.png",
            //                "img_campaign_footer": "https://cdn.mservice.com.vn/app/img/splash/img_campaign_footer.png",
            //                "vers": "18",
            //                "status": "on"
            //              }
            //            """
            let strData = """
                {
               "img_campaign_background": "",
                "img_campaign_surrounding": "",
                "img_campaign_header": "",
                "img_campaign_footer": "",
                "vers": "1",
                "status": "off"
              }
            """
            
            let params = SafeJSONObject(str: strData)
            print(params.toString())
            
            SplashAsyncLoader.loadAssetsSuccessfully = true
            if SplashConfigRepo.isNewConfig(newConfig: params) {
                //cache assets
                CampaignSplash.listKeysAssets.forEach{ key in
                    let urlString = params.getStringSafely(field: key)
                    if (urlString != ""){
                        UIImage.cacheImageLocal(from: URL(string:urlString)!)
                    }
                    //save config
                    guard SplashAsyncLoader.loadAssetsSuccessfully else{
                        return
                    }
                    print("@@@herer")
                    SplashConfigRepo.setConfigLocal(params: params)
                }
            }
        }
    }
}
