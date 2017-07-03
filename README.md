## TXFPSCalculator


### Installation with CocoaPods
    
CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. 

**Podfile**

    platform :ios, '7.0'
    pod 'TXFPSCalculator'
    
    
### Usage 

**STEP 1**:

    
    #ifdef DEBUG
        #import "TXFPSCalculator.h"
    #endif


**STEP 2**:

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        [self.window makeKeyAndVisible];
    #ifdef DEBUG
        [[TXFPSCalculator calculator] start];
    #endif
        return YES;
    }

### License

`TXFPSCalculator` is available under the MIT license. See the LICENSE file for more info.

## Ad

Welcome to my Official Account of WeChat.

![wechat-qrcode](http://image.tingxins.cn/adv/wechat-qrcode.jpg)


