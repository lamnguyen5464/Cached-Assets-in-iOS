import UIKit

class SplashAsyncLoader{
    
    public static func loadAssetsFromLocal(completion: ([String: UIImage]) -> ()){
        let params = SplashConfigRepo.getConfigLocal();

        guard params != nil else {
            print("param is nil")
            return
        }
        
        print("loaded config" + params!.toString());
        
        var mapResource = [String: UIImage] ()
        params?.getListKeys().forEach{ key in
            
            print("stored " + (params?.getStringSafely(field: key))!);
            let url = URL(string: (params?.getStringSafely(field: key))!)
            let image = UIImageView(image: UIImage.loadImageLocal(imageUrl: url!));
            
            mapResource[UIImage.getImageNameFrom(url: url!)] = image.image
//            image.frame = CGRect(x: 100*cnt, y: 100*cnt, width: 200, height: 200)
//
//            cnt+=1;
            
//            splash.setUpUI(image: image.image!)
//
//            self.view.addSubview(image)
        }
        completion(mapResource)
    }
    
    public static func cacheAssetsFromRemoteConfig(){
        DispatchQueue.global().async {
            let strData =
                "{\n" +
                "  \"image_background\": \"https://cdn.mservice.com.vn/app/img/platform/img_mmct_background.png\",\n" +
                "  \"image_header\": \"https://cdn.mservice.com.vn/app/img/platform/img_mmct_header.png\",\n" +
                "  \"image_footer\": \"https://cdn.mservice.com.vn/app/img/platform/img_mmct_footer.png\"\n" +
                "}"
            let params = SafeJSONObject(str: strData)
            
            
            params.getListKeys().forEach{ key in
                UIImage.cacheImageLocal(from: URL(string: params.getStringSafely(field: key))!)
            }
            SplashConfigRepo.setConfigLocal(params: params)
            print("-----finish-----")
        }
    }
}
