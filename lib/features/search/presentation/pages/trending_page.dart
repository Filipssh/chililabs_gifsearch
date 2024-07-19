import 'package:flutter/material.dart';
import '../../../../core/models/giphy_model.dart';
import '../../../../core/services/giphy_service.dart';
import '../../../../core/common/widgets/masonry_layout.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List<GifData> gifs = [];
  int offset = 0;
  bool isLoading = false;
  bool hasMore = true;
  final int limit = 25;

  @override
  void initState() {
    super.initState();
    fetchGifs();
  }

  Future<void> fetchGifs() async {
    if (isLoading || !hasMore) return;

    setState(() {
      isLoading = true;
    });

    try {
      GiphyModel fetchedGifs = await GiphyService().fetchTrendingGifs(offset: offset, limit: limit);

      setState(() {
        offset += fetchedGifs.data.length;
        gifs.addAll(fetchedGifs.data);
        if (fetchedGifs.data.length < limit) {
          hasMore = false;
        }
      });
    } catch (e) {
      print('Error fetching GIFs: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending GIFs'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoading && scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 300) {
            fetchGifs();
          }
          return false;
        },
        child: masonryLayout(context, gifs, hasMore),
      ),
    );
  }


}