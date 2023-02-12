import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

//pick image from gallery
Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var imgFiles = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (imgFiles != null && imgFiles.files.isNotEmpty) {
      for (int i = 0; i < imgFiles.files.length; i++) {
        images.add(File(imgFiles.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}
