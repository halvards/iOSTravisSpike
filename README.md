iOSTravisSpike
==============

###TravisCI Pipeline  
https://travis-ci.org/mlamtw-org/iOSTravisSpike  

[![Build Status](https://travis-ci.org/mlamtw-org/iOSTravisSpike.png?branch=master)](https://travis-ci.org/mlamtw-org/iOSTravisSpike)


###Local setup


Install CocoaPods:

	$ [sudo] gem install cocoapods
	$ pod setup

Install dependencies

	$ pod install

Install other gem  

	$ bundle install
	
- xcpretty (pretty format for xcodebuild output)
- Travis gem (for encrypting passwords to Travis ENV)

Run unit tests

	$ rake unit
	
Build xcode project

	$ rake build


