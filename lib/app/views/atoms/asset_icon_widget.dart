import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AssetIconWidget extends StatelessWidget {
  final String symbol;
  final double dimension;
  const AssetIconWidget({
    super.key,
    required this.symbol,
    this.dimension = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipOval(
        child: CachedNetworkImage(
          errorWidget: (context, url, error) {
            return Icon(Icons.error);
          },
          imageUrl:
              'https://assets.coincap.io/assets/icons/${symbol.toLowerCase()}@2x.png',
        ),
      ),
    );
  }
}
