import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuk_final_sems3/widgets/image_input.dart';

class ArticleFormScreen extends StatefulWidget {
  final bool isEdit;
  final String? artikelId;
  const ArticleFormScreen({super.key, required this.isEdit, this.artikelId});

  @override
  State<ArticleFormScreen> createState() => _ArticleFormScreenState();
}

class _ArticleFormScreenState extends State<ArticleFormScreen> {
  String? imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        imagePath = PickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.isEdit ? 'Edit Artikel' : 'Tambah Artikel',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          backgroundColor: const Color(0xffd1a824),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UploadGambarBox(onTap: _pickImage, imagePath: imagePath,),
              SizedBox(height: 20,),
              // form judul artikel
              Text(
                'Judul Artikel',
                style: TextStyle(
                  color: Color(0xff4d4637),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Lokasi',
                  isDense: true,
                  hintStyle: const TextStyle(
                    color: Color(0xffd9d9d9),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffd9d9d9),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffd9d9d9),
                      width: 2,
                    ),
                  ),
                ),
              ),

              // end form judul artikel
              //form deskripsi
              const SizedBox(height: 10),
              Text(
                'Deskripsi',
                style: TextStyle(
                  color: Color(0xff4d4637),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              TextFormField(
                maxLines: 5,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Masukan Deskripsi Lokasi',
                  hintStyle: const TextStyle(
                    color: Color(0xffd9d9d9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffd9d9d9),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFFd9d9d9),
                      width: 2,
                    ),
                  ),
                ),
              ),
              // end form deskripsi
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffd1a824),
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              widget.isEdit ? 'Edit' : "Tambah",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
