import 'package:flutter/material.dart';
import 'package:chililabs_gifsearch/pages/detail_page.dart';
import 'package:chililabs_gifsearch/pages/search_page.dart';
import 'package:chililabs_gifsearch/pages/trending_page.dart';


class Routes {
  static const String trending = '/';
  static const String search = '/search';
  static const String details = '/gif';

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case trending:
        return MaterialPageRoute(builder: (_) => const TrendingPage());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case details:
        return MaterialPageRoute(builder: (_) => const DetailPage());
      default:
        return MaterialPageRoute(builder: (_) => const TrendingPage());
    }
  }
}