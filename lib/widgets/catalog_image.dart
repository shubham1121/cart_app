import 'package:flutter/material.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  const CatalogImage(
      {Key? key,
      required this.image,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8),
      child: Image.network(image),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
