import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/controllers/favorites_notifier.dart';

final favoritesProvider = NotifierProvider<FavoritesNotifier, List<int>>(() {
  return FavoritesNotifier();
});

// final isFavoriteProvider = Provider.family((ref, int id) {
//   final favorites = ref.watch(favoritesProvider);
//   return favorites.contains(id);
// });
