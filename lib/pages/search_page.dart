import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chililabs_gifsearch/core/common/providers/gif_provider.dart';
import 'package:chililabs_gifsearch/core/common/widgets/masonry_layout.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late GifProvider gifProvider;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    gifProvider = Provider.of<GifProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // gifProvider.reset(); // Clear search results initially
      FocusScope.of(context).requestFocus(_focusNode); // Focus on the TextField
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debounce?.cancel(); // Cancel any pending debounce timer
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      gifProvider.fetchGifs(searchQuery: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: const InputDecoration(
            hintText: 'Search GIFs...',
            border: InputBorder.none,
          ),
          onChanged: _onSearchChanged,
          onSubmitted: (query){
            _debounce?.cancel();
            gifProvider.fetchGifs(searchQuery: query);
          },
        ),
      ),
      body: const MasonryLayout(),
    );
  }
}