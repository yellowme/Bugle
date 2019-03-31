# Bugle

[![Version](https://img.shields.io/cocoapods/v/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)
[![License](https://img.shields.io/cocoapods/l/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)
[![Platform](https://img.shields.io/cocoapods/p/Bugle.svg?style=flat)](http://cocoapods.org/pods/Bugle)

Bugle, is a helper for displaying alerts without writing boilerplate code.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To give `Bugle` a try with an example project, run the following command:

```bash
$ pod try Bugle
```

To integrate `Bugle` into your Xcode project, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target 'MyApp' do
    pod 'Bugle', '~> 2.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Simple usage

At your view controller use:

```swift
let alert = UIAlertController(style: .alert, title: "Bugle", message: "This is an alert with title")
alert.addAction(title: "OK", style: .cancel)
alert.show()
```

## Customize

Since this version is depending directly to `UIAlertController` extensions you could create a file with your own extension methods:

```swift
extension String {
    // NOTE: Maybe you could use localization approaches here.
    static let defaultAlertTitle = "Bugle"
    static let defaultAlertActionLabel = "Understood"
}

// MARK: - Initializers
extension UIAlertController {
    /// Create new alert view controller.
    ///
    /// - Parameters:
    ///   - message: alert controller's message (default is nil).
    ///   - tintColor: alert controller's tint color (default is nil)
    convenience init(message: String? = nil, tintColor: UIColor? = nil) {
        self.init(
            title: String.defaultAlertTitle,
            message: message,
            preferredStyle: .alert
        )
    }
}

extension UIAlertController {
    /// Displays an alert view by adding the default action in order to be able to dismiss it.
    func play() {
        self.addAction(UIAlertAction(title: String.defaultAlertActionLabel, style: .default, handler: nil))
        self.show()
    }
}
```

Then:

```swift
let alert = UIAlertController(message: "Hello World!")
alert.play()
```

See a [full version here](https://github.com/yellowme/Bugle/blob/master/Bugle/Example/UIViewController%2BBridge.swift)

## Contributors

* [Luis Burgos](https://github.com/LuisBurgos/) - luisarturo.burgos@gmail.com
* [María Patrón](https://github.com/maj24/) - mariajose.patron@gmail.com

## License

Bugle is released under the MIT license. See [LICENSE](https://github.com/nmdias/DefaultsKit/blob/master/LICENSE) for details.
