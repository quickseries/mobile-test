# Demo Quick Series Application using Clean architecture, MVVM and RxSwift
# Upcoming Features!

if I hade time:
- i would rather to fix some bugs on address tableview in detail view controller
- open mapps in address tableview
- open sent message in contact info tableview
- fix dismissing mail presented controller
- try to learn some unit test and use it in the project :) 

### Installing and build

Dependencies in this project are provided via Cocoapods. Please install all dependecies with

`
pod install
`

#### Build sequence:

`
Domain > NetworkPlatform > Application 
`

## High level overview
![](https://raw.githubusercontent.com/sergdort/CleanArchitectureRxSwift/master/Architecture/Modules.png)

#### Domain 

The `Domain` is basically what is the App about and what it can do (Entities, UseCase etc.) **It does not depend on UIKit or any persistence framework**, and it doesn't have implementations apart from entities

#### Platform

The `Platform` is a concrete implementation of the `Domain` in a specific platform like iOS. It does hide all implementation details.

#### Application
`Application` is responsible for delivering information to the user and handling user input. It can be implemented with any delivery pattern e.g (in quiz app is MVVM). This is the place for `UIView`s and `UIViewController`s. As you will see from the quiz app, `ViewControllers` are completely independent of the `Platform`.  The only responsibility of a view controller is to "bind" the UI to the Domain to make things happen.

# User Stories

|    |                                                                                      | Acceptance Criteria                                                             |
|----|--------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| 1  | As a user, I want to see a list of categories                                        | The list items must link to the resources page                                  |
| 2  | As a user, I want to see the resources inside a category                             | The list items must link to the details page                                    |
| 3  | As a user, I want to see the details of a category                                   | The description is HTML, but the what you see on the screen must be text        |
| 4  | As a user, I want to sort the list of resources alphabetically                       | When I tap on the sort button, the list should sort from A-Z                    |
| 5  | When I tap on it a second time, it should sort the list from Z-A                     | As a user, I want to send an email by tapping on a resource email               |
| 6  | It should open the email without leaving the app                                     | As a user, I want to call one of the phone numbers on the resource details page |
| 7  | As a user, I want to open the maps app on my phone when I tap on a resource address  |                                                                                 |
| 8  | As a user, I want to open a web link without leaving the app                         | It should open a web browser without leaving the app                            |
| 9  | As a user, I want to see a resource image                                            |                                                                                 |
| 10 | As a user, I want to see a resource description                                      |                                                                                 |

# Mockup:

Use the following mockup as a UI guide for your app (the image is at the root of the project). This mockup contains more details that you actually will need in this test. Please use with intepretation. We do not provide you with any specs, so please use your imagination while trying to respect the mockup as much as you can.

![Mockup](https://github.com/quickseries/mobile-test/blob/master/resources_android.png "Mockup")





### Refrences
* [RxSwift](https://github.com/ReactiveX/RxSwift)
* [RxSwift Book](https://store.raywenderlich.com/products/rxswift)
* [Robert C Martin - Clean Architecture and Design](https://www.youtube.com/watch?v=Nsjsiz2A9mg)
* [Cycle.js](https://cycle.js.org)
* [ViewModel](https://medium.com/@SergDort/viewmodel-in-rxswift-world-13d39faa2cf5#.qse37r6jw) in Rx world

### Contact me

* feel free to contact by [Email](mailto://salar.soleimani@icloud.com)
* or send me message on [Telegram](https://t.me/salarsoleimani)

