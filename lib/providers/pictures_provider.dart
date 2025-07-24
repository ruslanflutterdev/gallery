import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/data/picture_data.dart';
import 'package:gallery/models/picture_model.dart';

final picturesProvider = Provider<List<PictureModel>>((ref) {
  return pictures;
});