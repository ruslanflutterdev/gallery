import 'package:flutter/material.dart';
import 'package:gallery/models/picture_model.dart';
import 'package:gallery/widgets/picture_card_widget.dart';

class PicturesGridViewWidget extends StatefulWidget {
  final List<PictureModel> pictures;

  const PicturesGridViewWidget({super.key, required this.pictures});

  @override
  State<PicturesGridViewWidget> createState() => _PicturesGridViewWidgetState();
}

class _PicturesGridViewWidgetState extends State<PicturesGridViewWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    )..forward();
  }

  // @override
  // void didUpdateWidget(covariant PicturesGridViewWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   _animation.forward(from: 0);
  // }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: GridView.builder(
        itemCount: widget.pictures.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final picture = widget.pictures[index];
          return PictureCardWidget(picture: picture);
        },
      ),
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(top: 150 - _animation.value * 150),
          child: child,
        );
      },
    );
  }
}
