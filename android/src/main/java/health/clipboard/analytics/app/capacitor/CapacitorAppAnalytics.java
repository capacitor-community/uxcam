package health.clipboard.analytics.app.capacitor;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import com.uxcam.UXCam;

import org.json.JSONException;

import java.util.Iterator;

@NativePlugin()
public class CapacitorAppAnalytics extends Plugin {

    @PluginMethod()
    public void startWithKey(PluginCall call) {
        String UXCamKey = call.getString("UXCamKey");
        UXCam.startApplicationWithKeyForCordova(getActivity(), UXCamKey);
        call.success();
    }

    @PluginMethod()
    public void setUserProperty(PluginCall call) {
        String name = call.getString("name");
        String userId = call.getString("userId");

        UXCam.setUserIdentity(name);
        UXCam.setUserProperty("user_id", userId);
        UXCam.setUserProperty("alias", name);


        JSObject userInfo = call.getObject("userInfo", new JSObject());
        Iterator<String> userProperties = userInfo.keys();

        while (userProperties.hasNext()) {
            String property = (String) userProperties.next();
            String propertyValue = userInfo.getString(property);

            UXCam.setUserProperty(property, propertyValue);
        }

        call.success();
    }

    @PluginMethod()
    public void tagScreenName(PluginCall call) {
        String screenName = call.getString("screenName");
        UXCam.tagScreenName(screenName);
        call.success();
    }

    @PluginMethod()
    public void stopSession(PluginCall call) {
        UXCam.stopSessionAndUploadData();
        call.success();
    }
}
