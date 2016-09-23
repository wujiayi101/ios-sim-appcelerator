# iOS Simulator Accelerate Script
Apple's Instruments / UIAutomation tool have an built in delay issue, so the simulator runs very slow.  There is a [third party patch](https://discuss.appium.io/t/xcode-6-ios-7-1-sim-slowness/1242/9) that can fix this issue. 

And here is script to apply the patch without any pains.
```bash
    git clone {your git url}
    cd ios-sim-appcelerator
    ./accelerate_ios_sim.sh
```
