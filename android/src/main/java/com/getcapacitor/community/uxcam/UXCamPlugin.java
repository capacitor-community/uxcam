package com.getcapacitor.community.uxcam;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import java.util.Iterator;

import com.uxcam.UXCam;

@NativePlugin
public class UXCamPlugin extends Plugin {

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", value);
        call.success(ret);
    }

    @PluginMethod()
    public void logEvent(PluginCall call) {
        String eventName = call.getString("eventName");
        JSObject properties = call.getObject("properties", new JSObject());

        if (properties.length() == 0) UXCam.logEvent(eventName);
        else UXCam.logEvent(eventName, properties);
    }

    @PluginMethod()
    public void startWithKey(PluginCall call) {
        String UXCamKey = call.getString("UXCamKey");
        UXCam.startApplicationWithKeyForCordova(getActivity(), UXCamKey);
        call.success();
    }

    @PluginMethod()
    public void setUserIdentity(PluginCall call){
        String userIdentity = call.getString("userIdentity");
        UXCam.setUserIdentity(userIdentity);
        call.success();
    }

    @PluginMethod()
    public void setUserProperty(PluginCall call) {

        JSObject userInfo = call.getObject("properties", new JSObject());
        Iterator<String> userProperties = userInfo.keys();

        while (userProperties.hasNext()) {
            String property = (String) userProperties.next();
            String propertyValue = userInfo.getString(property);

            UXCam.setUserProperty(property, propertyValue);
        }

        call.success();
    }

    @PluginMethod()
    public void setMultiSessionRecord(PluginCall call){
        boolean enabled = call.getBoolean("recordMultipleSessions", true);
        UXCam.setMultiSessionRecord(enabled);
        call.success();
    }

    @PluginMethod()
    public void getEnabledMultiSessionRecord(PluginCall call){
        JSObject ret = new JSObject();
        boolean enabled = UXCam.getMultiSessionRecord();
        ret.put("value", enabled);
        call.success(ret);
    }

    @PluginMethod()
    public void tagScreenName(PluginCall call) {
        String screenName = call.getString("screenName");
        UXCam.tagScreenName(screenName);
        call.success();
    }

    @PluginMethod()
    public void setAutomaticScreenNameTagging(PluginCall call) {
        boolean enable = call.getBoolean("enable", true);
        UXCam.setAutomaticScreenNameTagging(enable);
        call.success();
    }

    @PluginMethod()
    public void stopSession(PluginCall call) {
        UXCam.stopSessionAndUploadData();
        call.success();
    }
}
