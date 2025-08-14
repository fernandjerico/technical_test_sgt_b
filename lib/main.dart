import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: GoogleFonts.encodeSansTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ecommerce App'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            'Welcome to the Ecommerce App',
            style: GoogleFonts.encodeSans(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
