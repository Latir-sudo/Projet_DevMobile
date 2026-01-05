import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Saisie des notes
          const Text(
            'Saisie des notes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _TabNote(),
          const SizedBox(height: 32),
          // Notes déjà saisies
          const Text(
            'Notes déjà saisies',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _noteSaisi(),
        ],
      ),
    );
  }
}

Widget _TabNote() {
  final List<Map<String, dynamic>> students = [
    {'name': 'Moussa Diop', 'grade': '15.5', 'status': 'Saisie'},
    {'name': 'Aminata Fall', 'grade': '14.0', 'status': 'Saisie'},
    {'name': 'Ibrahima Ndiaye', 'grade': '', 'status': 'En attente'},
  ];

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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.edit, color: Colors.green.shade700, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              'Algorithmique - L2 Info',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Table header
        Row(
          children: [
            Expanded(flex: 2, child: _enteteTab('Étudiant')),
            Expanded(child: _enteteTab('Note')),
            Expanded(child: _enteteTab('Statut')),
          ],
        ),
        const Divider(height: 24),
        // Table rows
        ...students.map((student) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      student['name'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 250, 248, 248),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: TextEditingController(
                          text: student['grade'],
                        ),
                        decoration: InputDecoration(
                          hintText: 'Note',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.all(12),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: student['status'] == 'Saisie'
                            ? const Color.fromARGB(255, 248, 250, 248)
                            : Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        student['status'],
                        style: TextStyle(
                          fontSize: 12,
                          color: student['status'] == 'Saisie'
                              ? const Color.fromARGB(255, 77, 78, 77)
                              : Colors.orange.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              if (student != students.last) const Divider(height: 24),
            ],
          );
        }).toList(),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Action pour enregistrer
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 53, 120, 186),
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              fixedSize: const Size.fromWidth(100),
            ),
            child: const Text(
              'Enregistrer les notes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//fonction pour notre deja saisi
Widget _noteSaisi() {
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
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.check_circle,
            color: Colors.green.shade700,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Base de données - L1 Info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Examen final',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 4),
              Text(
                'Notes publiées le 5 décembre • 25 étudiants',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue.shade50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'Consulter',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
      color: const Color.fromARGB(255, 46, 43, 43),
    ),
  );
}
