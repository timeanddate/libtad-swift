# SWIFT Framework for API Services From timeanddate.com

[![Platform](https://img.shields.io/cocoapods/p/GithubAPI.svg?style=flat)](http://cocoapods.org/pods/GithubAPI)

Use our API Services to tap into timeanddate.com's databases and integrate our data into your applications

## Service Reference

- [astronomy – Get Information About Astronomical Objects](https://services.timeanddate.com/api/doc/v3/srv-astronomy.html).
- [astrodata – Calculate data on Astronomical Objects on Specific Times](https://services.timeanddate.com/api/doc/v3/srv-astrodata.html).
- [businessdate – Calculate business date from a given number of days](https://services.timeanddate.com/api/doc/v3/srv-businessdate.html).
- [businessduration – Calculate business days in a specified date range](https://services.timeanddate.com/api/doc/v3/srv-businessduration.html).
- [converttime – Convert Time Between Time Zones](https://services.timeanddate.com/api/doc/v3/srv-converttime.html).
- [dstlist – Retrieve Daylight Saving Time Information](https://services.timeanddate.com/api/doc/v3/srv-dstlist.html).
- [holidays – Retrieve List of Holidays](https://services.timeanddate.com/api/doc/v3/srv-holidays.html).
- [places – Retrieve List of Available Places](https://services.timeanddate.com/api/doc/v3/srv-places.html).
- [timeservice – Retrieve Current Time for Place](https://services.timeanddate.com/api/doc/v3/srv-timeservice.html).

The requests created by this library use the an expiry date, 60s from creation. 

## Requirements

- iOS 12.0+ / macOS 10.14+
- Xcode 11+
- Swift 5.1+

## Instalation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate TadApi into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "TimeAndDate/TadApi"
```

### Cocoapods

[CocoaPods](https://cocoapods.org) a popular dependency manager. Using the command `pod 'libtad-swift', '~> 1.0'` to add this library to your podfile.

## Usage

```swift
let astronomyService = AstronomyService(accessKey: "[YOUR_ACCESS_KEY]", secretKey:"[YOUR_SECRET_KEY]")
```

```swift
let astronomyRequest = AstronomyRequest()
astronomyRequest.objects = "sun"
astronomyRequest.placeId = "norway/oslo"
```

```swift	
astronomyService.getAstronomicalInfo(request:astronomyRequest) { (result, error) in 
	print(result)
}
```

## Credits

TadApi is owned and maintained by the [Time and Date AS](http://timeanddate.com). You can visit our API Reference at [timeanddate.com](https://services.timeanddate.com/api/doc/v3/) for project updates and releases.

## Author

[Time and Date](https://timeanddate.com)
