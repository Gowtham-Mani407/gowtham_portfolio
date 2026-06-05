import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/splashscreen.dart';
import 'package:gowtham_portfolio/injection_dp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      theme: ThemeData(textTheme: GoogleFonts.syneTextTheme()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Splashscreen();
  }
}
