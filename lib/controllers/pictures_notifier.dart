import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/models/picture_model.dart';

class PicturesNotifier extends Notifier<List<PictureModel>> {
  @override
  List<PictureModel> build() {
    return [];
  }

  void addPicture(File file) {
    state = [...state, PictureModel(id: 1, url: file.path)];
  }
}
