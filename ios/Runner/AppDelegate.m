#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "KQPluginRegistrant.h"
#import <UMCommon/UMCommon.h>
#import <UMCommonLog/UMCommonLogHeaders.h>
#import <UMShare/UMShare.h>
#import <WXApi.h>
#import <AVOSCloud/AVOSCloud.h>

@implementation AppDelegate

- (void)setupUM {
#ifdef DEBUG
    [UMCommonLogManager setUpUMCommonLogManager];
    [UMConfigure setLogEnabled:YES];
#endif
    [UMConfigure initWithAppkey:@"5d7103d9570df32322000339" channel:@"App Store"];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxc64b13952068bab3" appSecret:@"3c376cd5853983e45516cad5861634ef" redirectURL:@"http://mobile.umeng.com/social"];
    
    [WXApi registerApp:@"wxc64b13952068bab3"];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupUM];
    [AVOSCloud setServerURLString:@"https://avoscloud.com" forServiceModule:AVServiceModuleAPI];
    [AVOSCloud setApplicationId:@"vUX0NNP3Gjs3I64Yz37jN6Ul-gzGzoHsz" clientKey:@"1wdkr4BXCcMqU5EsqT8i7mID"];
    
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [KQPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    return result;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    return result;
}

@end
