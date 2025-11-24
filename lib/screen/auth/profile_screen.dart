import 'package:flutter/material.dart';
import 'package:uuk_final_sems3/controller/artikel_controller.dart';
import 'package:uuk_final_sems3/controller/auth_controller.dart';
import 'package:uuk_final_sems3/widgets/grid_artikel_populer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  color: Color(0xffd1a824),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //profile
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: const AssetImage(
                        'assets/images/profile.jpg',
                      ),
                    ),
                    SizedBox(height: 5),
                    FutureBuilder(
                      future: AuthController.getProfile(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final user = snapshot.data!;
                          return Column(
                            children: [
                              Text(
                                user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                user.username,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    //end profile
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // button edit
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffd1a824),
                            minimumSize: Size(115, 50),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.edit, color: Colors.white, size: 29),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //end buttron edit
                        //nbutton logout
                        ElevatedButton(
                          onPressed: () async {
                            final message = await AuthController.logout(
                              context,
                            );
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(message)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffd1a824),
                            minimumSize: Size(115, 50),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.logout, color: Colors.white, size: 29),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //end buttom logout
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Postingan Terbaru',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    FutureBuilder(
                      future: ArtikelController.getMyArtikel(1, 4),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final artikelList = snapshot.data ?? [];
                          return GridArtikelPopuler(artikelList: artikelList);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
