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
        call.success([
            "value": value
        ])
    }

    @objc func startWithKey(_ call: CAPPluginCall) {
        String eventName = call.getString("eventName") ?? ""
        let properties = call.getObject("properties", defaultValue: [:])

        if (properties.isEmpty) UXCam.logEvent(eventName)
        else UXCam.logEvent(eventName,withProperties: properties)
    }

    @objc func startWithKey(_ call: CAPPluginCall) {
        String UXCamKey = call.getString("UXCamKey") ?? ""
        let type = "cordova"

        UXCam.pluginType(type, version: "3.1.5")
        UXCam.optIntoSchematicRecordings()
        UXCam.start(withKey: UXCamKey, buildIdentifier: nil)

        call.success()
    }

    @objc func setUserIdentity(_ call: CAPPluginCall) {
        String userIdentity = call.getString("userIdentity") ?? ""
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
        Bool enabled = call.getString("recordMultipleSessions") ?? true
        UXCam.setMultiSessionRecord(enabled)
        call.success()
    }

    @objc func getEnabledMultiSessionRecord(_ call: CAPPluginCall) {
        Bool enabled = UXCam.getMultiSessionRecord()
        call.success([
            "value": enabled
        ])
    }

    @objc func tagScreenName(_ call: CAPPluginCall) {
        String screenName = call.getString("screenName") ?? ""

        UXCam.tagScreenName(screenName)
        call.success()
    }

    @objc func setAutomaticScreenNameTagging(_ call: CAPPluginCall) {
        Bool enable = call.getString("enable") ?? true
        UXCam.setAutomaticScreenNameTagging(enable)
        call.success()
    }

    @objc func stopSession(_ call: CAPPluginCall) {
        UXCam.stopSessionAndUploadData()
        call.success()
    }
}
