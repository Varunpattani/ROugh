### 1  app\build.gradle:
```
android {
  ndkVersion "25.1.8937393"

compileOptions {
  sourceCompatibility JavaVersion.VERSION_17
  targetCompatibility JavaVersion.VERSION_17
}
kotlinOptions {
  jvmTarget = 17
}
```

### 2  This in settings.gradle:
```
id "com.android.application" version "8.3.2" apply false
id "org.jetbrains.kotlin.android" version "2.0.20" apply false
```

### 3   And this in gradle-wrapper.properties
```
distributionUrl=https\://services.gradle.org/distributions/gradle-8.10.2-all.zip
```

### 3 Clean Gradle Build Files
```
cd android
./gradlew clean
```
