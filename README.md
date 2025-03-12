# HAMA

HAMA (Home Asset Management App)

This is an app that  allow users to create and manage homes along with their key assets—essential systems and equipment that impact a home’s functionality, efficiency, and value.

You can access a web version [HERE](https://hama-35a8a.web.app/)

## Details

This app was made using Flutter to work in these platforms:
* Android
* iOS
* Web
* MacOS

## To Run

SDK:
- Flutter: 3.29.0
- Dart: 3.7.0

### Manually

You can just use `flutter run` or `flutter run -d <platform>` than the app will build and run the debug version in your device.

To run the tests use `flutter test`

## Design

### Architecture
The app use the principles of Clean Arquitecture, spliting the layers of the developed code, the main layers are Data, Domain and Presenter, this was choosed to prioritize the maintainability and testability of the app, making it more scalable.

For the presentation layer was choosed MVVM, using Cubit as State Management, using it we can have less coupling between the business logic and the UI.

The [Core Folder](lib/src/core) has the main business logic of the system, how the UseCases that hold behavior of the logic of the app, in this folder there is the system_design widgets and tokens to be used allover the app.

In the [Features Folder](lib/src/features) there is the pages and some features the app.

### System Design

To make the design more consistent it is been used system design principles, using tokens to keep the colors and typo named and reusable and the same for the components, where it is possible to reuse it.

## Tests

The tests is applied for the domain layer to keep the business logic of the app consistent.