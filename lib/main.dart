import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
import 'screens/owner_message_test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArvonCode',
      home: const OwnerMessageTestScreen(),
      // home: const HomeScreen(), // 🔥 TEST KİLİDİ SÖKÜLDÜ
    );
  }
}
