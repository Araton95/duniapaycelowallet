//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<apple_sign_in/AppleSignInPlugin.h>)
#import <apple_sign_in/AppleSignInPlugin.h>
#else
@import apple_sign_in;
#endif

#if __has_include(<clipboard_manager/ClipboardManagerPlugin.h>)
#import <clipboard_manager/ClipboardManagerPlugin.h>
#else
@import clipboard_manager;
#endif

#if __has_include(<cloud_functions/CloudFunctionsPlugin.h>)
#import <cloud_functions/CloudFunctionsPlugin.h>
#else
@import cloud_functions;
#endif

#if __has_include(<firebase_auth/FLTFirebaseAuthPlugin.h>)
#import <firebase_auth/FLTFirebaseAuthPlugin.h>
#else
@import firebase_auth;
#endif

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<google_sign_in/FLTGoogleSignInPlugin.h>)
#import <google_sign_in/FLTGoogleSignInPlugin.h>
#else
@import google_sign_in;
#endif

#if __has_include(<multi_image_picker/MultiImagePickerPlugin.h>)
#import <multi_image_picker/MultiImagePickerPlugin.h>
#else
@import multi_image_picker;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AppleSignInPlugin registerWithRegistrar:[registry registrarForPlugin:@"AppleSignInPlugin"]];
  [ClipboardManagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"ClipboardManagerPlugin"]];
  [CloudFunctionsPlugin registerWithRegistrar:[registry registrarForPlugin:@"CloudFunctionsPlugin"]];
  [FLTFirebaseAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAuthPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FLTGoogleSignInPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleSignInPlugin"]];
  [MultiImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"MultiImagePickerPlugin"]];
}

@end
