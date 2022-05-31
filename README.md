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
- Support 2 language: **Japanese** and **English**
- Base on **StepN**
- Figma [Wireframe](https://www.figma.com/file/EtlTv6nD9XYAbzvHavYl6C/Wireframing-IOS-UI-(Community)?node-id=0%3A1)
- [Jira Tasks](https://jira.sotatek.com/secure/RapidBoard.jspa?rapidView=342&projectKey=SLEEP)

# App Guide

## Multi Language

Package using:

- [flutter_translate](https://pub.dev/packages/flutter_translate)
- [flutter_translate_gen](https://pub.dev/packages/flutter_translate_gen)
- [flutter_translate_annotation](https://pub.dev/packages/flutter_translate_annotations)

Full Guide For Package install can be found here: [Wiki](https://github.com/Jesway/Flutter-Translate/wiki)

### Add translation

- For English: `assets/i18n/en_US.json`
- For Japanese: `assets/i18n/ja_JP.json`

After adding run `build_runner` [command](#command). A file called `LocaleKeys.g.dart` will be generated as part of `LocaleKeys.dart`

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
flutter pub run build_runner build --delete-conflicting-outputs
```

Watching changes

```dart
flutter pub run build_runner watch --delete-conflicting-outputs
```

```dart
flutter pub run build_runner watch --delete-conflicting-outputs
```

Easy Localization command

```dart
flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/l10n -o locale_keys.g.dart
```

```terminal
xcrun simctl erase all
```