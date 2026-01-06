import 'package:flutter/material.dart';
import 'cours.dart';
import 'notes.dart';
import "ressources.dart";

class EspaceEnseignantPage extends StatefulWidget {
  const EspaceEnseignantPage({super.key});

  @override
  State<EspaceEnseignantPage> createState() => _EspaceEnseignantPageState();
}

class _EspaceEnseignantPageState extends State<EspaceEnseignantPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const AccueilPage(),
    const CoursPage(),
    const NotesPage(),
    const ResourcesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          flexibleSpace: entete(
            titre: 'Espace Enseignant',
            sousTitre: 'Bienvenue Prof. Diallo',
            couleurs: [
              const Color.fromARGB(255, 132, 69, 150),
              const Color.fromARGB(255, 53, 120, 186),
            ],
            icon: Icons.logout,
            onIconPressed: () {
              AccueilPage();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          // Menu de navigation
          menu(
            currentIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              {'icon': Icons.home, 'label': 'Accueil'},
              {'icon': Icons.book, 'label': 'Cours'},
              {'icon': Icons.edit, 'label': 'Notes'},
              {'icon': Icons.folder, 'label': 'Ressources'},
            ],
            iconColor: const Color.fromARGB(255, 82, 87, 96),
            textColor: const Color.fromARGB(221, 12, 11, 11),
            selectedColor:
                Colors.blue, // Couleur bleue pour l'élément sélectionné
          ),

          Expanded(child: _pages[_currentIndex]),
        ],
      ),
    );
  }
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
        //
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

Widget menu({
  required List<Map<String, dynamic>> items,
  int currentIndex = 0,
  Color iconColor = Colors.blueAccent,
  Color textColor = Colors.black87,
  Color selectedColor = Colors.blue,
  Function(int)? onItemSelected,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isSelected = index == currentIndex;

        return InkWell(
          onTap: () {
            if (onItemSelected != null) {
              onItemSelected(index);
            }
            print(item['label']);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icône
              Icon(
                item['icon'],
                color: isSelected ? selectedColor : iconColor,
                size: 26,
              ),
              const SizedBox(height: 4),
              // Texte avec trait
              Stack(
                children: [
                  Text(
                    item['label'],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? selectedColor : textColor,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),

                  if (isSelected)
                    Positioned(
                      bottom: -6,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      }),
    ),
  );
}

//Tableau de bord Accueil

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              const Text("Tableau de bord", style: TextStyle(fontSize: 19)),

              const SizedBox(height: 20),

              GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  carte(
                    titre: "Mes cours",
                    icon: Icons.menu_book,
                    couleur: Colors.blue,
                  ),
                  carte(
                    titre: "Saisie des notes",
                    icon: Icons.edit,
                    couleur: Colors.blue,
                  ),
                  carte(
                    titre: "Planifier un cours",
                    icon: Icons.calendar_today,
                    couleur: Colors.blue,
                  ),
                  carte(
                    titre: "Déposer ressources",
                    icon: Icons.upload,
                    couleur: Colors.blue,
                  ),
                  carte(
                    titre: "Liste étudiants",
                    icon: Icons.group,
                    couleur: Colors.blue,
                  ),
                  carte(
                    titre: "Messagerie",
                    icon: Icons.message,
                    couleur: Colors.blue,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text("Prochains cours", style: TextStyle(fontSize: 19)),

              const SizedBox(height: 10),

              _ProchainsCours(),

              const SizedBox(height: 20),

              const Text(
                "Alertes et notifications",
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 16),
              _AlertCard(
                icon: Icons.warning,
                iconColor: const Color.fromARGB(255, 212, 34, 22),
                title: 'Notes en attente',
                description:
                    'Vous avez 3 copies à corriger pour le cours d\'Algorithmique',
                time: 'Depuis 2 jours',
              ),
              const SizedBox(height: 12),
              _AlertCard(
                icon: Icons.campaign,
                iconColor: const Color.fromARGB(255, 85, 6, 99),
                title: 'Réunion départementale',
                description:
                    'Réunion du département informatique le 15 décembre à 10h',
                time: 'Demain',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// les cartes du tableau de bord
Widget carte({
  required String titre,
  required IconData icon,
  required Color couleur,
}) {
  return SizedBox(
    width: 118,
    height: 100,
    child: Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: couleur),
          const SizedBox(height: 8),
          Text(
            titre,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

//prochains cours

Widget _ProchainsCours() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.access_time,
                color: Colors.orange.shade700,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Aujourd\'hui',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _HeureCours('10h00 - 12h00', 'Cours d\'Algorithmique - L2 Info'),
        const Divider(height: 24),
        _HeureCours('14h00 - 16h00', 'TD Base de données - L1 Info'),
      ],
    ),
  );
}

// widget pour chaque horaire de cours
Widget _HeureCours(String time, String cours) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4),
            Text(
              cours,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _AlertCard({
  required IconData icon,
  required Color iconColor,
  required String title,
  required String description,
  required String time,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
