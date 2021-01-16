import Foundation
import Capacitor
import UXCam

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */

@objc(UXCamPlugin)
public class UXCamPlugin: CAPPlugin {
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success(["value": value])
    }
    
    @objc func logEvent(_ call: CAPPluginCall) {
        let eventName = call.getString("eventName") ?? ""
        let properties = call.getObject("properties", defaultValue: [:])
        if (properties!.isEmpty) {
            UXCam.logEvent(eventName)
        }
        else {
            UXCam.logEvent(eventName,withProperties: properties)
        }
    }
    
    @objc func startWithKey(_ call: CAPPluginCall) {
        let UXCamKey = call.getString("UXCamKey") ?? ""
        let type = "cordova"
        UXCam.pluginType(type, version: "3.1.5")
        UXCam.optIntoSchematicRecordings()
        UXCam.start(withKey: UXCamKey)
        call.success()
    }
    
    @objc func setUserIdentity(_ call: CAPPluginCall) {
        let userIdentity = call.getString("userIdentity") ?? ""
        UXCam.setUserIdentity(userIdentity)
        call.success()
    }
    
    @objc func setUserProperty(_ call: CAPPluginCall) {
        let userInfo = call.getObject("properties", defaultValue: [:])
        for (key, value) in userInfo ?? [:] {
            UXCam.setUserProperty(key, value: value)
        }
        call.success()
    }
    
    @objc func setMultiSessionRecord(_ call: CAPPluginCall) {
        let enabled = call.getBool("recordMultipleSessions") ?? true
        UXCam.setMultiSessionRecord(enabled)
        call.success()
    }
    
    @objc func getEnabledMultiSessionRecord(_ call: CAPPluginCall) {
        let enabled = UXCam.getMultiSessionRecord()
        call.success(["value": enabled])
    }
    
    @objc func tagScreenName(_ call: CAPPluginCall) {
        let screenName = call.getString("screenName") ?? ""
        UXCam.tagScreenName(screenName)
        call.success()
    }
    
    @objc func setAutomaticScreenNameTagging(_ call: CAPPluginCall) {
        let enable = call.getBool("enable") ?? true
        UXCam.setAutomaticScreenNameTagging(enable)
        call.success()
    }
    
    @objc func stopSession(_ call: CAPPluginCall) {
        UXCam.stopSessionAndUploadData()
        call.success()
    }
    
}
