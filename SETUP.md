# MEDIA AI - Android setup

## 1. Supabase (oru vaatti mattum)
Supabase Dashboard > Authentication > URL Configuration > Redirect URLs la add pannunga:
    com.mediaai.app://home

## 2. APK build
    ./setup.sh
APK: android/app/build/outputs/apk/debug/app-debug.apk

Manual-ah panna:
    npm i @capacitor/core @capacitor/cli @capacitor/android @capacitor/app
    npx cap add android
    (AndroidManifest.xml la MainActivity kulla intent-filter add pannunga - setup.sh la irukku)
    npx cap sync android
    cd android && ./gradlew assembleDebug

## 3. Enna fix pannirukku (dist/ la)
- Magic-link login: Android la redirect com.mediaai.app://home ku pogum, app thirumba open aagi login complete aagum.
- Deep-link handler (index.html) add pannirukku.
- Logout aana apparam fake "Ajay" demo user varadhu.

## 4. Innum check pannanum
- Login email domain: @rvce.ac.in (mock data la @rvce.edu.in).
- Admin check client-side dhaan - Supabase RLS policies set pannunga.
- Release build: Android Studio > Build > Generate Signed Bundle/APK.
- Source project irundha indha fixes-ah direct-ah source la panni tharen.
