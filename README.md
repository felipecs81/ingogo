# ingogo

Ingogo Flutter challenge app

##Project Structure

Architecture: CleanArch
State manager: Provider

The folder structure of this app is explained below:

- lib/data: Contains classes that access data remotely and also the repositories in which the API classes are injected and implement domain interfaces
- lib/di: Contains the file with the dependency injection configuration
- lib/domain: This folder contains the project's business rules as interfaces that are implemented by the data folder's classes, wrappers, models and use cases.
- lib/helpers: Contains helper classes for different situations like remote calls, socket manipulation and mocks
- lib/navigation: This folder contains the configuration files, routes and routers for the app's navigation system.
- lib/presentation: In this module are located the screens, view models, adapters or any other type of component that is linked to the UI
- lib/resources: This folder contains project resource files like styles, strings, colors etc.
- lib/utils: In this folder are located utility classes for the app and UI.
- lib/widgets: In this folder are located the custom widgets (components) of the project that will be used in the screens.

##Socket implementation (Native Android)

- Socket events and method channel are located
- SocketUtils is the class that handle websocket
- The following dependency was used to implement websockets: org.java-websocket:Java-WebSocket

##Production config

- No additional config is necessary. Just need to to build the app in release mode.