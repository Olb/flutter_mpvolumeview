#import "NativevolumePlugin.h"
#import "FlutterVolume.h"

@implementation NativevolumePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterVolumeFactory* volumeviewFactory =
      [[FlutterVolumeFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:volumeviewFactory withId:@"nativevolume"];
}

// - (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
//   if ([@"getPlatformVersion" isEqualToString:call.method]) {
//     result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
//   } else {
//     result(FlutterMethodNotImplemented);
//   }
// }

@end

