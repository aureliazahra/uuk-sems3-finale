import 'package:flutter/material.dart';

import 'dart:io';

class UploadGambarBox extends StatelessWidget {
  final VoidCallback onTap;
  final String? imagePath;
  const UploadGambarBox({super.key, required this.onTap, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.width / 2,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: imagePath == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image, size: 70, color: Colors.black54),
                  SizedBox(height: 8),
                ],
              )
            : null,
      ),
    );
  }
}
