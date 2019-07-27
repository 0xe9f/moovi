//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <auto_orientation/AutoOrientationPlugin.h>
#import <connectivity/ConnectivityPlugin.h>
#import <cplayer/CplayerPlugin.h>
#import <screen/ScreenPlugin.h>
#import <video_player/VideoPlayerPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AutoOrientationPlugin registerWithRegistrar:[registry registrarForPlugin:@"AutoOrientationPlugin"]];
  [FLTConnectivityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTConnectivityPlugin"]];
  [CplayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"CplayerPlugin"]];
  [ScreenPlugin registerWithRegistrar:[registry registrarForPlugin:@"ScreenPlugin"]];
  [FLTVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTVideoPlayerPlugin"]];
}

@end
