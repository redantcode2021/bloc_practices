import 'package:flutter_auto_login/models/user.dart';

abstract class Services {
  static User? getUser({required String email, required String token}) {
    return User(name: "john.wick", email: 'john.wick@contoso.com');
  }

  static String? getToken({required String email, required String password}) {
    if (email == 'john.wick@contoso.com' && password == '123456') {
      return 'AKJhKKKJhkhiyoiw12k00294';
    }

    return null;
  }

  static bool isTokenValid(String token) {
    return true;
  }
}
