import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends Notifier<List<int>> {
  @override
  List<int> build() => [];

  void toggle(int id) {
    if(isFavorite(id)) {
      state = state.where((values) => values != id).toList();
    } else {
      state = [...state, id];
    }
  }
  bool isFavorite(int id) => state.contains(id);
}