import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interface_etudiant/article.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintBaselinesEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interface Etudiant',
      home: Homepage(),

      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // hauteur de l'entête
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          flexibleSpace: entete(
            titre: 'Espace Etudiant',
            sousTitre: 'Bienvenue Mm Badji',
            couleurs: [
              const Color.fromARGB(255, 132, 69, 150),
              const Color.fromARGB(255, 53, 120, 186),
            ],
            icon: Icons.logout,
            onIconPressed: () {
              print('Déconnexion');
            },
          ),
        ),
      ),
      body: Article(),
    );
  }

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
