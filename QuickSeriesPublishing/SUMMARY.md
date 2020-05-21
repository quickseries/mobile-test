#  Summary
***Folder architecture***
1. Views: contains all classes for related to ui view such as section headers and cell
2. Xibs: contains all nib files + storyboards
3. Interactors: used to fetch data. Currently it conforms protocols which allowed us to switch environment for fetching: either from local json or from network request
4. Mocks: local jsons
5. Models: entities or objects from json
6. ViewModels: viewmodels to handle business logics
7. ViewControllers: contains view controllers

***Details about Interactors + Dependency Injection + Architecutre Component***
1. Currently, a service/interactor responsible for fetching data is injected via initilization of a view model ( by using MVVM pattern ) In actual application, we can have another interactor to fetch a real data from network by conforming a protocol ( CategoryInteracting or ResourceInteracting)


***Details about Interacting protocol***
1. **ResourceInteracting** accepts 2 params which are *id* and *completion block*. The reason for it is I assume we need a categoryId to fet data from network request. At the moment, fetching local json does not need *id* params.
2. **CategoryInteracting** accepts 1 param which is a completion block executed later on when fetching is completed. 

***Details about threadings***
1. Assuming if we have a network call done by using URLSession.shared.dataTask, this will be done in background thread. Since we are using a callback to execute some tasks ( such as trigger table view to reload data ), therefore, we must perform these task in main thread and it is done in a view controller ( please look at CategoryViewController and ResourceViewController )

***Improvement needed to be done***
1. Create a helper method to instantiate and load xib files
2. Need a better way to tell an user if a restaurant is selected or a vacation-spot selected from category. At the moment, Im based on the slug which is not a good idea. 
3. Using Coordinator to perfom view transition.

***2 test cases added to test a Resource model***
1. restaurants1 and restaurants2 are added for testing purposes. Notice, the order of object are changed due to sort.

***Pod files added (Kingfisher)***
1. please do pod install before run the project





