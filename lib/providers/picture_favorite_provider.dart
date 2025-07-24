import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/providers/favorites_provider.dart';
import 'package:gallery/providers/pictures_provider.dart';

final pictureFavoriteProvider = Provider((ref) {
  final favorites = ref.watch(favoritesProvider);
  final pictures = ref.read(picturesProvider);
  return pictures.where((picture) => favorites.contains(picture.id)).toList();
});
