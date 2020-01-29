<p align="center">
    <img src="https://github.com/terflogag/OpenSourceController/blob/master/Ressources/welcome_img.png" alt="OpenSourceController" />
</p>

<p align="center">
    <a href="https://cocoapods.org/pods/OpenSourceController" target="_blank"><img src="https://img.shields.io/cocoapods/v/OpenSourceController.svg?style=flat" alt="Cocoapods version" /></a>
    <a href="http://cocoapods.org/pods/OpenSourceController" target="_blank"><img src="https://img.shields.io/cocoapods/p/OpenSourceController.svg?style=flat" alt="Cocoapods plateform" /></a>
    <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="Prs welcome" />
</p>

<p align="center">
<a href="#features">Features</a>
• <a href="#usage">Usage</a>
• <a href="#translation">Translation</a>
• <a href="#customisation">Customisation</a>
• <a href="#installation">Installation</a>
• <a href="#license">License</a>
</p>

Display a screen with all licences used in your application can be painful to maintain. OpenSourceController was built to respond to this problem. OpenSourceController is a simple parser to display the licences which are used in your application.

<p align="center">
    <img src="https://github.com/terflogag/OpenSourceController/blob/master/Ressources/demo.gif" alt="OpenSourceController" />
</p>

## Features 

- [x] Display tableView with licences used in your app 
- [x] Download licence from an URL

## Requirements

* Xcode 11
* iOS 9.0+ target deployment
* Swift 3, Swift 4 or Swift 5.1 project

## Usage

- Import the library : 

```swift
import OpenSourceController
```

- Display the controller : 

```swift
// Create controller 
let openSourceVC = OpenSourceController()

// Init with LicenceFile object 
openSourceVC.licences = [LicenceFile(title: "FacebookImagePicker", 
                        url: "https://raw.githubusercontent.com/terflogag/FacebookImagePicker/master/LICENSE"),
                        LicenceFile(title: "JSQMessagesViewController", 
                        url: "https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/LICENSE")]

// Present controller 
openSourceVC.presentOpenSourceController(from: self)

// OR push the controller if the source controller is embeded in navigation controller
openSourceVC.pushOpenSourceController(from: self)
```

With SwiftUI : 

```swift
struct OpenSourceView: UIViewControllerRepresentable {
    @available(iOS 13, *)
    public func updateUIViewController(_ uiViewController: OpenSourceViewController, context: UIViewControllerRepresentableContext<OpenSourceView>) {
        //
    }
    
    @available(iOS 13, *)
    public func makeUIViewController(context: UIViewControllerRepresentableContext<OpenSourceView>) -> OpenSourceViewController {
        let openSourceVC = OpenSourceViewController(licences:
            [LicenceFile(title: "FacebookImagePicker",
                         url: "https://raw.githubusercontent.com/terflogag/FacebookImagePicker/master/LICENSE"),
             LicenceFile(title: "JSQMessagesViewController",
                         url: "https://raw.githubusercontent.com/jessesquires/JSQMessagesViewController/develop/LICENSE")],
                                                    showCloseButton: true,
                                                    configuration: OpenSourceControllerConfig(),
                                                    licenceLoader: LicenceLoader())
        return openSourceVC
    }
}
```

## Customisation

You can apply some customisation. To do it you can use the OpenSourceControllerConfig structure like this :

```swift
// Navigation bar title 
openSourceVC.config.title = "MyCustomTitle"

// Close button color 
openSourceVC.config.uiConfig.closeButtonColor = UIColor.white

// BackgroundColor 
openSourceVC.config.uiConfig.backgroundColor = UIColor.red.withAlphaComponent(0.6)

// Licence text color  
openSourceVC.config.uiConfig.licenceTextColor = UIColor.white

// Navigation bar title color
openSourceVC.config.uiConfig.titleColor = UIColor.white

// Licence cell background color 
openSourceVC.config.uiConfig.licenceBackgroundColor = UIColor.red

// Verbose mode 
openSourceVC.config.verbose = true
```

## Translation 

OpenSourceController is currently write in english. If you need translation for the permission popup (or whatever thing), just add this line in your localized file  :

```
"Unable to load this licence." = "<your_translation>";
```

## Installation

- To integrate OpenSourceController into your Xcode project using [Swift Packet Manager](https://github.com/apple/swift-package-manager), specify this url in Xcode : `https://github.com/floriangbh/OpenSourceController`

- To integrate OpenSourceController into your Xcode project using [CocoaPods](http://cocoapods.org), specify it in your Podfile :

```ruby
pod "OpenSourceController", '~> 3.0.0' # Swift 4.2 Version

pod "OpenSourceController", '~> 2.0' # Swift 4.0 Version 

pod "OpenSourceController", '~> 1.0.8' # Swift 3.1 version
```

- To integrate OpenSourceController into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your Cartfile :

```ruby
github "floriangbh/OpenSourceController" ~> 3.0.0 # Swift 4.2 version

github "floriangbh/OpenSourceController" ~> 2.0 # Swift 4.0 version

github "floriangbh/OpenSourceController" ~> 1.0.8 # Swift 3.1 version
```

## Author

Florian Gabach, florian.gabach@gmail.com

## License

OpenSourceController is available under the [MIT license](LICENSE).
