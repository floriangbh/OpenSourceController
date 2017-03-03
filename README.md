<p align="center">
    <img src="https://github.com/terflogag/OpenSourceController/blob/master/Ressources/welcome_img.png" alt="OpenSourceController" />
</p>

<p align="center">
<img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="Prs welcome" />
</p>

<p align="center">
<a href="#features">Features</a>
• <a href="#installation">Installation</a>
• <a href="#usage">Usage</a>
• <a href="#translation">Translation</a>
• <a href="#license">License</a>
</p>

Display a screen with all licences used in your application can be painful to maintain. OpenSourceController was built to respond to this problem. OpenSourceController is a simple parser to display the licences which are used in your application.

<p align="center">
    <img src="https://github.com/terflogag/OpenSourceController/blob/master/Ressources/demo.gif" alt="OpenSourceController" />
</p>

## Features 

- [x] Display tableView with licences used in your app 
- [x] AppStore ready
- [x] Swift 3 

## Todo

- [ ] Download licence from Podfile (https://github.com/terflogag/OpenSourceController/issues/1)
- [ ] Download licence from Cartfile (https://github.com/terflogag/OpenSourceController/issues/2)
- [ ] Carthage support (feel free to make PR)
- [ ] Unit & UI Test (feel free to make PR)

## Requirements

* Xcode 8 
* iOS 9.0+ target deployment
* Swift 3 project 

## Installation

OpenSourceController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "OpenSourceController"
```

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
```

## Translation 

OpenSourceController is currently write in english. If you need translation for the permission popup (or whatever thing), just add this line in your localized file  :

```
"Tiers library" = "<your_translation>";
"Unable to load this licence." = "<your_translation>";
```

## Applications

Some applications already use this picker like :
- [Troll Generator](https://itunes.apple.com/fr/app/troll-generator/id1038097542?mt=8)
- [Giraf](https://itunes.apple.com/fr/app/giraf/id1136592561?mt=8)

What about yours ? If your application also use this library, feel free to contact me or make pull request on the README 😁

## Author

Florian Gabach, contact@floriangabach.fr

## License

OpenSourceController is available under the [MIT license](LICENSE).
