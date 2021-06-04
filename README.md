# How to use endpoint  

In this example we use [json-server](https://www.npmjs.com/package/json-server) to simulate the backend.

```sh
npm install -g json-server
json-server db.json
```

# How to run this project

You need to create .env there's one sample to help you for more details check de package [envify](https://pub.dev/packages/envify)

```sh
flutter pub get
flutter pub run build_runner watch --delete-conflicting-outputs
flutter run --flavor dev # run in debug mode
flutter run --release --flavor prod # run in release mode
```

**OBS:** Sometimes it throws error in android because flutter need all flavors release build to run correctly.
