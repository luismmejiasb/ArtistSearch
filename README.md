#  ArtistSearch

Application that uses [iTunes Search API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api//)  web services to have a look at how API REST services can be consumed with VIPER architecture using the Swift programming language. The dependencies are managed with Swift Package Manager. The information Property List is used to store custom key-values such as API keys and base URLs. The Application is capable to handle the Localization/Internalization behavior.

![Version](https://img.shields.io/badge/version-1.4.0-blue.svg)
![Platforms](https://img.shields.io/badge/platform-iOS13.0-blue.svg)
![Swift version](https://img.shields.io/badge/swift-5-blue.svg)


## 1. Getting started


### Prerequisites
* Swift 5
* Xcode 10.2+
* iOS 13+

## 3. Versioning

[SemVer](http://semver.org/) 


## 5. Implementations

## a) Viper Architecture


### Module Components

Each module consists of the following parts:
- View (View, ViewController) 
- Interactor (Business Logic, Use Cases) 
- Presenter (Prepare Business logic for presentation in the View)
- Entity (Model) 
- Wireframe (Assemble each module and Take control of Routing)
- Repository & DataSources (LocalSource and or CloudSource)


### Dependency Graph

The dependence graph is unidirectional, which means:

**View** knows about **Presenter**
**Presenter** Is the heart of VIPER, it knows about **Router**, **View** and **Interactor** . It gets the user interactions from the UI, create requests to the Interactor and then retrieve back and display the information in the View and also order Router to present another module or UI component.
**Interactor** communicates with Repository (Database/REST) and retrieve to the presenter. 
**Router** knows about **View** and display new modules or UI components like UIAlertView in the Controller.

Note: Viper is like an onion. The outer layers are dependent on the closest inner layer. And the inner layers have no knowledge of the outer layers. 


## b) Unit Testing

Due to the good separation of concerns, VIPER allows us to create UnitTets more easily. 

## c) Delegation

Delegation is a simple and powerful pattern in which one object in a program acts on behalf of, or in coordination with, another object. Due to that is a pattern created and largely used by apple, we can see it in all the UI components that uses it, like:
- UICollectionViewDelegate
- UISearchBarDelegate

## d) Facade

Facade is an object that serves as a front-facing interface masking more complex underlying or structural code, in the project there is no such complexity, but this concept can be found in: 
- ArtistSearchHTTPErrorMessageFacade

So I avoided to import HTTPErrorMessage library wherever I had to use it.

## e) Singleton

Singleton is a design pattern that ensures that only one object of its type exists and provides a single point of access to it for any other code. We can find this implementation in:
- ArtistSearchHTTPErrorMessageFacade
