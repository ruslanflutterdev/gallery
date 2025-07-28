import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/providers/pictures_provider.dart';
import '../widgets/image_picker_widget.dart';

class PictureCreateScreen extends ConsumerStatefulWidget {
  const PictureCreateScreen({super.key});

  @override
  ConsumerState<PictureCreateScreen> createState() =>
      _PictureCreateScreenState();
}

class _PictureCreateScreenState extends ConsumerState<PictureCreateScreen> {
  late final TextEditingController _controller;
  File? _currentFile;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _create() {
    if (_currentFile == null) return;
    ref.read(picturesProvider.notifier).addPicture(_currentFile!);
    Navigator.pop(context);
  }

  void _onTakeFile(File? file) async {
    if (file == null) {
      _currentFile = null;
    } else {
      _currentFile = file;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Создать картинку')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Название')),
              controller: _controller,
            ),
            ImagePickerWidget(file: _currentFile, onTakeFile: _onTakeFile),
            ElevatedButton(onPressed: _create, child: Text('Создать')),
          ],
        ),
      ),
    );
  }
}
