# Use flutter version: ^2.8.1

The architecture of project is fixed. You can implement any state manager if you want.

**This branch use Cubit package to manage state.**

![diagram](https://i.ibb.co/yBhWYXq/architecture-drawio.png)

# Setup steps
## Config flavor for Android & iOS
- Tut Android: [Link - Vietnamese](https://viblo.asia/p/flutter-cai-dat-flavors-trong-flutter-phan-1-danh-cho-android-YWOZrGWElQ0)
- Tut iOS: updating...
Or [Tut for both Android & iOS](https://www.chwe.at/2020/10/flutter-flavors/)
# Docs

### [cubit lib](https://pub.dev/packages/flutter_bloc)
![image](https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png)

### DI pattern
`Dependency Injection` is a great design pattern that allows us to eliminate rigid dependencies between elements and it makes the application more flexible, easy to expand scales and maintain.
In the project we use Plugin `getIt` to implement DI and we have also defined classes so you can easily implement `DI` in the `DI layer`.

### Routes
We use `onGenerateRoute` to manager routers and use `BlocProvider` for provide dependencies of specify route.

### Network.
     * Project can use retrofit to work with the alternative network for http.
     * Retrofit is pre-installed in the "ApiModule.dart". You can customize it here
     * All interceptors are defined in the /configuration/lib/network/interceptor/* class
     * To work with Certificate, please refer to the "/configuration/lib/network/http_overrides.dart" class, with the default the project accept badCertificate

### Environment settings.

Link tutorial: [https://www.chwe.at/2020/10/flutter-flavors/](https://www.chwe.at/2020/10/flutter-flavors/)

     * All flavor environments are installed in the "/configuration/lib/environment/buid_config.dart" class.
     * Basically we are defining 4 development environments: development, staging, preprod and release.
     * Run App

You can run the app using the commands:

```
## development: flutter run -t lib/main_dev.dart --debug --flavor dev

## staging: flutter run -t lib/main_stag.dart --debug --flavor stag

## preprod: flutter run -t lib/main_prod.dart --debug --flavor prod
```

##### Build App
You can build the app using the commands

for Android

```
## development: flutter build apk -t lib/main_dev.dart --flavor dev

## staging: flutter build apk -t lib/main_stag.dart --flavor stag

## preprod: flutter build apk -t lib/main_prod.dart --flavor prod
```

for IOS
```
## development: flutter build ios -t lib/main_dev.dart --flavor dev

## staging: flutter build ios -t lib/main_stag.dart --flavor stag

## preprod: flutter build ios -t lib/main_prod.dart --flavor prod
```

### resources
      * All resources (images, fonts, videos, ...) must be placed in the assets class
      * Before using them, please declare the path in constants class and the suffix of the class to be type_provide (image_provide.dart)

### Json parsing / serialization
This project is implementing [json_serializable](https://pub.dev/packages/json_serializable).
It use build_runner to generate files. If you make a change to these files, you need to re-run the generator using build_runner:
```
flutter pub run build_runner build
```

### Localization
Using this library to handle multi-languages. Follow this guide to understand and config languages files

### Device Preview feature

### Hide Generated Files
In-order to hide generated files, navigate to Android Studio -> Preferences -> Editor -> File Types and paste the below lines under ignore files and folders section:

`*.inject.summary;*.inject.dart;*.g.dart;`

In Visual Studio Code, navigate to Preferences -> Settings and search for Files:Exclude. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

# END



                      _oo0oo_
                     o8888888o
                     88" . "88
                     (| -_- |)
                     0\  =  /0
                   ___/`---'\___
                 .' \\|     |'.
                / \\|||  :  |||\
               / _||||| -:- |||||- \
              |   | \\\  -  /|   |
              | \_|  ''\---/''  |_/ |
              \  .-\__  '-'  ___/-. /
            ___'. .'  /--.--\  `. .'___
         ."" '<  `.___\_<|>_/___.' >' "".
        | | :  `- \`.;`\ _ /`;.`/ - ` : | |
        \  \ `_.   \_ __\ /__ _/   .-` /  /
    =====`-.____`.___ \_____/___.-`___.-'=====
                      `=---='


    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

            BuddhaBlessings        NoBUG



