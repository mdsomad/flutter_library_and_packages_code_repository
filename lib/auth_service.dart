import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticateLocally() async {
    bool isAuthenticate = false;
    // return isAuthenticate;

    try {
      isAuthenticate = await auth.authenticate(
          localizedReason: 'We need to authenticate for using this app.',
          options: AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ));
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.notEnrolled) {
        // ...
      } else {
        // ...
      }
    } catch (e) {
      log("Error: 👉 $e");
    }

    return isAuthenticate;
  }
}
