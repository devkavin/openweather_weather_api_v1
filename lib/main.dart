import 'package:flutter/material.dart';
import '../widgets/constants.dart';

import 'View/landing_page.dart';

// IMPORTANT

// ADD THE API KEY TO lib\api_calling\api_key.dart when running the app in the
// future like this:
//
// class ApiKey {
//   static const String myApiKey = 'YOUR_API_KEY_HERE';
// }
//

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        useMaterial3: true,
        colorScheme: const ColorScheme(
          background: CustomAppColors.backgroundColor,
          primary: Colors.white,
          secondary: Colors.blue,
          surface: CustomAppColors.backgroundColor,
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: CustomAppColors.locationColor,
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.white,
          onBackground: Colors.black,
          surfaceVariant: Colors.lightBlueAccent,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
