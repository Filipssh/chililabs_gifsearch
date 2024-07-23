import 'package:flutter/foundation.dart';
import 'package:chililabs_gifsearch/core/models/giphy_model.dart';
import 'package:chililabs_gifsearch/core/services/giphy_service.dart';
import 'package:http/http.dart';

class GifProvider extends ChangeNotifier {
  List<GifData> gifs = [];
  int offset = 0;
  bool isLoading = false;
  bool hasMore = true;
  final int limit = 25;
  String? query;
  String? errorMessage;

  Future<void> fetchGifs({String? searchQuery}) async {
    if ((isLoading || !hasMore) && searchQuery == query) return;

    // Clear when search query has changed
    if (searchQuery != null && searchQuery != '' && searchQuery != query) {
      query = searchQuery;
      gifs.clear();
      offset = 0;
      hasMore = true;
    }

    isLoading = true;
    notifyListeners();

    try {
      GiphyModel fetchedGifs = await GiphyService(Client()).fetchGifs(query: query, offset: offset, limit: limit);

      offset += fetchedGifs.data.length;
      gifs.addAll(fetchedGifs.data);
      if (fetchedGifs.data.length < limit) {
        hasMore = false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('(GifProvider) Error fetching GIFs: $e');
      }

      switch (e.toString() as int){
        case 400:
          errorMessage = 'Bad request. Please try again.';
          break;
        case 401:
          errorMessage = 'Unauthorized. Please check your API key.';
          break;
        case 403:
          errorMessage = 'Forbidden. You do not have permission to access this resource.';
          break;
        case 404:
          errorMessage = 'Resource not found. Please try again.';
          break;
        case 429:
          errorMessage = 'API call rate limit exceeded. Please try again later.';
          break;
        case 500:
          errorMessage = 'Internal server error. Please try again later.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshGifs() async {
    gifs.clear();
    offset = 0;
    hasMore = true;
    query = null;
    await fetchGifs();
  }

  void clearErrorMessage() {
    errorMessage = null;
  }
}