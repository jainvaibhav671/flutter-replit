# Flutter Starter

A Flutter starter app with a responsive home screen, interactive counter, and light/dark theme toggle.

## Run the web preview

```sh
cd flutter_app
flutter pub get
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

## Run on a device

```sh
cd flutter_app
flutter run
```

Select an Android or iOS device when the corresponding SDK is available. To create a web build, run `flutter build web`.

## Publish an APK on GitHub

Push a version tag such as `v1.0.0` to trigger `.github/workflows/release-android.yml`:

```sh
git tag v1.0.0
git push origin v1.0.0
```

The workflow uses `flutter_app/` as the Flutter project directory, runs analysis and tests, builds the release APK, and attaches `app-release.apk` to a GitHub Release. The generated APK uses the starter project's debug signing configuration; set up a persistent release keystore before using it for ongoing public distribution.
