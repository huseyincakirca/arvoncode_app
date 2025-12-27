import 'package:flutter/material.dart';
import 'owner/messages_page.dart';
import 'settings_screen.dart';

class OwnerDashboard extends StatelessWidget {
  final String? ownerToken;

  const OwnerDashboard({super.key, this.ownerToken});

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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  // Logo ve başlık
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          child: Image.asset(
                            'assets/logos/arvoncode_blue.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Araç Kontrol Paneli",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0AEFFF),
                            shadows: [
                              Shadow(
                                color: const Color(0xFF0AEFFF).withOpacity(0.4),
                                blurRadius: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // En Son Mesaj Paneli (Glass Card)
                  _glassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Son Mesaj",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0AEFFF),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "\"5 Dakika Geliyorum\"",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Alındı: 12:42",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: _blueButton("Cevapla"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Alt Kartlar
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _glassCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Araç Konumu",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF0AEFFF),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                // Harita boş placeholder
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF17202A),
                                        Color(0xFF1C1F26),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Harita Burada Görünecek",
                                      style: TextStyle(
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: _blueButton("Haritada Aç"),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                if (ownerToken == null ||
                                    ownerToken!.trim().isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Token bulunamadı')),
                                  );
                                  return;
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MessagesPage(
                                      token: ownerToken!.trim(),
                                    ),
                                  ),
                                );
                              },
                              child: _blueButton("Mesajlarım", small: true),
                            ),
                          ),

                          const SizedBox(height: 12),

                          _glassCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ArvonCode Kartım",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF0AEFFF),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: Image.asset(
                                    'assets/logos/arvoncode_blue.png',
                                    width: 120,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: Text(
                                    "Kart ID: ACX-4921",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: _blueButton("Paylaş", small: true),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: _blueButton("Yeni Kart Ekle",
                                          small: true),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // AYARLAR BUTONU (BURASI YENİ)
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingsScreen(),
                                  ),
                                );
                              },
                              child: _blueButton("Ayarlar", small: true),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Glassmorphism panel widget
  Widget _glassCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(
          color: const Color(0xFF0AEFFF).withOpacity(0.25),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0AEFFF).withOpacity(0.08),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }

  // Neon Blue Button
  Widget _blueButton(String text, {bool small = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 6 : 20,
        vertical: small ? 10 : 14,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0AEFFF),
            Color(0xFF0072FF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0AEFFF).withOpacity(0.4),
            blurRadius: 25,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: small ? 14 : 16,
        ),
      ),
    );
  }
}
