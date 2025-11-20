import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image artikel
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images/bromo.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xffd1a824),
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // end image artikel
                //judul artikel
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gunung Bromo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Lihat di Maps",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffd1a824),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xffd1a824), size: 15),
                    SizedBox(width: 5),
                    Text('4.5 (355 Reviews)', style: TextStyle(fontSize: 11)),
                  ],
                ),
                //end judul artikel
                //deskripsi
                SizedBox(height: 20),
                Text(
                  "Gunung Bromo adalah salah satu destinasi wisata alam paling ikonik di Indonesia, terkenal dengan pemandangan matahari terbitnya yang memukau dan lautan pasir yang luas",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14),
                ),
                //end deskripsi
                //informasi artikel
                SizedBox(height: 10),
                Text(
                  "Informasi Artikel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xffd1a824),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Gunung Bromo", style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xddd1a824),
                      child: Icon(
                        Icons.person_2_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Author Name", style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xddd1a824),
                      child: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("26 - 9 - 2025", style: TextStyle(fontSize: 14)),
                  ],
                ),
                //end informassi artikel
              ],
            ),
          ),
        ),
      ),
    );
  }
}
