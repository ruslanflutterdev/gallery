import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? file;
  final void Function(File?) onTakeFile;

  const ImagePickerWidget({
    super.key,
    required this.file,
    required this.onTakeFile,
  });

  Future<void> _addImage() async {
    try {
      final imagePicker = ImagePicker();
      final result = await imagePicker.pickImage(source: ImageSource.camera);
      if (result == null) return;
      final file = File(result.path);
      onTakeFile(file);
    } catch (err) {
      log(err.toString());
    }
  }

  void _clear() => onTakeFile(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (file != null) ...[
          Image.file(file!),
          ElevatedButton(onPressed: _clear, child: Text('Очистить')),
        ],
          ElevatedButton(onPressed: _addImage, child: Text('Выбрать картинку')),
      ],
    );
  }
}
