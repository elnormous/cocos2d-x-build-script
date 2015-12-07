COCOS2DX_BUILD_MAC=true
COCOS2DX_BUILD_IPHONE=true
COCOS2DX_BUILD_APPLETV=false # don't build tvOS by default, because it is not in the cocos2d-x repository

COCOS2DX_RELEASE=true
COCOS2DX_DEBUG=true

BUILD_DIR="build"

function printHelp {
	echo "OVERVIEW: builds cocos2d-x libs"
	echo ""
	echo "USAGE: $0 [options]"
	echo ""
	echo "OPTIONS:"
	echo "	-c <configurations>		Build configuration: release, debug"
	echo "	-d <directory>			Build directory"
	echo "	-h				Display available options"
	echo "	-p <platforms>			Build platforms: mac, iphone, appletv"
	exit
}

if [ -n "$1" ]
then

	CURRENT_ARG=0

	for arg in "$@"
	do
		case $arg in
			"-p")
				CURRENT_ARG=1
				COCOS2DX_BUILD_MAC=false
				COCOS2DX_BUILD_IPHONE=false
				COCOS2DX_BUILD_APPLETV=false
				;;
			"-c")
				CURRENT_ARG=2
				COCOS2DX_RELEASE=false
				COCOS2DX_DEBUG=false
				;;
			"-d")
				CURRENT_ARG=3
				;;
			"--help"|"-h")
				printHelp
				;;
			*)
				case $CURRENT_ARG in
					1)
						case $arg in
							"mac")
								COCOS2DX_BUILD_MAC=true
								;;
							"iphone")
								COCOS2DX_BUILD_IPHONE=true
								;;
							"appletv")
								COCOS2DX_BUILD_APPLETV=true
								;;
							*)
								echo "Invalid argument \"$arg\""
								exit 1
								;;
						esac
						;;
					2)
						case $arg in
							"release")
								COCOS2DX_RELEASE=true
								;;
							"debug")
								COCOS2DX_DEBUG=true
								;;
							*)
								echo "Invalid argument \"$arg\""
								exit 1
								;;
						esac
						;;
					3)
						BUILD_DIR=$arg
						CURRENT_ARG=0
						;;
					*)
						echo "Invalid argument \"$arg\""
						exit 1
						;;
				esac
				;;
		esac
	done
fi

if $COCOS2DX_BUILD_MAC
then
	if $COCOS2DX_RELEASE
	then
		xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d Mac" -configuration Release -jobs 4 CONFIGURATION_BUILD_DIR="$BUILD_DIR/Release"
	fi

	if $COCOS2DX_DEBUG
	then
		xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d Mac" -configuration Debug -jobs 4 CONFIGURATION_BUILD_DIR="$BUILD_DIR/Debug"
	fi
fi

if $COCOS2DX_BUILD_IPHONE
then
	if $COCOS2DX_RELEASE
	then
		xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d iOS" -configuration Release -jobs 4 CONFIGURATION_BUILD_DIR="$BUILD_DIR/Release-iphoneos" -sdk iphoneos
	fi

	if $COCOS2DX_DEBUG
	then
		xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d iOS" -configuration Debug -jobs 4 CONFIGURATION_BUILD_DIR="$BUILD_DIR/Debug-iphoneos" -sdk iphoneos
	fi
fi

if $COCOS2DX_BUILD_APPLETV
then
	if $COCOS2DX_RELEASE
	then
		xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d tvOS" -configuration Release -jobs 4 CONFIGURATION_BUILD_DIR="$BUILD_DIR/Release-appletvos" -sdk appletvos
	fi

	if $COCOS2DX_DEBUG
	then
		xcodebuild -project cocos2d_libs.xcodeproj -scheme "libcocos2d tvOS" -configuration Debug -jobs 4 CONFIGURATION_BUILD_DIR="$BUILD_DIR/Debug-appletvos" -sdk appletvos
	fi
fi