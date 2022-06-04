# InstaBosta
This project is a sample test app for Bosta to show random user data from set of users and his/her albums and the album photos.

Now we will show a quick guide about the main classes in the project, the structure of the targets, as well as the pattern used .

## Installation
Clone or download the project 


## Targets
We have 2 targets in the App
#### - InstaBosta
The App's main target. Gots the app logic, coordinators...
#### - InstaBostaTests
A simple tests target for InstaBostaTests as a sample.

## App Structure
The app uses a MVVM pattern with RxSwift and  Coordinator, but not being 100% faithful because it was built with Layered Architecture in mind.
The components are the followings:

#### - Presentation Layer
##### - ViewController
  It'll act as the "View" component of the MVVM module. It'll only draw what the presenter tells him. It doesn't know anything about requests, models, data or some kind of business/model tasks.
  What concerns a view in this pattern is to draw, animate, take care of the view lifecycle and show the user the data in a pretty manner.
##### - Views / Cells 
     just dummy views to show the data  
#### - BusinessLogic Layer
  This class acts like a decorator for the view. It handles the models that the ViewModels tells him in order to process it and prepare it for the view.
  It just knows the view, and receive orders from the Business in order to prepare the data to be shown in the view.
#### - Data Layer 
  This is a simple classes that only hold the data ( Response from the apis)
  

#### - Network Layer 
  The app uses Moya with RxSwift
  
#### - Coordinators
    I used Coordinators to navigate through the app
    They're also not part of the module, but they are in the main target as they define the concrete app lifecycle by chaining one coordinator to another and so on.


## FAQ
  
#### - Why there are just a few tests?
 in the future if it's needed, I'll add some new tests to all targets!
 Also, and I'm aware of it, I have to improve my testing skills and It will be a cool idea to improve them in this project.


## More
Suggestions? Questions? Threats? If it's the case, just let me know 😅
