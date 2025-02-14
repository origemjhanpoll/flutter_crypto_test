import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

//https://assets.coincap.io/assets/icons/pepe@2x.png

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  const CachedImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: imageUrl);
  }
}
