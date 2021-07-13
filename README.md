# SpaceLaunchApp
Cinkciarz.pl Recruitment Task

## Task description

An application fetching the data from the public API at https://thespacedevs.com/.

## Business requirements

* After launching, the app should display an starting logo. Logo should have 50% of screen width and should maintain its proportions.
* After launching - the app should load an list of rocket launches from API.
  * Endpoint: **https://ll.thespacedevs.com/2.0.0/launch/upcoming**
  * List should have elements: name, date of start, start status and space agency name.
  * List should be sorted descending (newest starts at top)
  * List should be paginated. Default - API returns 10 records, app should have an ability to load 20. If the user scroll down the list to the last record, the list should reload another 20 elements.
  * Date should be parsed and formatted by template: yyyy-MM-dd HH:mm (Warsaw Time)
* After tapping the selected record on the list, user should be moved on to the launch details view (push move type:)
* At the launch details view - app should load:
  * name
  * launch start date
  * start status
  * space agency name
  * rocket name
  * start location name
  * rocket image view - sized to fit 80% of screen width
* Also if a video is available for selected launch, the button "Video" should be placed on view. After clicking the button an action should be executed - opening the video URL in a web browser.
  * YouTube links are not available in the API endpoint with launch list, for a link checkup you need to use another endpoint: **https://ll.thespacedevs.com/2.0.0/launch/upcoming/{launchid}**, the id parameter is available in all JSON response objects from first endpoint.

## Technical requirement

* Swift 5.0
* iOS 12 and newer
* iPad compatibility
* Request handled by Alamofire library - implemented into project by dependency manager.
* API response should be parsed in any kind of way, preferably by **Decodable** protocol
* "Try-to" keep clean architecture. Avoid Massive-View-Controller. Parsing and logic methods should be not placed inside of controllers.
* All screens should be prepared with programatically AutoLayout.
* App should support two iOS colour themes - Light Mode and Dark Mode
* If the app fetches some data from the network, it should even minimalistically present that to the user.

## TODO:

* Refactor of the code - clean UP
* Add pagination to the list
* Add nullable to the rocket name
* Guard for parsing data in API class
* Unit and UI Tests
