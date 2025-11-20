import 'package:flutter/material.dart';
import 'package:uuk_final_sems3/widgets/grid_artikel_populer.dart';
import '../../controller/artikel_controller.dart';
import '../../models/artikel_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                //header
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/profile.jpg',
                      ),
                      radius: 35,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
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
                SizedBox(height: 20),
                //end header

                //search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Cari Tempat Wisata",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xFFD1A824).withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    print("Kata kunci: $value");
                  },
                ),
                //end search bar

                //grid artiker populer
                SizedBox(height: 20),
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: ArtikelController.getArtikel(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final artikelList = snapshot.data ?? [];
                      final List<Blog> artikelPopuler = artikelList
                          .take(4)
                          .toList();

                      return Column(
                        children: [
                          GridArtikelPopuler(artikelList: artikelPopuler),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Color(0xffd1a824),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/newspaper.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Lihat Artikel Kamu',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Yuk, Mulai Buat Artikelmu Sendiri",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Color(0xffd1a824),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Artikel lainnya",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffd1a824),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
                //end gris artiker populer
              ],
            ),
          ),
        ),
      ),
    );
  }
}
