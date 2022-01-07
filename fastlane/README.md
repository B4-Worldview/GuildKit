fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios beta
```
fastlane ios beta
```
Push a new beta build to TestFlight
### ios build_and_test
```
fastlane ios build_and_test
```
Tests the app
### ios build
```
fastlane ios build
```
Builds the app and outputs binaries
### ios build_for_testing
```
fastlane ios build_for_testing
```
Build for testing
### ios unit_tests
```
fastlane ios unit_tests
```
Runs tests

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
