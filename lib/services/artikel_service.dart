import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArtikelService {
  static final String baseUrl = 'https://api-pariwisata.rakryan.id/blog';

  static Future<http.Response> getArtikel(int page, int limit) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var url = Uri.parse("$baseUrl?page=$page&limit=$limit"); 
    return await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'bearer $token',
      },
    );
  }

  static Future<http.Response> getMyArtikel() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var url = Uri.parse("$baseUrl/user");
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}
