import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuk_final_sems3/controller/artikel_controller.dart';
import 'package:uuk_final_sems3/widgets/image_input.dart';

class ArticleFormScreen extends StatefulWidget {
  final bool isEdit;
  final String? artikelId;
  const ArticleFormScreen({super.key, required this.isEdit, this.artikelId});

  @override
  State<ArticleFormScreen> createState() => _ArticleFormScreenState();
}

class _ArticleFormScreenState extends State<ArticleFormScreen> {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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

  Future<void> _create(String title, String description) async {
    if (imagePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih gambar terlebih dahulu')),
      );
      return;
    }

    final imageFile = File(imagePath!);

    final message = await ArtikelController.createArtikel(
      imageFile,
      title,
      description,
      context,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _update(String title, String description) async {
    File? imageFile;
    if (imagePath != null) {
      imageFile = File(imagePath!);
    }

    final message = await ArtikelController.updateArtikel(
      id: widget.artikelId!,
      title: title.isNotEmpty ? title : null,
      description: description.isNotEmpty ? description : null,
      image: imageFile,
      context: context,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
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
              UploadGambarBox(onTap: _pickImage, imagePath: imagePath),
              SizedBox(height: 20),
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
                controller: judulController,
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
                controller: descriptionController,
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
            onPressed: () {
              final title = judulController.text;
              final description = descriptionController.text;

              if (widget.isEdit == false) {
                _create(title, description);
              } else if (widget.isEdit && widget.artikelId != null) {
                _update(title, description);
              }
            },
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
