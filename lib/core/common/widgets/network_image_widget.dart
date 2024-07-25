import 'package:flutter/material.dart';
import 'package:chililabs_gifsearch/core/models/giphy_model.dart';

class NetworkImageWidget extends StatefulWidget {
  final ImageData image;
  const NetworkImageWidget({super.key, required this.image});

  @override
  State<NetworkImageWidget> createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: double.parse(widget.image.width) / double.parse(widget.image.height),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Image.network(
            widget.image.url,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              }
              else {
                return Center(
                  child: CircularProgressIndicator(
                      value: progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
