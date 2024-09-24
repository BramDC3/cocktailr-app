# Cocktailr

Cocktailr is an app for cocktail enthusiasts to discover new cocktail recipes.
It also comes with Brina, a sassy, friendly bartender who assists you on your cocktail journey.

## How to build the app

- Clone the repository
- Install fvm (Flutter Version Manager) from [here](https://fvm.app/)
- Run `fvm install` to install the Flutter version specified in the `.fvmrc` file
- Run `fvm flutter pub get` to install the dependencies
- Run `fvm flutter run` to run the app on your connected device or emulator

## CI/CD

The idea was to use GitHub, GitLab, Codemagic... any CI/CD platform that allows you to define, in code, what a / the pipeline(s) should look like. Fastlane is used to define lanes to test, build and distribute the app.

The platform defines the when and the what, Fastlane defines the how.

### Flow
Because this is a small project, the flow doesn't have to be very complicated. Feature branches are created which are then merged into main, but for small changes it's also allowed to push to main directly. Then, whenever enough value has been added, a new release branch is created and a new version of the app will be distributed.

On push to main:
- run tests
- create debug build

On push to release branch:
- run tests
- create release build
- publish to Firebase app distribution

## Architecture

The app is built using the [Riverpod architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/). This architecture leans heavily on the [Riverpod package](https://riverpod.dev/), making the most of its reactive caching and data-binding features.

## What's next?

- App icon & splash screen
- Crash reporting
- Web app with WASM
- General improvements to Brina
- Feature to take a picture of ingredients you have and ask which cocktails you can make with them
