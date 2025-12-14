import 'package:flutter/material.dart';
import 'screens/nfc_menu.dart';

void main() {
  runApp(const ArvonCodeApp());
}

class ArvonCodeApp extends StatelessWidget {
  const ArvonCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArvonCode',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        fontFamily: 'Roboto',
      ),
      home: const ArvonCodeSplash(),
    );
  }
}

class ArvonCodeSplash extends StatelessWidget {
  const ArvonCodeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0A0A0A),
                  Color(0xFF0F1A2C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // İçerik
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Premium Neon Blue Logo
                Image.asset(
                  'assets/logos/arvoncode_blue.png',
                  width: 220,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 35),

                // Premium ARVONCODE Yazısı
                Text(
                  "ArvonCode",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                    color: const Color(0xFF0AEFFF),
                    shadows: [
                      Shadow(
                        color: const Color(0xFF0AEFFF).withOpacity(0.6),
                        blurRadius: 25,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                Text(
                  "Akıllı Araç Güvenlik Sistemi",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),

                const SizedBox(height: 55),

                // Neon NFC Butonu
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NfcMenuScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF0AEFFF),
                          Color(0xFF0072FF),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0AEFFF).withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: const Text(
                      "NFC OKUT",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
