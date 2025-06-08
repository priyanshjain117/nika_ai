import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nika_ai/screens/home.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5722),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratAlternatesTextTheme(),
        scaffoldBackgroundColor: const Color.fromARGB(223, 249, 107, 64),
      ),
      home: const SplashScreen(),
    );
  }
}
