import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chililabs_gifsearch/core/common/widgets/masonry_layout.dart';
import 'package:chililabs_gifsearch/core/common/providers/gif_provider.dart';
import 'search_page.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  late GifProvider gifProvider;
  @override
  void initState() {
    super.initState();
    gifProvider = Provider.of<GifProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gifProvider.reset(); // Fetch trending GIFs initially
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending GIFs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              ).then((_) {
                gifProvider.reset();
              });
            },
          ),
        ],
      ),
      body: const MasonryLayout(),
    );
  }
}