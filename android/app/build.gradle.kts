plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// Uncomment and configure for release builds:
// val keystorePropertiesFile = rootProject.file("key.properties")
// val keystoreProperties = java.util.Properties()
// if (keystorePropertiesFile.exists()) {
//     keystoreProperties.load(java.io.FileInputStream(keystorePropertiesFile))
// }

android {
    namespace = "com.hananote.app"
    compileSdk = maxOf(flutter.compileSdkVersion, 34)
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.hananote.app"
        minSdk = maxOf(flutter.minSdkVersion, 21)
        targetSdk = maxOf(flutter.targetSdkVersion, 34)
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            // TODO: Replace with release signing config before store submission.
            // signingConfig = signingConfigs.create("release") {
            //     storeFile = file(keystoreProperties["storeFile"] as String)
            //     storePassword = keystoreProperties["storePassword"] as String
            //     keyAlias = keystoreProperties["keyAlias"] as String
            //     keyPassword = keystoreProperties["keyPassword"] as String
            // }
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
