import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GalleryScreen extends StatefulWidget {
  @override
  GalleryScreen_State createState() => GalleryScreen_State();
}

class GalleryScreen_State extends State<GalleryScreen> {
  File? _image;
  final picker = ImagePicker();

  Future getFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState( () {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    //super.initState();

    getFromGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('갤러리'),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      /*body: Center(
        child: _image == null
            ? Text('이미지를 선택해주세요')
            : Image.file(_image!),
      ), */
      floatingActionButton: FloatingActionButton(
        onPressed: getFromGallery,
        tooltip: '갤러리에서 선택',
        child: Icon(Icons.photo_library),
      ),

    );
  }

}