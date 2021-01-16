import { WebPlugin } from '@capacitor/core';
import { LogEventProperty, UserProperty, UXCamPlugin } from './definitions';

declare const FS: any;

export class UXCamPluginWeb  extends WebPlugin implements UXCamPlugin {
  constructor() {
    super({
      name: 'UXCamPlugin',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async logEvent(options: LogEventProperty): Promise<void> {
    FS.event(options.eventName, {
      ...options.properties,
    });
  }

  async getEnabledMultiSessionRecord(): Promise<{ value: boolean }> {
    console.debug('Not supported for Full Story');
    return { value: false };
  }

  async setAutomaticScreenNameTagging(): Promise<void> {
    console.debug('Not supported for Full Story');
    return;
  }

  async setMultiSessionRecord(): Promise<void> {
    console.debug('Not supported for Full Story');
    return;
  }

  async setUserIdentity(options: { userIdentity: string }): Promise<void> {
    FS.identify(options.userIdentity);
  }

  async setUserProperty(options: UserProperty): Promise<void> {
    FS.setUserVars({ ...options.properties });
  }

  async startWithKey(): Promise<void> {
    console.debug('Not supported for Full Story');
    return;
  }

  async stopSession(): Promise<void> {
    FS.identify(false);
  }

  async tagScreenName(): Promise<void> {
    console.debug('Not supported for Full Story');
  }
}

const UXCam = new UXCamPluginWeb();

export { UXCam };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(UXCam);