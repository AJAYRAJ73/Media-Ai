#!/usr/bin/env bash
# MEDIA AI - Android project setup + APK build
# Requirements: Node 18+, Java 17, Android Studio / Android SDK (ANDROID_HOME set)
set -e
cd "$(dirname "$0")"
npm init -y >/dev/null
npm i @capacitor/core @capacitor/cli @capacitor/android @capacitor/app
npx cap add android
python3 - <<'PY'
p = "android/app/src/main/AndroidManifest.xml"
s = open(p, encoding="utf-8").read()
if "com.mediaai.app" not in s.split("<activity",1)[1]:
    link = '''
            <intent-filter>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="com.mediaai.app" android:host="home" />
            </intent-filter>'''
    s = s.replace("</intent-filter>", "</intent-filter>" + link, 1)
    open(p, "w", encoding="utf-8").write(s)
PY
npx cap sync android
cd android
./gradlew assembleDebug
echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"
