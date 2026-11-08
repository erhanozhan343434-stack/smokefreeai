# Meta Android app-event integration (draft)

This branch prepares Meta Android SDK tracking for Meta App ID `1105316575606290` (the data source showing 24 events). Do not merge or ship until verified.

## Before building

1. In Meta for Developers, open this **same** app, verify Android package `com.smokefreeai.mobile`, Android key hashes (debug and Play App Signing release), and retrieve the **client token**. Never put client token in this repository.
2. Provide `META_CLIENT_TOKEN` as an environment variable in the Android build environment, e.g. CI secrets. An empty token is only a placeholder and **not** a production configuration.
3. Run `flutter pub get`, `flutter analyze`, Android release build, and verify the merged manifest. Confirm the selected plugin version is compatible with the project's Flutter/Android SDK versions.
4. Install the build on an Android emulator, use Meta Events Manager > Test Events, and confirm automatic app activation is received. Check that install events are not duplicated.
5. In Meta Ads Manager, confirm the ad set is linked to the **same** Meta App ID and Play Store listing. Meta event counts and Google Play acquisitions are not expected to match one-for-one.

No production build, release, event verification, or advertising changes have been performed by this PR.
