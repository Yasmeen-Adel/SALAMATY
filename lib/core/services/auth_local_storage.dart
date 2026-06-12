import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthLocalStorage {
  static const _tokenKey = 'token';
  static const _emailKey = 'email';
  static const _nameKey = 'fullName';
  static const _userIdKey = 'userId';
  static const _addressKey = "user_address";
  static const _latKey = "user_lat";
  static const _lngKey = "user_lng";
  static const String _profileImageKey = "profile_image";

  static Future<void> saveUser({
    required String token,
    required String email,
    required String fullName,
    String? userId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_nameKey, fullName);
    if (userId != null) {
      await prefs.setString(_userIdKey, userId);
    }
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_userIdKey);
    if (saved != null && saved.isNotEmpty) return saved;

    final token = prefs.getString(_tokenKey);
    if (token == null || token.isEmpty) return null;

    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      String payload = parts[1];
      // Base64 padding
      while (payload.length % 4 != 0) {
        payload += '=';
      }

      final decoded = utf8.decode(base64Url.decode(payload));
      final Map<String, dynamic> claims = json.decode(decoded);

      const nameIdentifier =
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';

      final userId = claims[nameIdentifier]?.toString();

      if (userId != null && userId.isNotEmpty) {
        await prefs.setString(_userIdKey, userId);
      }

      return userId;
    } catch (e) {
      print('Error extracting userId from JWT: $e');
      return null;
    }
  }

  static Future<void> saveAddress(String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_addressKey, address);
  }

  static Future<String?> getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_addressKey);
  }

  static Future<void> saveLocation(double lat, double lng) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_latKey, lat);
    await prefs.setDouble(_lngKey, lng);
  }

  static Future<Map<String, double>?> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final lat = prefs.getDouble(_latKey);
    final lng = prefs.getDouble(_lngKey);
    if (lat != null && lng != null) {
      return {"lat": lat, "lng": lng};
    }
    return null;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> saveProfileImage(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileImageKey, url);
  }

  static Future<String?> getProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_profileImageKey);
  }

  // static const _hasInsuranceKey = 'has_insurance';

  // static Future<void> setHasInsurance(bool value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool(_hasInsuranceKey, value);
  // }

  // static Future<bool> hasInsurance() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(_hasInsuranceKey) ?? false;
  // }
  static const _hasInsuranceKey = 'has_insurance';
  static const _providerIdKey = 'provider_id';

  static Future<void> setHasInsurance(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasInsuranceKey, value);
  }

  static Future<bool> hasInsurance() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasInsuranceKey) ?? false;
  }

  static Future<void> saveProviderId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_providerIdKey, id);
  }

  static Future<int> getProviderId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_providerIdKey) ?? 0;
  }
}
