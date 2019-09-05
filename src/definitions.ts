declare module "@capacitor/core" {
  interface PluginRegistry {
    CapacitorAppAnalytics: CapacitorAppAnalyticsPlugin;
  }
}

export interface UserProperty {
  userId: string
  name: string
  userInfo: {[key: string]: string}
}

export interface CapacitorAppAnalyticsPlugin {
  startWithKey(options: { UXCamKey: string }): Promise<void>;
  setUserProperty(options: UserProperty): Promise<void>;
  tagScreenName(options: { screenName: string }): Promise<void>
  stopSession(): Promise<void>
}
