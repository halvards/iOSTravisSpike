require 'yaml'

task default: [:unit]

desc 'Build xcode project'
task :build do
  xcb 'iOSTravisSpike', 'Debug', 'i386', 'iphonesimulator', 'build | xcpretty -c'
end

desc 'Run unit tests'
task :unit do
  xcb 'iOSTravisSpike', 'Debug', 'i386', 'iphonesimulator', 'test | xcpretty -c'
end

desc 'Package Ad Hoc Distribution File'
task :package_ad_hoc do
  xcb 'iOSTravisSpike', 'Release', 'i386', 'iphoneos', ' clean build | xcpretty -c'

  sh '/usr/bin/xcrun -log -sdk iphoneos ' +
     'PackageApplication ' +
     '-v "$PWD/build/Release-iphoneos/$APP_NAME.app" ' +
     '-o "$PWD/build/Release-iphoneos/$APP_NAME.ipa" ' +
     '-sign "$DEVELOPER_NAME" ' +
     '-embed "$PROVISIONING_PROFILE"'

end

def xcb scheme, configuration, arch, sdk, buildaction
  sh "/usr/bin/xcodebuild " +
     "-workspace iOSTravisSpike.xcworkspace " +
     "-configuration #{configuration} " +
     "-scheme #{scheme} " +
     "-sdk #{sdk} " +
     "-destination platform='iOS Simulator',OS=7.0,name='iPhone Retina (4-inch)' " +
     "OBJROOT=$PWD/build SYMROOT=$PWD/build " +
     "#{buildaction}"
end