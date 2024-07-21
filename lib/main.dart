import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/common/providers/gif_provider.dart';
import 'core/theme/theme.dart';
import 'pages/trending_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GifProvider(),
      child: MaterialApp(
        title: 'Giphy App',
        theme: AppTheme.darkThemeMode,
        home: const TrendingPage(),
      ),
    );
  }
}