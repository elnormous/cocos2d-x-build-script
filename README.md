# cocos2d-x build script for Xcode
Script that builds cocos2d-x libs on Mac using Xcode

## Usage

1. Clone cocos2d-x
2. Copy the build.sh to “build” directory of cocos2d-x
3. Run the build.sh. You can run it without arguments to build all configurations (release, debug) for all platforms (mac, iphone). Or you can specify which platforms and which configurations to build:

```
./build.sh -p mac iphone -c release -d output -j 4
```

## Options

* **-c** – Build configuration: release, debug
* **-d** – Build directory
* **-h** – Display available options
* **-p** – Build platforms: mac, iphone, appletv
* **-j** – Count of parallel build jobs