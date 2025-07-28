import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery/models/picture_model.dart';
import 'package:gallery/widgets/faworite_picture_button_widget.dart';

class PictureCardWidget extends StatelessWidget {
  final PictureModel picture;

  const PictureCardWidget({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: Image.file(
            File(picture.url),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: FavoritePictureButtonWidget(id: picture.id),
          ),
        ),
      ],
    );
  }
}
