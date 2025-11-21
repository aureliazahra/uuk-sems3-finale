import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuk_final_sems3/controller/artikel_controller.dart';
import 'package:uuk_final_sems3/models/artikel_model.dart';
import 'package:uuk_final_sems3/screen/articles/form_screen.dart';
import 'package:uuk_final_sems3/widgets/grid_my_artikel.dart';
import '../../services/artikel_service.dart';

class MyArticlesScreen extends StatefulWidget {
  const MyArticlesScreen({super.key});

  @override
  State<MyArticlesScreen> createState() => _MyArticlesScreenState();
}

class _MyArticlesScreenState extends State<MyArticlesScreen> {
  List<Artikel> artikelAll = [];
  int page = 1;
  final int limit = 3;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> loadArtikel() async {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    try {
      final getArtikel = await ArtikelService.getMyArtikel(page, limit);
      final totalData = jsonDecode(getArtikel.body)["totalData"];

      final data = await ArtikelController.getMyArtikel(page, limit);

      setState(() {
        artikelAll.addAll(data);
        if (artikelAll.length >= totalData) {
          hasMore = false;
        } else {
          page++;
        }
      });
    } catch (e) {
      debugPrint("Gagal memuat artikel: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    loadArtikel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //headeer
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/profile.jpg',
                      ),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Username", style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.notifications,
                      color: Color(0xffd1a824),
                      size: 30,
                    ),
                  ],
                ),
                //end header
                //search bar
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Cari Tempat Wisata",
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xffd1a824).withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                //end search bar
                //header list artikel saya
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "List Artikel Kamu",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ArticleFormScreen(isEdit: false),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Color(0xffd1a824),
                        size: 20,
                      ),
                      label: Text(
                        "baca Artikel",
                        style: TextStyle(
                          color: Color(0xffd1a824),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                //end header list artikel saya
                //gridview
                const SizedBox(height: 10),
                GridMyArtikel(artikelList: artikelAll),
                //end grdview
              ],
            ),
          ),
        ),
      ),
    );
  }
}
