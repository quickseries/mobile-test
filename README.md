## Version

1.0

## Build and Runtime Requirements
+ Xcode  11 or later
+ iOS 12.0 or later

## App Dependencies

None.

## Application Architecture

The project includes iOS app target and unit tests target. Architecture that was used for the app is Model-View-Presenter-Router.

### iOS

The iOS version of the app follows core iOS design principles. It follows the Model-View-Presenter-Router (MVP-R) design pattern and uses modern app development practices including Xib files and Auto Layout. It also uses protocol oriented development with single responsibility and encapsulation principles. In the project, we use only dependency injection and don't use Singleton pattern. This approach allows covering 100% of the business logic code with unit tests.

Here is a brief description of MVP-R components.
#### Model
These are data models of type Codable, that contains information fetched from backend. Structure & properties will be equivalent to the backend response in most of the cases. These models are later transformed/formatted to UIModels, which are plain objects, before it can be shown to the users in UI.

#### View
This component represents information in UI. Usually, it is an instance of UIViewController, that is responsible for that. Also, UIViewController should inherit from BaseController, to make sure it inherits the common logic & protocol. In MVP-R, View holds a strong reference to Presenter via the protocol, and Presenter keeps a weak reference to View. This approach allows making sure, that when View (UIViewController)  is deallocated, Presenter will be deallocated as well. 

#### Presenter
This component is responsible for business logic handling. The presenter fetches data from the backend, converts it using Formatter, and passes it to the View (UIViewController).
It will have a reference to:
-  An appropriate ServiceAPI to make API calls.
- Data Formatter to convert data from Model to UIModel. 
- Factory to create ChildViewContoller component and it's Presenter. 
- A delegate, that will handle all action, out of Presenter's scope. For example - navigation. Usually, a Router will conform to Presenter's delegate protocol and will be injected as a dependency.

#### Router
This component is responsible for navigation within the app. It has a reference to an instance of UINavigationController. There is a separate Router instance for each flow in the app. 
When screen 'Foo' needs to be shown, a Router creates the following: FooController, FooPresenter, FooFactory(if needed). After, it passes all dependencies to FooPresenter (FooController, FooFactory) and himself as FooPresenterDelegateProtocol.
Eventually, when FooPresenter is done with logic in it, or user clicks to proceed to the next screen, FooPresenter will deliver this event back to a Router. Router, as a result, will create new classes for next screen and will push it (Like it was with FooController). The whole idea is to encapsulate the logic of navigation between screens into a Router, and to make sure a Presenter doesn't know about other Presenters. 

Additional components.
#### API class
This component is responsible for making API calls, and it would return an appropriate parsed Model type.

#### UIModel
This is transformed information from Model. Usually, it is Formatter responsible for data transformation. But in some cases, Presenter can take care of this logic as well. The main idea here is to encapsulate data transformation logic in Formatter, and let UIViewController only to show the final result in UI. This way we make sure UIViewController does not take care of any business logic but just showing UIModels in UI.

#### Formatter
This component is only responsible for transforming Model to UIModel

#### Factory
This component is responsible to create new modules. A module would usually include FooController, FooPresenter, FooFactory(if needed). Only FooController would be returned from public API via a protocol like this: FooControllerProtocol.


#### String Constants

Constants are defined using structs and static members to avoid keeping constants in the global namespace. One example backend endpoint constants, which are typically defined as global string constants in Swift. Nested structures inside types allow for better organization in Swift.


## Unit Tests

Project has unit tests written for the business logic classes like Presenter, API class, Formatter, Router, etc.
