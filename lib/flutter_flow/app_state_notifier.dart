import 'package:flutter/foundation.dart';
import '/services/supabase_auth_service.dart';

/// Notifies listeners of app-level state changes including authentication
class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;
  bool _isAuthenticating = false;
  String? _currentError;
  
  final _authService = SupabaseAuthService();

  /// Whether the app is currently performing authentication
  bool get isAuthenticating => _isAuthenticating;

  /// Current error message, if any
  String? get currentError => _currentError;

  /// Whether user is authenticated
  bool get isAuthenticated => _authService.isAuthenticated;

  /// Current user ID
  String? get userId => _authService.userId;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }

  /// Initialize auth service
  Future<void> initializeAuth() async {
    try {
      await _authService.initialize();
      if (isAuthenticated) {
        debugPrint('User already authenticated with ID: $userId');
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      _currentError = 'Failed to initialize authentication';
      notifyListeners();
    }
  }

  /// Sign up with email and password
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    _isAuthenticating = true;
    _currentError = null;
    notifyListeners();

    try {
      final error = await _authService.signUpWithEmail(
        email: email,
        password: password,
      );
      
      if (error != null) {
        _currentError = error;
        _isAuthenticating = false;
        notifyListeners();
        return false;
      }
      
      _isAuthenticating = false;
      notifyListeners();
      return true;
    } catch (e) {
      _currentError = 'Signup failed: ${e.toString()}';
      _isAuthenticating = false;
      notifyListeners();
      return false;
    }
  }

  /// Sign in with email and password
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) async {
    _isAuthenticating = true;
    _currentError = null;
    notifyListeners();

    try {
      final error = await _authService.signInWithEmail(
        email: email,
        password: password,
      );
      
      if (error != null) {
        _currentError = error;
        _isAuthenticating = false;
        notifyListeners();
        return false;
      }
      
      _isAuthenticating = false;
      notifyListeners();
      return true;
    } catch (e) {
      _currentError = 'Login failed: ${e.toString()}';
      _isAuthenticating = false;
      notifyListeners();
      return false;
    }
  }

  /// Sign in with Google
  Future<bool> signInWithGoogle() async {
    _isAuthenticating = true;
    _currentError = null;
    notifyListeners();

    try {
      final error = await _authService.signInWithGoogle();
      
      if (error != null) {
        _currentError = error;
        _isAuthenticating = false;
        notifyListeners();
        return false;
      }
      
      _isAuthenticating = false;
      notifyListeners();
      return true;
    } catch (e) {
      _currentError = 'Google sign-in failed: ${e.toString()}';
      _isAuthenticating = false;
      notifyListeners();
      return false;
    }
  }

  /// Sign in with Apple
  Future<bool> signInWithApple() async {
    _isAuthenticating = true;
    _currentError = null;
    notifyListeners();

    try {
      final error = await _authService.signInWithApple();
      
      if (error != null) {
        _currentError = error;
        _isAuthenticating = false;
        notifyListeners();
        return false;
      }
      
      _isAuthenticating = false;
      notifyListeners();
      return true;
    } catch (e) {
      _currentError = 'Apple sign-in failed: ${e.toString()}';
      _isAuthenticating = false;
      notifyListeners();
      return false;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    _isAuthenticating = true;
    _currentError = null;
    notifyListeners();

    try {
      await _authService.signOut();
      await _authService.clearAuthData();
      _isAuthenticating = false;
      notifyListeners();
    } catch (e) {
      _currentError = 'Sign out failed: ${e.toString()}';
      _isAuthenticating = false;
      notifyListeners();
    }
  }

  /// Clear error message
  void clearError() {
    _currentError = null;
    notifyListeners();
  }
}
