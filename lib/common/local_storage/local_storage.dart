import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  factory LocalStorage() => _getInstance();

  static LocalStorage get instance => _getInstance();
  static LocalStorage? _instance;
  late FlutterSecureStorage _secureStorage;

  LocalStorage._internal();

  static LocalStorage _getInstance() {
    _instance ??= LocalStorage._internal();
    return _instance!;
  }

  Future<void> initSecureStorage() async {
    _secureStorage = const FlutterSecureStorage();
    await _loadCacheToMemory();
  }

  Future<void> _loadCacheToMemory() async {
    await Future.wait(<Future<dynamic>>[

    ]);
  }

  Future<Map<String, dynamic>?> load({required String key}) async {
    try {
      final String? result = await _secureStorage.read(key: key);
      if (result == null || result == 'null') {
        return null;
      }
      return json.decode(result);
    } catch (error) {
      return null;
    }
  }

  Future<T?> loadObject<T>({required String key}) async {
    try {
      final String? result = await _secureStorage.read(key: key);
      if (result == null || result == 'null') {
        return null;
      }
      final dynamic data = json.decode(result);
      return data;
    } catch (error) {
      debugPrint('error at load object ${error.toString()}');
      return null;
    }
  }

  Future<String?> loadString({required String key}) async {
    try {
      final String? result = await _secureStorage.read(key: key);
      if (result == null || result.isEmpty) {
        return null;
      }
      return json.decode(result).toString();
    } catch (error) {
      return null;
    }
  }

  Future<void> save({
    required String key,
    required Object? value,
  }) async {
    try {
      return await _secureStorage.write(
        key: key,
        value: jsonEncode(value),
      );
    } catch (error) {
      debugPrint('error at save object ${error.toString()}');
      return;
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (error) {
      return;
    }
  }
}
