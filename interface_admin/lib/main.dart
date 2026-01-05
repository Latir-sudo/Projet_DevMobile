import 'package:flutter/material.dart';
import 'package:interface_admin/Admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // hauteur de l'entête
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          flexibleSpace: entete(
            titre: 'Espace Administrateur',
            sousTitre: 'Bienvenue ,Admin',
            couleurs: [Color(0xFFE74C3C), Color(0xFFF39C12)],
            icon: Icons.logout,
            onIconPressed: () {},
          ),
        ),
      ),
      body: Admin(),
    );
  }

  // definition de la fonction entête

  Widget entete({
    required String titre,
    required String sousTitre,
    required List<Color> couleurs,
    required IconData icon,
    VoidCallback? onIconPressed,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: couleurs,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Texte centré
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titre,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                sousTitre,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          // Icône à droite
          Positioned(
            right: 0,
            child: IconButton(
              icon: Icon(icon, color: Colors.white, size: 24),
              onPressed: onIconPressed,
            ),
          ),
        ],
      ),
    );
  }
}
