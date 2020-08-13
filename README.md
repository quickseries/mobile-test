# Instructions:

- Fork this git repo to your computer
- Create a branch
- When you are done, push your work and create a pull request to the original repo.

# Requirements

*Create a 3 page app.*

- When you launch the app, you should see a list of resource categories (`/data/categories.json`)
- When you click on a category, it should open a list of resources (`/data/restaurant.json` or `/data/vacation-spot.json`)
- When you click on a resource, it should open a details page (see attached mockup)

# Tips:

- You can showcase usage of Dependency Injection and Architecture Component.
- You can show how to handle threads.
- Remember you can always create a side project first and prepare yourself before jumping into the test.
- For JSON, you can use the RAW file version in git hub so you can simulate a call to remote API.

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

# Notes:

- I wanted to play with SwiftUI + Combine + MVVM for this challenge, I discovered how important is a Coordinator or a Router with SwiftUI, I didn't implemented any of them but It would have been a lot easier and cleaner.
- I also struggled a lot session dataTaskPublisher and github rawdata ended up using regular dataTask with semaphores.

# Checklist:

- [x] As a user, I want to see a list of categories
- [x] As a user, I want to see the resources inside a category 
- [ ] As a user, I want to see the details of a category. The description is HTML, but the what you see on the screen must be text.
 *Utility Extension for parsing NSAttributedString defined but with cycling attributtes, functionallity commented, works properly in other apps*
- [x] As a user, I want to sort the list of resources alphabetically
- [x] When I tap on it a second time, it should sort the list from Z-A
- [ ] As a user, I want to send an email by tapping on a resource email
 *MFMailComposeViewController defined but needs a wrapper or a coordinator to be displayed on tapping*
- [ ] As a user, I want to open the maps app on my phone when I tap on a resource address
 *Location on maps hardcoded*
- [ ] As a user, I want to open a web link without leaving the app 
 *Basic WKWebView implementation defined but needs a wrapper or a coordinator to be displayed on tapping*
- [X] As a user, I want to see a resource image 
 *Custom async imageloading view*
- [ ] As a user, I want to see a resource description 
 *Resources properly parsed, still loaded from hardcode*
