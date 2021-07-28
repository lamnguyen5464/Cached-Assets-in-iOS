import Foundation

class SplashConfigRepo{
    private static let SPLASH_CONFIG_KEY = "SPLASH_CONFIG_KEY"
    
    public static func setConfigLocal(params: SafeJSONObject){
        UserDefaults.standard.set(params.toString(), forKey: SPLASH_CONFIG_KEY)
    }
    
    public static func getConfigLocal() -> SafeJSONObject?{
        let storedConfig = UserDefaults.standard.string(forKey: SPLASH_CONFIG_KEY) ?? ""
        let params = SafeJSONObject(str: storedConfig)
        return params
    }
}
