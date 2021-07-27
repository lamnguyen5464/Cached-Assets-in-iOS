//
//  AppDelegate.m
//  TestCached_iOS_v2
//
//  Created by Lam Nguyen on 27/07/2021.
//

#import "AppDelegate.h"
#import "TestCached_iOS_v2-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DefaultSplash" bundle:nil];
    //    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Campaign"];
    
    //    UIViewController *viewController = [[MainView alloc]init];
    
    //    [viewController setModalPresentationStyle:UIModalPresentationOverFullScreen];
    
    //    self.window.rootViewController = viewController;
    

//    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
