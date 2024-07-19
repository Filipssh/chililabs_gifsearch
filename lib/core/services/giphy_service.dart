import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/giphy_model.dart';

class GiphyService {
  final String baseUrl = 'https://api.giphy.com/v1/gifs/trending';
  final String apiKey = dotenv.env['GIPHY_API_KEY'] ?? '';

  Future<GiphyModel> fetchTrendingGifs({int offset = 0, int limit = 25}) async {
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey&offset=$offset&limit=$limit'));

    if (response.statusCode == 200) {
      return GiphyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load GIFs: ${response.statusCode}');
    }
  }
}