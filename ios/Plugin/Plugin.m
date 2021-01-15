#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(UXCamPlugin, "UXCamPlugin",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(logEvent, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(startWithKey, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setUserIdentity, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setUserProperty, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setMultiSessionRecord, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getEnabledMultiSessionRecord(), CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(tagScreenName, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setAutomaticScreenNameTagging, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(stopSession, CAPPluginReturnPromise);
)
