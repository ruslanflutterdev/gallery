import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/picture_favorite_provider.dart';
import '../widgets/pictures_grid_view_widget.dart';

class PicturesFavoriteScreen extends ConsumerStatefulWidget {
  const PicturesFavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PicturesFavoriteScreenState();
}

class _PicturesFavoriteScreenState
    extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final pictures = ref.watch(pictureFavoriteProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Избранное'), centerTitle: false),
      body: PicturesGridViewWidget(pictures: pictures),
    );
  }
}
