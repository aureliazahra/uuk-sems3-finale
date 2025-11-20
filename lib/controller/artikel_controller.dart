import 'dart:convert';

import 'package:uuk_final_sems3/services/artikel_service.dart';
import '../models/artikel_model.dart';

class ArtikelController {
  static Future<List<Blog>> getArtikel() async {
    final result = await ArtikelService.getArtikel();

    if (result.statusCode == 200) {
      final data = jsonDecode(result.body)['data'] as List<dynamic>?;
      return data?.map((item) => Blog.fromJson(item)).toList() ?? [];
    } else {
      throw Exception('Gagal memuat data artikel');
    }
  }
}
