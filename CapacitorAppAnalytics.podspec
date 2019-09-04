
  Pod::Spec.new do |s|
    s.name = 'CapacitorAppAnalytics'
    s.version = '0.0.1'
    s.summary = 'UXCam and FullStory app analytics'
    s.license = 'MIT'
    s.homepage = ' https://github.com/ClipboardHealth/capacitor-app-analytics.git'
    s.author = 'Bharani'
    s.source = { :git => ' https://github.com/ClipboardHealth/capacitor-app-analytics.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
    s.dependency 'UXCam'
    s.static_framework = true
  end