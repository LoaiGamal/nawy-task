import 'package:flutter/material.dart';
import 'package:nawy_task/common/local_storage/local_storage.dart';

enum ConfigType {
  dev,
  production,
}

///Global key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppConfig {
  factory AppConfig() => _getInstance();

  static AppConfig? _instance;

  static AppConfig get instance => _getInstance();

  AppConfig._internal();

  static AppConfig _getInstance() {
    _instance ??= AppConfig._internal();
    return _instance!;
  }

  ConfigType configType = ConfigType.production;

  // Toggle this to cause an async error to be thrown during initialization
  // and to test that runZonedGuarded() catches the error
  bool kShouldTestAnalyticsCollectionEnabled = false;

  // Toggle this to cause an async error to be thrown during initialization
  // and to test that runZonedGuarded() catches the error
  bool kShouldTestAsyncErrorOnInit = false;

  // Toggle this for testing Crashlytics in your app locally.
  bool kTestingCrashlytics = true;

  bool hasHuaweiServicesOnly = false;

  Future<bool> init(ConfigType configType) async {
    this.configType = configType;
    await LocalStorage.instance.initSecureStorage();
    return true;
  }
}
