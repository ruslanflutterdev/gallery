import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/models/picture_model.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class PicturesNotifier extends Notifier<List<PictureModel>> {
  @override
  List<PictureModel> build() {
    init();
    return [];
  }

  Future<void> init() async {
    final result = await Supabase.instance.client.rest.from('images').select();
    final pictures = result.map((value) {
      return PictureModel.fromJson(value);
    }).toList();
    state = pictures;
  }
  
  String get fileBasePatch =>
      'https://qaevvaaiitwghwllclsw.supabase.co/storage/v1/object/public/images';

  Future<void> addPicture(File file) async {
    final resultUpload = await Supabase.instance.client.storage
        .from('images')
        .upload('/public/${DateTime.now().toIso8601String()}${p.basename(file.path)}', file);
    final result = await Supabase.instance.client.rest.from('images').insert({
      'url': '$fileBasePatch/$resultUpload',
    }).select();

    final picture = PictureModel.fromJson(result.first);

    state = [...state, picture];
  }
}
