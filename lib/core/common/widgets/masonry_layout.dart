import 'package:chililabs_gifsearch/core/common/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:chililabs_gifsearch/routes/routes.dart';
import '../providers/gif_provider.dart';

class MasonryLayout extends StatelessWidget {
  const MasonryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);

    // Show a placeholder when loading
    if (gifProvider.gifs.isEmpty) {
      return Center(
        child: Text(
          !gifProvider.hasMore ? "Nothing here but us fools." : "",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!gifProvider.isLoading && scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 500) {
          gifProvider.fetchGifs();
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () => gifProvider.refresh(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MasonryGridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
                ),
                itemCount: gifProvider.gifs.length,
                itemBuilder: (context, index) {
                  final gif = gifProvider.gifs[index].images.fixedWidthDownsampled;
                  return InkWell(
                    onTap: () {
                      gifProvider.selectGif(index);
                      Navigator.of(context).pushNamed(Routes.details);
                    },
                    child: NetworkImageWidget(image: gif),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    gifProvider.hasMore ? '' : "You've reached the end of this list",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      height: 5.0,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}