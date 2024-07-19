import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../models/giphy_model.dart';

Widget masonryLayout(BuildContext context, List<GifData> gifs, bool hasMore) {
  return MasonryGridView.builder(
    padding: const EdgeInsets.all(4),
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
    ),
    itemCount: gifs.length + (hasMore ? 1 : 0),
    itemBuilder: (context, index) {
      if (index == gifs.length) {
        return Center(child: CircularProgressIndicator());
      }
      final gif = gifs[index].images.fixedWidthSmall;
      final aspectRatio = double.parse(gif.height) / double.parse(gif.width);

      return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            gif.url,
            loadingBuilder: (context, child, progress){
              return progress == null
                  ? child
                  : LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  print("width:${gif.width}, height:${gif.height}, scaled width:${constraints.maxWidth * aspectRatio}");
                  return Container(
                    height: constraints.maxWidth * aspectRatio,
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  );
                },
              );
            },
            fit: BoxFit.fitWidth,
          )
      );
    },
  );
}