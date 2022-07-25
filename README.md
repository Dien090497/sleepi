# SleeFi Project

- [About SleeFi](#about-sleefi)
- [App Guide](#app-guide)
  - [Multi Language](#multi-language)
     - [Add Translation](#add-transaltion)
     - [Use SFText](#use-sftext)
  - [Model And Entity](#model-and-entity)
     - [Explanation](#explanation)
     - [Model](#model)
     - [Entity](#entity)
- [App Structure](#app-structure)
  - [Presentation](#presentation)
     - [Screens](#screens)
     - [Blocs](#blocs)
  - [Repository](#repository)
     - [Abstract class](#abstract-class)
     - [Implementation](#implementation)
  - [Data Sources](#data-sources)
     - [Local](#local)
     - [Remote](#remote)
- [Command](#command)

# About SleeFi

- A **sleep to earn** app
- Support 8 languages:
- Base on **StepN**
- Figma [App Design](https://www.figma.com/file/8XtGibBv8QYwzpRm2swz66/SleeFi)
- [Jira Tasks](https://jira.sotatek.com/secure/RapidBoard.jspa?rapidView=342&projectKey=SLEEP)

# App Guide

## Multi Language

Package using:

- [easy_localization](https://pub.dev/packages/easy_localization)

### Add translation

- For English: `assets/i18n/en-US.json`
- For Japanese: `assets/i18n/ja-JP.json`
- For Germany: `assets/i18n/de-DE.json`
- For Spanish: `assets/i18n/es-ES.json`
- For French: `assets/i18n/fr-FR.json`
- For Portuguese: `assets/i18n/pt-T.json`
- For Standard Chinese: `assets/i18n/zh-Hans.json`
- For Russian: `assets/i18n/ru-RU.json`

Run [easy_localization:generate](#command). A file called `locale_keys.g.dart` will be generated

```dart
import 'package:slee_fi/l10n/locale_keys.g.dart';
```

Next step [Use SFText](#use-sftext)

### Use SFText

```dart
import 'package:slee_fi/common/widgets/sf_text.dart';
```

```dart
SFText(keyText: LocaleKeys.Test_Hello)
```

# Image and Icons

## Should use SVG as much as possible

- Add icons in to assets/icons or assets/images

- Use [Spider](https://pub.dev/packages/spider)

```
flutter pub global activate spider
```

```
spider build
```

- Use icon reference from `resources`. Eg: Ics.arrow

# Model and Entity

## Explanation

#### Model is used for fetching data from api, database,... only.
#### Entity is used for presentation layer across the app.
#### After fetching data using Model. We need a function `toEntity()` to create a Entity use across the app.

Package using:

- [freezed](https://pub.dev/packages/freezed)

**[JsonSerializable](https://pub.dev/packages/json_serializable) is included in freezed**

## Model

**Use [JsonSerializable](https://pub.dev/packages/json_serializable) only**

Example:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String age;

  UserModel(this.name, this.age);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

```

## Entity

**Use [freezed](https://pub.dev/packages/freezed) only**

Example:

```dart
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({required String name, required int age}) = _User;
}

```

# App Structure

## Presentation

### Screens

Contain UI

### Blocs

State Management using [flutter_bloc](https://pub.dev/packages/flutter)

## Repository

### Abstract class

Define method

### Implementation

Implement of repository abstract

Communicate with datasource layer from here

## Data Sources

### Local

Local data such as Shared Preferences, Database,...

### Remote

Remote data such as api call, firebase,...

# Command

```dart
flutter run --flavor prod -t lib/main_prod.dart

flutter run --flavor dev -t lib/main_dev.dart

flutter run --flavor stg -t lib/main_stg.dart

flutter build apk --flavor prod -t lib/main_prod.dart
```

```dart
flutter pub run build_runner build --delete-conflicting-outputs
```

Watching changes

```dart
flutter pub run build_runner watch --delete-conflicting-outputs
```

Easy Localization command

```dart
flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/l10n -o locale_keys.g.dart

flutter pub run easy_localization:generate -S assets/translations -s en-US.json -f keys -O lib/l10n -o locale_keys.g.dart
```

```terminal
xcrun simctl erase all

flutter pub run dart_code_metrics:metrics analyze lib

flutter pub run dart_code_metrics:metrics check-unused-files lib

flutter pub run dart_code_metrics:metrics check-unused-l10n lib

flutter pub run dart_code_metrics:metrics check-unused-code lib
```