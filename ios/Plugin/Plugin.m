#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(CapacitorAppAnalytics, "CapacitorAppAnalytics",
           CAP_PLUGIN_METHOD(startWithKey, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setUserProperty, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(tagScreenName, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(stopSeaaion, CAPPluginReturnPromise);
)
