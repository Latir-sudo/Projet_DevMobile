import 'package:flutter/material.dart';

class CoursPage extends StatelessWidget {
  const CoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // Mes cours
          const Text(
            'Mes cours',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _Tableau(),
          // Planning des cours
          const SizedBox(height: 16),
          const Text(
            'Planning des cours',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _ProchainsCours(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

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
                color: const Color.fromARGB(255, 197, 41, 202),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.calendar_today,
                color: const Color.fromARGB(255, 252, 250, 253),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Semaine du 4 Décembre',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _HeureCours('Lundi-', ' Algorithmique (L2 Info)'),
        _HeureCours(
          '10h-12h.',
          'Amphi A . Chapitre 4: Complxite algorithmique',
        ),
        const SizedBox(height: 16),
        _HeureCours('Mardi -', ' Base de donnees (L1 Info)'),
        _HeureCours('14h-16h. ', ' Salle 204 . TP: Requetes SQL avancees'),
        const SizedBox(height: 16),
        _HeureCours('Jeudi-', ' Resaux (L3 Info)'),
        _HeureCours('10h-12h. ', ' Labo Info . Protocoles de routage'),
      ],
    ),
  );
}

Widget _HeureCours(String time, String cours) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Wrap(
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4),
            Text(
              cours,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _Tableau() {
  final List<Map<String, String>> cours = [
    {
      'matiere': 'Algorithmique',
      'niveau': 'L2 Informatique',
      'type': 'Cours + TD',
      'heures': '6h',
    },
    {
      'matiere': 'Base de données',
      'niveau': 'L1 Informatique',
      'type': 'TD',
      'heures': '4h',
    },
    {
      'matiere': 'Réseaux',
      'niveau': 'L3 Informatique',
      'type': 'Cours',
      'heures': '3h',
    },
  ];

  return Container(
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
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 249),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.assignment, color: Colors.blue.shade700, size: 24),
              const SizedBox(width: 12),
              const Text(
                'Cours assignés',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        // Table header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              Expanded(flex: 2, child: _enteteTab('Matière')),
              Expanded(child: _enteteTab('Niveau')),
              Expanded(child: _enteteTab('Type')),
              Expanded(child: _enteteTab('Heures/sem.')),
            ],
          ),
        ),
        // Table rows
        ...cours.map((cours) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    cours['matiere']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 140, 133, 133),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    cours['niveau']!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ),
                Expanded(
                  child: Text(
                    cours['type']!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ),
                Expanded(
                  child: Text(
                    cours['heures']!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    ),
  );
}

// Fonction pour construire un en-tête de tableau
Widget _enteteTab(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}
