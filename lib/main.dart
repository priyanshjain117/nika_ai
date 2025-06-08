import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nika_ai/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nika Ai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFFFD700),
          onPrimary: Colors.black,
          secondary: Color(0xFF1E3A8A),
          onSecondary: Colors.white,
          error: Color(0xFFDA1212),
          onError: Colors.white,
          surface: Color(0xFFFFFFFF),
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xFFFDF5E6),
        cardColor: const Color(0xFFFFFFFF),
        shadowColor: const Color(0xFF6B4E16),
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
      ),
      home: const SplashScreen(),
    );
  }
}
