import 'package:flutter/material.dart';
import 'package:photo_gallery/app/presentation/views/home/home_page.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          titleSmall: TextStyle(fontSize: 17.0),
          bodyMedium: TextStyle(fontSize: 14.0),
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.black45),
          labelSmall: TextStyle(fontSize: 11.0, color: Colors.black45),
        ),
      ),
      home: Scaffold(body: HomePage()),
    );
  }
}
