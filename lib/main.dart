import 'package:chililabs_gifsearch/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/common/providers/gif_provider.dart';
import 'core/common/widgets/network_aware_widget.dart';
import 'core/services/network_connectivity_service.dart';
import 'core/theme/theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GifProvider()),
        ChangeNotifierProvider(create: (_) => NetworkConnectivityService()),
      ],
      child: MaterialApp(
        title: 'Giphy App',
        theme: AppTheme.darkThemeMode,
        initialRoute: Routes.trending,
        onGenerateRoute: Routes.generateRoute,
        builder: (context, child) {
          // Wrap the entire application in NetworkAwareWidget
          return NetworkAwareWidget(
            child: child!,
          );
        },
      ),
    );
  }
}