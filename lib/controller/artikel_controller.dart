import 'dart:convert';

import 'package:uuk_final_sems3/services/artikel_service.dart';
import '../models/artikel_model.dart';

class ArtikelController {
  static Future<List<Artikel>> getArtikel(int page, int limit) async {
    final result = await ArtikelService.getArtikel(page, limit);

    if (result.statusCode == 200) {
      final data = jsonDecode(result.body)['data'] as List<dynamic>?;
      return data?.map((item) => Artikel.fromJson(item)).toList() ?? [];
    } else {
      throw Exception('Gagal memuat data artikel');
    }
  }

  static Future<List<Artikel>> getMyArtikel() async {
    final result = await ArtikelService.getMyArtikel();

    if (result.statusCode == 200) {
      final data = jsonDecode(result.body)['data'] as List<dynamic>?;
      return data?.map((item) => Artikel.fromJson(item)).toList() ?? [];
    } else if (result.statusCode == 400) {
      throw ('Kamu bekum mempunyai artikel');
    } else {
      throw ('Gagal memuat data artikel');
    }
  }
}
