declare module "@capacitor/core" {
  interface PluginRegistry {
    CapacitorAppAnalytics: CapacitorAppAnalyticsPlugin;
  }
}

export interface AnalyticsUserInfo {
  displayName: string
  alias: string
  email: string
  [key: string]: string
}

export interface CapacitorAppAnalyticsPlugin {
  startWithKey(options: { UXCamKey: string }): Promise<void>;
  setUserProperty(userId: string, userInfo: AnalyticsUserInfo): Promise<void>;
  tagScreenName(options: { screenName: string }): Promise<void>
  stopSession(): Promise<void>
}
