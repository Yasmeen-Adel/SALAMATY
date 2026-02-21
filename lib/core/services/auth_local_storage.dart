import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalStorage {
  static const _tokenKey = 'token';
  static const _emailKey = 'email';
  static const _nameKey = 'fullName';

  // SAVE
  static Future<void> saveUser({
    required String token,
    required String email,
    required String fullName,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_nameKey, fullName);
  }
  static const _addressKey = "user_address";

static Future<void> saveAddress(String address) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_addressKey, address);
}

static Future<String?> getAddress() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_addressKey);
}

static const String _latKey = "user_lat";
static const String _lngKey = "user_lng";

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

  // GET TOKEN
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // CLEAR
  //  Logout 
static Future<void> clearAuthData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(_tokenKey);
}


// Delete Account 
static Future<void> clearAll() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // IS LOGGED IN
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  static const String _profileImageKey = "profile_image";
// profile image 
  static Future<void> saveProfileImage(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileImageKey, url);
  }
// get profile image
  static Future<String?> getProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_profileImageKey);
  }
}
