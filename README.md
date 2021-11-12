# SWIFT Framework for API Services From timeanddate.com

[![Platform](https://img.shields.io/cocoapods/p/GithubAPI.svg?style=flat)](http://cocoapods.org/pods/GithubAPI)

Use our API Services to tap into timeanddate.com's databases and integrate our data into your applications

## Service Reference

- [astronomy – Get Information About Astronomical Objects](https://dev.timeanddate.com/docs/astro/).
- [astrodata – Calculate data on Astronomical Objects on Specific Times](https://dev.timeanddate.com/docs/astro/).
- [businessdate – Calculate business date from a given number of days](https://dev.timeanddate.com/docs/calculator/).
- [businessduration – Calculate business days in a specified date range](https://dev.timeanddate.com/docs/calculator/).
- [converttime – Convert Time Between Time Zones](https://dev.timeanddate.com/docs/time/).
- [dstlist – Retrieve Daylight Saving Time Information](https://dev.timeanddate.com/docs/time/).
- [holidays – Retrieve List of Holidays](https://dev.timeanddate.com/docs/holidays/).
- [places – Retrieve List of Available Places](https://dev.timeanddate.com/docs/places).
- [timeservice – Retrieve Current Time for Place](https://dev.timeanddate.com/docs/time/).

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

TadApi is owned and maintained by the [Time and Date AS](https://www.timeanddate.com). You can visit our API Reference at [timeanddate.com](https://dev.timeanddate.com/docs/toc) for project updates and releases.

## Author

[Time and Date](https://www.timeanddate.com)
