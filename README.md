[![npm version](https://badge.fury.io/js/%40clipboardhealth%2Fcapacitor-app-analytics@2x.png)](https://badge.fury.io/js/%40clipboardhealth%2Fcapacitor-app-analytics)

# capacitor-app-analytics

Capacitor plugin for [UXCam](https://uxcam.com/) and [FullStory](https://www.fullstory.com/) analytics. It uses UXCam for Android and iOS platforms and FullStory for Web/PWA.

## Installation

```
npm i @clipboardhealth/capacitor-app-analytics
```

### Android Configuration

In file `android/app/src/main/java/**/**/MainActivity.java`, add the plugin to the initialization list:

```
this.init(savedInstanceState, new ArrayList<Class<? extends Plugin>>() {{
  [...]
  add(health.clipboard.analytics.app.capacitor.CapacitorAppAnalytics.class);
  [...]
}});
```

In file `android/app/src/main/AndroidManifest.xml`, add the following XML elements under `<manifest><application>` :

```
<service android:name="com.uxcam.service.HttpPostService"/>
```

### iOS Configuration

None

### Web

Paste your FullStory snippet in the `<head>`.

More information can be found here: [https://help.fullstory.com/hc/en-us/articles/360020623514-How-do-I-get-FullStory-up-and-running-on-my-site-](https://help.fullstory.com/hc/en-us/articles/360020623514-How-do-I-get-FullStory-up-and-running-on-my-site-)

## Methods

### startWithKey(options: { UXCamKey: string })

Starts tracking the session

```
Plugins.CapacitorAppAnalytics.startWithKey({ UXCamKey: 'your_uxcam_api_key' })
```

### setUserProperty(options: UserProperty)

Sets the user property of the session user

```
Plugins.CapacitorAppAnalytics.setUserProperty({
    userId: '$userId',
    name: 'name,
    userInfo: {
      ...extra properties of the user
    },
  })

```

### tagScreenName(options: { screenName: string })

Track the name of the screen

```
Plugins.CapacitorAppAnalytics.tagScreenName({ screenName: 'LoginScreen' })
```

### stopSession()

Stops the current session

```
Plugins.CapacitorAppAnalytics.stopSession()
```
