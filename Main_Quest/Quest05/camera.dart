import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' as path;

class CameraScreen extends StatefulWidget {
  @override
  CameraScreen_State createState() => CameraScreen_State();
}

class CameraScreen_State extends State<CameraScreen> {
  File? _image;
  final picker = ImagePicker();
  bool _isSaving = false;

  Future getFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState( () {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _saveToGallery();
      }
    });
  }

  Future _saveToGallery() async {
    if (_image == null) return;

    setState( () {
      _isSaving = true;
    });

    final result = await GallerySaver.saveImage(_image!.path, albumName: "Flutter");

    setState(() {
      _isSaving = false;
    });

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미지가 갤러리에 저장되었습니다.'))
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GalleryViewScreen(imagePath: _image!.path),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    getFromCamera();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카메라'),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      /*body: Center(
        child: _isSaving
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('이미지를 저장 중입니다...')
          ],
        )
            : _image == null
            ? Text('카메라로 사진을 찍어주세요')
            : Image.file(_image!),
      ), */

      floatingActionButton: FloatingActionButton(
        onPressed: _isSaving ? null : getFromCamera,
        tooltip: '사진 찍기',
        child: Icon(Icons.camera_alt),
      ),

    );
  }
}


class GalleryViewScreen extends StatelessWidget {
  final String imagePath;

  GalleryViewScreen({required this.imagePath});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '이미지가 갤러리에 저장되었습니다',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}