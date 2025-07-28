import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/controllers/pictures_notifier.dart';
import 'package:gallery/models/picture_model.dart';

final picturesProvider = NotifierProvider<PicturesNotifier, List<PictureModel>>(
  () {
    return PicturesNotifier();
  },
);
