xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d Mac" -configuration Release -jobs 4 CONFIGURATION_BUILD_DIR=build/Release

xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d Mac" -configuration Debug -jobs 4 CONFIGURATION_BUILD_DIR=build/Debug

xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d iOS" -configuration Release -jobs 4 CONFIGURATION_BUILD_DIR=build/Release-iphoneos -sdk iphoneos

xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d iOS" -configuration Debug -jobs 4 CONFIGURATION_BUILD_DIR=build/Debug-iphoneos -sdk iphoneos

xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d tvOS" -configuration Release -jobs 4 CONFIGURATION_BUILD_DIR=build/Release-appletvos -sdk appletvos

xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d tvOS" -configuration Debug -jobs 4 CONFIGURATION_BUILD_DIR=build/Debug-appletvos -sdk appletvos
