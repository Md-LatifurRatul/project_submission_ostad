import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),

        ),
      ),
      home: const Text("Hello"),

    );
  }
}