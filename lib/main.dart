import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gowtham_portfolio/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:gowtham_portfolio/features/home/presentation/screens/splashscreen.dart';
import 'package:gowtham_portfolio/firebase_options.dart';
import 'package:gowtham_portfolio/injection_dp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<ContactBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
        theme: ThemeData(textTheme: GoogleFonts.syneTextTheme()),
      ),
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
