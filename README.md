# How to use endpoint  

In this example we use [json-server](https://www.npmjs.com/package/json-server) to simulate the backend.

```sh
npm install -g json-server
json-server db.json
```

```sh
flutter pub get
flutter pub run build_runner watch --delete-conflicting-outputs # run in diffent tab
flutter run --flavor dev # run in debug mode
flutter run --release --flavor prod # run in release mode
```

**OBS:** Sometimes it throws error in android because flutter need all flavors release build to run correctly.


# Firebase configuration with different flavors

Check this settings [link](https://pub.dev/packages/flutter_flavorizr#google-firebase) to implement firebase with different flavors