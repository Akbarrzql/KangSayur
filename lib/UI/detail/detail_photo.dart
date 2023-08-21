import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Detail_photo extends StatefulWidget {
  Detail_photo({Key? key, required this.tag, required this.networkImage}) : super(key: key);
  final String tag;
  final String networkImage;

  @override
  State<Detail_photo> createState() => _Detail_photoState();
}

class _Detail_photoState extends State<Detail_photo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained * 1,
              maxScale: PhotoViewComputedScale.covered * 1.2,
              initialScale: PhotoViewComputedScale.contained * 1.0,
              imageProvider:
              NetworkImage("https://kangsayur.nitipaja.online/${widget.networkImage}"),
              heroAttributes:
              PhotoViewHeroAttributes(tag: widget.tag),
            ),
          )
        ],
      ),
    );
  }
}
