import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/giphy_model.dart';

class GiphyService {
  final http.Client client;
  GiphyService(this.client);

  final String baseUrl = 'https://api.giphy.com/v1/gifs';
  final String apiKey = dotenv.env['GIPHY_API_KEY'] ?? '';

  Future<GiphyModel> fetchGifs({String? query, int offset = 0, int limit = 25}) async {
    final url = query == null
        ? '$baseUrl/trending?api_key=$apiKey&offset=$offset&limit=$limit'
        : '$baseUrl/search?api_key=$apiKey&q=$query&offset=$offset&limit=$limit';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return GiphyModel.fromJson(jsonDecode(response.body));
    } else {
      throw StatusCodeException(response.statusCode);
    }
  }
}

class StatusCodeException implements Exception {
  final int statusCode;
  StatusCodeException(this.statusCode);

  @override
  String toString() => "$statusCode";

  int getStatusCode() => statusCode;
}