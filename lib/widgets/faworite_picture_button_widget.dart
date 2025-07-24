import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gallery/providers/favorites_provider.dart';

class FavoritePictureButtonWidget extends ConsumerStatefulWidget {
  const FavoritePictureButtonWidget({super.key, required this.id});

  final int id;

  @override
  _FavoritePictureButtonWidget createState() => _FavoritePictureButtonWidget();
}

class _FavoritePictureButtonWidget
    extends ConsumerState<FavoritePictureButtonWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  VoidCallback _toggle(WidgetRef ref) => () {
    ref.read(favoritesProvider.notifier).toggle(widget.id);
    _animation.forward(from: 0);
  };

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref
        .read(favoritesProvider.notifier)
        .isFavorite(widget.id);
    ref.watch(favoritesProvider);

    return IconButton(
      style: IconButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        iconSize: 15,
        maximumSize: Size(30, 30),
        minimumSize: Size(30, 30),
      ),
      onPressed: _toggle(ref),
      icon: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.5),
          end: Offset.zero,
        ).animate(_animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0, end: 1).animate(_animation),
          child: Icon(
            key: ValueKey('Like${widget.id}'),
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
