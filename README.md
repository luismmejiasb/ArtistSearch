#  ArtistSearch

Codebase for [ArtistSearch]

Application that uses [iTunes Search API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api//)  web services to have a look at how API REST services can be consumed with VIPER architecture using the Swift programming language. The dependencies are managed with CocoaPods. The information Property List is used to store custom key-values such as API keys and base URLs. The Application is capable to handle the Localization/Internalization behavior.

![Version](https://img.shields.io/badge/version-1.0.1-blue.svg)
![Platforms](https://img.shields.io/badge/platform-iOS10.0-blue.svg)
![Swift version](https://img.shields.io/badge/swift-4.2-blue.svg)

## 1. Getting started

### Prerequisites
* CocoaPods 1.5.3
* Swift 4.2
* Xcode 10+

## 2. Running the project
* Install Cocoapods

## 3. Versioning

[SemVer](http://semver.org/) 

## 4. Authors

* **Luis Mejías** - *Main work* - [GitHub](https://github.com/luismejiasb93)

## 5. Implementations

## Viper

### Viper Components

Each VIPER module consists of the following parts:

- View (View, ViewController) 
- Interactor (Business Logic, Use Cases) 
- Presenter (Prepare Business logic for presentation in the View)
- Entity (Model) 
- Wireframe (Assemble each module and Take control of Routing)

### Dependency Graph

The dependence graph is unidirectional, which means:
**View** knows about **Presenter**
**Presenter** knows about **Wireframe** and **Interactor** 
**Interactor** communicates with Database/REST. 
It is like an onion. The outer layers are dependent on the closest inner layer. And the inner layers have no knowledge of the outer layers. 

## Unit Testing
One advantage of VIPER is that it makes unit testing so much easier!
We have been able to fully test Interactor, Presenter, Entity and Router. 


## Delegation
Delegation is a simple and powerful pattern in which one object in a program acts on behalf of, or in coordination with, another object.
