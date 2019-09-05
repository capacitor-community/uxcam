import { registerWebPlugin, WebPlugin } from '@capacitor/core';

import { CapacitorAppAnalyticsPlugin, UserProperty } from './definitions';

declare const FS: any;

export class CapacitorAppAnalyticsWeb extends WebPlugin
  implements CapacitorAppAnalyticsPlugin {
  constructor() {
    super({
      name: 'CapacitorAppAnalytics',
      platforms: ['web'],
    });
  }

  async startWithKey(): Promise<void> {
    console.debug('Not supported for Full Story');
    return;
  }

  async setUserProperty(options: UserProperty): Promise<void> {
    FS.identify(options.userId, {
      displayName: options.name,
      ...options.userInfo,
    });
  }

  async stopSession(): Promise<void> {
    FS.identify(false);
  }

  async tagScreenName(): Promise<void> {
    console.debug('Not supported for Full Story');
  }
}

const CapacitorAppAnalytics = new CapacitorAppAnalyticsWeb();

export { CapacitorAppAnalytics };

registerWebPlugin(CapacitorAppAnalytics);
