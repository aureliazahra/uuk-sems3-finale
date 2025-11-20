import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuk_final_sems3/screen/auth/login_screen.dart';
import 'package:uuk_final_sems3/services/auth_service.dart';

class AuthController {
  static Future<String> register(
    BuildContext context,
    String name,
    String username,
    String password,
  ) async {
    final result = await AuthService.register(name, username, password);
    final responseData = jsonDecode(result.body);

    if (result.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      return responseData['message'] ?? "Registrasi Berhasil!";
    } else {
      return (responseData['message'] ?? "Terjadi kesalahan");
    }
  }
}
