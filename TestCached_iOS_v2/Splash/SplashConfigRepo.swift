import Foundation

class SplashConfigRepo{
    private static let SPLASH_CONFIG_KEY = "SPLASH_CONFIG_KEY"
    
    public static func setConfigLocal(params: SafeJSONObject?){
        UserDefaults.standard.set(params?.toString() ?? "", forKey: SPLASH_CONFIG_KEY)
    }
    
    public static func getConfigLocal() -> SafeJSONObject?{
        let storedConfig = UserDefaults.standard.string(forKey: SPLASH_CONFIG_KEY) ?? ""
        let params = SafeJSONObject(str: storedConfig)
        return params
    }
    
    public static func isNewConfig(newConfig: SafeJSONObject?) -> Bool{
        if (newConfig == nil) {
            return false;
        }
        
        let oldConfig = getConfigLocal()
        return (oldConfig == nil || newConfig?.getStringSafely(field: "vers") != oldConfig?.getStringSafely(field: "vers"))
    }
}
