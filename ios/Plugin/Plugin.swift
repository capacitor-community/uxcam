import Foundation
import Capacitor
import UXCam

@objc(CapacitorAppAnalytics)
public class CapacitorAppAnalytics: CAPPlugin {
    
    @objc func startWithKey(_ call: CAPPluginCall) {
        let UXCamKey = call.getString("UXCamKey") ?? ""
        let type = "cordova"
        
        UXCam.pluginType(type, version: "3.1.5")
        UXCam.optIntoSchematicRecordings()
        UXCam.start(withKey: UXCamKey, buildIdentifier: nil)
        
        call.success()
    }
    
    @objc func setUserProperty(_ call: CAPPluginCall) {
        let userId = call.getString("userId") ?? ""
        UXCam.setUserIdentity(userId)
        
        let userInfo = call.getObject("userInfo", defaultValue: [:])
        
        for (key, value) in userInfo ?? [:] {
            UXCam.setUserProperty(key, value: value)
        }
        call.success()
    }
    
    @objc func tagScreenName(_ call: CAPPluginCall) {
        let screenName = call.getString("screenName") ?? ""
        
        UXCam.tagScreenName(screenName)
        call.success()
    }
    
    @objc func stopSession(_ call: CAPPluginCall) {
        UXCam.stopSessionAndUploadData()
        call.success()
    }
}
