import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../providers/gif_provider.dart';

class MasonryLayout extends StatelessWidget {
  const MasonryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (gifProvider.errorMessage != null) {
        _showErrorDialog(context, gifProvider.errorMessage!);
        gifProvider.clearErrorMessage();
      }
    });

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
      child: MasonryGridView.builder(
        padding: const EdgeInsets.all(4),
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        ),
        itemCount: gifProvider.gifs.length + (gifProvider.hasMore ? 1 : 0),
        itemBuilder: (context, index) {

          final gif = gifProvider.gifs[index].images.fixedWidthDownsampled;
          return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: AspectRatio(
                aspectRatio: double.parse(gif.width) / double.parse(gif.height),
                child: Image.network(
                  gif.url,
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
        },
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}