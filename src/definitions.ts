declare module '@capacitor/core' {
  interface PluginRegistry {
    UXCamPlugin: UXCamPlugin;
  }
}

export interface UserProperty {
  properties: { [key: string]: string | number };
}

export interface LogEventProperty {
  eventName: string;
  properties?: { [key: string]: string | number };
}

export interface UXCamPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;

  logEvent(options: LogEventProperty): Promise<void>;

  startWithKey(options: { UXCamKey: string }): Promise<void>;

  setUserIdentity(options: { userIdentity: string }): Promise<void>;

  setUserProperty(options: UserProperty): Promise<void>;

  setMultiSessionRecord(options: { recordMultipleSessions: boolean }): Promise<void>;

  getEnabledMultiSessionRecord(): Promise<{ value: boolean }>;

  tagScreenName(options: { screenName: string }): Promise<void>;

  setAutomaticScreenNameTagging(options: { enable: boolean }): Promise<void>;

  stopSession(): Promise<void>
}
