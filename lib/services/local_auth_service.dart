import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local account system backed by shared_preferences.
/// Credentials never leave the device.
class LocalAuthService {
  static const _emailKey = 'local_auth_email';
  static const _nameKey = 'local_auth_name';
  static const _saltKey = 'local_auth_salt';
  static const _hashKey = 'local_auth_hash';
  static const _sessionKey = 'local_auth_session';

  static final LocalAuthService _instance = LocalAuthService._internal();
  factory LocalAuthService() => _instance;
  LocalAuthService._internal();

  SharedPreferences? _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get isLoggedIn {
    final session = _prefs?.getString(_sessionKey);
    return session != null && session.isNotEmpty;
  }

  bool get hasAccount {
    final hash = _prefs?.getString(_hashKey);
    return hash != null && hash.isNotEmpty;
  }

  String? get currentUserEmail => _prefs?.getString(_emailKey);
  String? get currentUserName => _prefs?.getString(_nameKey);

  /// djb2-style hash — deterministic across all platforms/runs.
  String _hashPassword(String password, String salt) {
    final combined = '$salt:$password:salari_local_v1';
    int hash = 5381;
    for (final byte in utf8.encode(combined)) {
      hash = ((hash << 5) + hash + byte) & 0x7FFFFFFF;
    }
    return hash.toRadixString(36).padLeft(8, '0');
  }

  String _generateSalt() =>
      DateTime.now().microsecondsSinceEpoch.toRadixString(36);

  String _generateSession() =>
      '${DateTime.now().millisecondsSinceEpoch.toRadixString(36)}_salari';

  /// Register a new local account.
  /// Returns null on success, error message on failure.
  Future<String?> register({
    required String email,
    required String password,
    required String name,
  }) async {
    if (email.isEmpty) return 'Email cannot be empty';
    if (!email.contains('@')) return 'Please enter a valid email';
    if (password.length < 6) return 'Password must be at least 6 characters';
    if (name.trim().isEmpty) return 'Please enter your name';

    if (hasAccount) return 'An account already exists. Please log in.';

    try {
      final salt = _generateSalt();
      final hash = _hashPassword(password, salt);
      await _prefs?.setString(_emailKey, email.trim().toLowerCase());
      await _prefs?.setString(_nameKey, name.trim());
      await _prefs?.setString(_saltKey, salt);
      await _prefs?.setString(_hashKey, hash);
      await _prefs?.setString(_sessionKey, _generateSession());
      debugPrint('✓ Account created for $email');
      return null;
    } catch (e) {
      return 'Registration failed: $e';
    }
  }

  /// Sign in to an existing local account.
  /// Returns null on success, error message on failure.
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) return 'Email cannot be empty';
    if (password.isEmpty) return 'Password cannot be empty';

    if (!hasAccount) return 'No account found. Please register first.';

    final storedEmail = _prefs?.getString(_emailKey) ?? '';
    if (storedEmail != email.trim().toLowerCase()) {
      return 'Incorrect email or password';
    }

    final salt = _prefs?.getString(_saltKey) ?? '';
    final storedHash = _prefs?.getString(_hashKey) ?? '';
    final inputHash = _hashPassword(password, salt);

    if (inputHash != storedHash) return 'Incorrect email or password';

    try {
      await _prefs?.setString(_sessionKey, _generateSession());
      debugPrint('✓ Signed in as $email');
      return null;
    } catch (e) {
      return 'Sign-in failed: $e';
    }
  }

  /// Sign out and clear the session (keeps account data).
  Future<void> signOut() async {
    await _prefs?.remove(_sessionKey);
    debugPrint('✓ Signed out');
  }

  /// Permanently delete the local account.
  Future<void> deleteAccount() async {
    await _prefs?.remove(_emailKey);
    await _prefs?.remove(_nameKey);
    await _prefs?.remove(_saltKey);
    await _prefs?.remove(_hashKey);
    await _prefs?.remove(_sessionKey);
    debugPrint('✓ Account deleted');
  }
}
