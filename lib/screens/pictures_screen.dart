import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/providers/pictures_provider.dart';
import '../widgets/pictures_grid_view_widget.dart';

class PicturesScreen extends ConsumerWidget {
  const PicturesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictures = ref.watch(picturesProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Галерея'), centerTitle: false),
      body: PicturesGridViewWidget(pictures: pictures),
    );
  }
}
