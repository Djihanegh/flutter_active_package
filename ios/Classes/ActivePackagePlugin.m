#import "ActivePackagePlugin.h"
#if __has_include(<active_package/active_package-Swift.h>)
#import <active_package/active_package-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "active_package-Swift.h"
#endif

@implementation ActivePackagePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftActivePackagePlugin registerWithRegistrar:registrar];
}
@end
