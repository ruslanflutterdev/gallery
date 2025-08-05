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

  VoidCallback _addImage(ImageSource source) => () async {
    try {
      final imagePicker = ImagePicker();
      final result = await imagePicker.pickImage(source: source);
      if (result == null) return;
      final file = File(result.path);
      onTakeFile(file);
    } catch (err) {
      log(err.toString());
    }
  };

  void _clear() => onTakeFile(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (file != null) ...[
          Image.file(file!),
          ElevatedButton(onPressed: _clear, child: Text('Очистить')),
        ],
          ElevatedButton(onPressed: _addImage(ImageSource.camera), child: Text('Сделать фото')),
        ElevatedButton(onPressed: _addImage(ImageSource.gallery), child: Text('Выбрать фото')),
      ],
    );
  }
}
