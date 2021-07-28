import UIKit

extension UIImage {
    static func cacheImageLocal(from url: URL?){
        guard url != nil else {
            return
        }
        print("Download " + url!.absoluteString + " Started")
        getData(from: url!) { data, response, error in
            if  let data = data,   error == nil{
                let fileName = self.getImageNameFrom(url: url)
                let res = self.saveImage(image: UIImage(data: data)!, fileName: fileName)
                print("Download Finished " + fileName )
                print(res.description)
            }else{
                //error
            }
            
        }
    }
    
    static func loadImageLocal(imageUrl: URL) -> UIImage? {
        let name = self.getImageNameFrom(url: imageUrl)
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(name).path)
        }
        return nil
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    static func saveImage(image: UIImage, fileName: String) -> Bool {
        print("start saving...")
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent(fileName)!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    static func getImageNameFrom(url: URL?) -> String{
        return url?.lastPathComponent ?? ""
    }
}

