# nssf_interview ![Coverage](https://raw.githubusercontent.com/wizlif/flutter_interview/master/resources/coverage_badge.svg)

A new Flutter project.

## Getting Started

This project is built using Flutter 3.7.9.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Quick test
[Download Android APK](https://raw.githubusercontent.com/wizlif/flutter_interview/master/resources/app-release.apk)

## Running the project

1. Run `flutter pub get` to get all dependencies.
2. Create a `.env` file in the project root. With referal to `.env-example`. This will include the open weathe API key and url. 
3. Build auto-generated resources with `flutter pub run build_runner build --delete-conflicting-outputs`.
4. Create goole map configurations. For iOs use `ios/Flutter/GoogleMaps.xcconfig.example` to create a `ios/Flutter/GoogleMaps.xcconfig` file containing the google map key. For android use `android/maps.properties.example` to create a `android/maps.properties` file that contains the google maps api key configuration.
5. Run the flutter project to iOs or android. 

## Tasks

1. Please demonstrate best practices - including but not limited to,
    + [x] Architecture
    + [x] Design Patterns
    + [x] Unit Testing (TDD Preferential)
    + [x] Proper use of the SOLID principles
    + [x] Integration into a CI/CD build pipeline
    + [x] Code coverage integration
    + [x] Static code analysis
    + [x] Please note these are additional requirements, complete the ones you are comfortable with to demonstrate your knowledge and experience
2. Please also take some initiative and implement some additional features like,
    + [x] The ability to save different weather locations as favourites
    + [x] The ability to view a list of favourites
    + [x] The ability to get extra information about a specific location
    + [x] Using something like the Google Places API - https://developers.google.com/places/web-service/intro
    + [ ] The ability to see weather information while the application is offline (show time last updated etc)
    + [x] Allow the user to view saved locations on a map
        + [x] Meaning the user should be able to access a map and see all the weather locations they have saved as favourites and where they are now.

## Previews

| Android | iOs |
| --- | --- |
| ![](resources/android/01.png) | ![](resources/ios/01.png) |
| ![](resources/android/02.png) | ![](resources/ios/02.png) |
| ![](resources/android/03.png) | ![](resources/ios/03.png) |
| ![](resources/android/04.png) | ![](resources/ios/04.png) |
