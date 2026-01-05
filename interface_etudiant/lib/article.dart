import 'package:flutter/material.dart';
import 'package:interface_etudiant/carte.dart';
import 'package:interface_etudiant/event.dart';
import 'package:interface_etudiant/resultat.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  //boxCard , favoris , card, articleRecent ,
  @override
  Widget build(BuildContext context) {
    final forum = [
      Carte(
        titre: "Cours et TD",
        couleur: Colors.black,
        taille: 0.45,
        contenu: "Questions sur les cours et exercices",
        icon: Icons.school,
      ),
      Carte(
        titre: "Projets",
        couleur: Colors.black,
        taille: 0.45,
        contenu: "Collaboration sur les projets",
        icon: Icons.electric_bike,
      ),
      Carte(
        titre: "Carrière",
        couleur: Colors.black,
        taille: 0.45,
        contenu: "Stages et opportunités professionnelles",
        icon: Icons.badge,
      ),
      Carte(
        titre: "Général",
        couleur: Colors.black,
        taille: 0.45,
        contenu: "Discussion diverses",
        icon: Icons.people,
      ),
    ];

    final acces_rapide = [
      Carte(
        titre: "Résultats",
        couleur: Color(0xFF3498DB),
        taille: 0.3,
        icon: Icons.access_alarm,
      ),
      Carte(
        titre: "Emploi du temps",
        couleur: Color(0xFF3498DB),
        taille: 0.3,
        icon: Icons.schedule,
      ),
      Carte(
        titre: "Document",
        couleur: Color(0xFF3498DB),
        taille: 0.3,
        icon: Icons.document_scanner,
      ),
      Carte(
        titre: "Ressources",
        couleur: Color(0xFF3498DB),
        taille: 0.3,
        icon: Icons.library_add_check,
      ),
      Carte(
        titre: "Actualités",
        couleur: Color(0xFF3498DB),
        taille: 0.3,
        icon: Icons.alarm_rounded,
      ),
      Carte(
        titre: "Message",
        couleur: Color(0xFf3498DB),
        taille: 0.3,
        icon: Icons.messenger_sharp,
      ),
    ];
    // création d'un tableau pour les évenements

    final stat = [
      Carte(
        titre: "14.2",
        couleur: Colors.black,
        taille: 0.46,
        contenu: "Moyenne générale",
      ),
      Carte(
        titre: "4",
        couleur: Colors.black,
        taille: 0.46,
        contenu: "UE validés",
      ),
      Carte(
        titre: "60",
        couleur: Colors.black,
        taille: 0.46,
        contenu: "crédits ECTS",
      ),
      Carte(
        couleur: Colors.black,
        titre: "1",
        taille: 0.46,
        contenu: "Rang promotion",
      ),
    ];

    final events = [
      Event(
        date: "10 Déc. 2023",
        duree: "14H-16h",
        titre: "Session de Tutorat de Mathématiques",
        couleur: Colors.blue,
        lieu: "salle fs13",
        organisateur: "organisé par le Club Informatique CI",
        contenu:
            "Session de révision pour préparer l'examen de fin de semestsre . Apportez vos exercices!",
      ),

      Event(
        date: "24 Jan 2026",
        duree: "20h-23h",
        titre: "Masterclass en Intelligence Artificielle",
        lieu: "CCOS",
        contenu:
            "CI présente une masterclass en intelligence artificielle, venez nombreux accompagné de vos amis passioné en IA et en science de données",
        organisateur: "organisé par CI",
        couleur: Colors.red,
      ),
    ];

    // tableau pour les résultats matiere note et statut

    final List<Resultat> res = [
      Resultat(matiere: "Algorithmique", note: 15, statu: "validé"),
      Resultat(matiere: "Mathématique", note: 12, statu: "validé"),
      Resultat(matiere: "Developpement mobile", note: 16, statu: "validé"),
    ];

    final List<Shedule> shedule = [
      Shedule(
        heure: "10h-12h",
        jour: "Lundi",
        matiere: "Algorithmique",
        salle: "Fs12",
      ),
      Shedule(
        heure: "08H-10H",
        matiere: "Dev Web",
        jour: "Mardi",
        salle: "Fs02",
      ),
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      menu(
                        items: [
                          {"icon": Icons.home, "label": "Accueil"},
                          {"icon": Icons.school, "label": "Résultats"},
                          {"icon": Icons.book, "label": "Bibliothéque"},
                          {"icon": Icons.messenger, "label": "Forum"},
                        ],
                        iconColor: Color(0xFF3498DB),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Bibilothèque Numérique",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 54, 53, 53),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      recherche(),
                      SizedBox(height: 25),
                      SizedBox(
                        height: 45,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            boxCard("Tous"),
                            boxCard("Informatique"),
                            boxCard("Mathématiques"),
                            boxCard("Physique"),
                            boxCard("Developement Mobile"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Livres populaires",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      livreBox(
                        "Algorithmique et programmation",
                        "Jean-Michel Doudoux",
                        "PDF",
                        "245",
                        "4.8/5",
                      ),
                      livreBox(
                        "Mathématiques pour l'informatique",
                        "Pierre Arnoux",
                        "PDF",
                        "189",
                        "4.6/5",
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Article récents",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                      ),
                      articleRecent(
                        "Intelligence Artificielle et Education",
                        "Revue internationale des Technologies en Education, vol.15 ,No.2",
                        Color(0xFF9B59B6),
                        Icons.edit_document,
                      ),
                      SizedBox(height: 10),
                      articleRecent(
                        "Cybersécurité dans les systèmes universitaires",
                        "Journal of Education Technology Systems,2023",
                        Colors.green,
                        Icons.document_scanner_sharp,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Mes favoris",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      favoris(
                        "Base de données avancées",
                        "Ajouté le 5 décembre 2023",
                        Icons.favorite,
                        Colors.orangeAccent,
                        "Ouvrir",
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Forum d'échanges",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF2C3E50),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        child: GridView.builder(
                          itemCount: forum.length,
                          shrinkWrap: true,

                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 1,
                                mainAxisExtent: 160,
                              ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: carte(
                                forum[index].titre,
                                forum[index].couleur,
                                forum[index].taille,
                                contenu: forum[index].contenu,
                                icon: forum[index].icon,
                              ),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Evenements à l'UFR",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 320,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: events.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: event(
                                events[index].date,
                                events[index].duree,
                                events[index].titre,
                                events[index].couleur,
                                events[index].lieu,
                                events[index].organisateur,
                                events[index].contenu,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Accès rapide",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      GridView.builder(
                        itemCount: acces_rapide.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: carte(
                              acces_rapide[index].titre,
                              acces_rapide[index].couleur,
                              acces_rapide[index].taille,
                              icon: acces_rapide[index].icon,
                            ),
                          );
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Dernières actualités",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      iconColorText(
                        "Inscription administratives ",
                        Color(0xFF3498DB),
                        Icons.info,
                        contenu:
                            "Les inscriptions pour le semestre débutent le 15 Janvier 2024",
                        taille: 0.65,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 68, top: 20),
                        child: Text(
                          "Il y a 2 jours",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(125, 18, 17, 17),
                          ),
                        ),
                      ),
                      Divider(
                        color: const Color.fromARGB(32, 158, 158, 158),
                        thickness: 1,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Mes résultats",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            iconColorText(
                              "Résultats Semestre 1",
                              Color(0xFF3498DB),
                              Icons.height,
                            ),
                            SizedBox(height: 15),
                            tableau(res),
                            SizedBox(height: 10),
                            Container(
                              alignment: Alignment.bottomRight,
                              height: 28,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  backgroundColor: Color(0xFF3498DB),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Télécharger le relevé",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Statistiques académiques",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      GridView.builder(
                        itemCount: stat.length,
                        shrinkWrap: true,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 125,
                        ),
                        itemBuilder: (context, index) {
                          return carte(
                            stat[index].titre,
                            stat[index].couleur,
                            stat[index].taille,
                            contenu: stat[index].contenu,
                          );
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Mon emploi du temps",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            iconColorText(
                              "Semaine du 4 au 8 Décembre",
                              Color(0xFF9B59B6),
                              Icons.calendar_month,
                            ),
                            SizedBox(height: 15),
                            emploiTemps(shedule),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Examens à venir",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 2,

                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              children: [
                                iconColorText(
                                  "Session d'examens - Janvier 2024",
                                  Color(0xFFF39C12),
                                  Icons.document_scanner,
                                ),
                                SizedBox(height: 8),

                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        child: Text(
                                          "Algorithmique",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF7F8C8D),

                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        child: Text(
                                          "15 Janvier 2024 08H-10H Amphi B",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                              255,
                                              161,
                                              158,
                                              158,
                                            ),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: const Color.fromARGB(
                                          34,
                                          158,
                                          158,
                                          158,
                                        ),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Mes documents",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      Card(
                        elevation: 3,
                        color: Colors.white,
                        child: Column(
                          children: [
                            iconColorText(
                              "Documents disponibles",
                              Color(0xFFF39C12),
                              Icons.edit_document,
                            ),
                            SizedBox(height: 8),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  children: [
                                    favoris(
                                      "Attestation de scolarité 2023-2024",
                                      "Document certifiant votre inscription",
                                      Icons.document_scanner,
                                      Color(0xFF2ECC71),
                                      "Telecharger",
                                    ),
                                    Divider(
                                      color: const Color.fromARGB(
                                        78,
                                        158,
                                        158,
                                        158,
                                      ),
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  children: [
                                    favoris(
                                      "Relevé de notes Semestre 1",
                                      "Document officiel certifiant votre inscription",
                                      Icons.document_scanner,
                                      Color(0xFF3498DB),
                                      "Telecharger",
                                    ),
                                    Divider(
                                      color: const Color.fromARGB(
                                        78,
                                        158,
                                        158,
                                        158,
                                      ),
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Demandes en cours",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              iconColorText(
                                "Documents en attente",
                                Color(0xFF2C3E50),
                                Icons.timer,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  "Diplôme de Licence",
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: Color(0xFF7F8C8D),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  "En cours de traitement . Estimation : 15 jours",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 134, 132, 132),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // widget pour menu d'en haut

  Widget menu({
    required List<Map<String, dynamic>> items,
    Color iconColor = Colors.blueAccent,
    Color textColor = Colors.black87,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          return InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item['icon'], color: iconColor, size: 26),
                const SizedBox(height: 4),
                Text(
                  item['label'],
                  style: TextStyle(fontSize: 12, color: textColor),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // fonction pour le box article

  Widget livreBox(
    String titre,
    String auteur,
    String type,
    String nbTelechargment,
    String note,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 245, 242, 242),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3498DB), Color(0xFF2ECC71)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 70,
            width: 75,
            child: Center(
              child: Icon(Icons.menu, size: 40, color: Colors.white),
            ),
          ),
          SizedBox(
            width: 210,
            child: Column(
              //text
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    titre,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    auteur,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 74, 72, 72),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            size: 14,
                            color: const Color.fromARGB(255, 106, 104, 104),
                          ),
                          Text(
                            type,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 106, 104, 104),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.download,
                            size: 14,
                            color: const Color.fromARGB(255, 98, 96, 96),
                          ),
                          Text(
                            nbTelechargment,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: const Color.fromARGB(255, 106, 104, 104),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(
                            Icons.star,
                            size: 15,
                            color: const Color.fromARGB(255, 106, 104, 104),
                          ),
                          Text(
                            note,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: const Color.fromARGB(255, 106, 104, 104),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 44,
                  height: 85,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3498DB), Color(0xFF2ECC71)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Center(
                    child: Icon(Icons.download, size: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // pour les articles

  Widget articleRecent(
    String nomArticle,
    String contenu,
    Color couleur,
    IconData icon,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,

      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: couleur,
                  ),
                  width: 60,
                  height: 40,
                  child: Center(
                    child: Icon(icon, color: Colors.white, size: 20),
                  ),
                ),

                Container(
                  width: 300,
                  padding: EdgeInsets.only(left: 2),
                  child: Text(
                    nomArticle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              contenu,
              style: TextStyle(
                fontSize: 13,
                color: const Color.fromARGB(255, 42, 37, 37),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(width: 1, color: Colors.blueAccent),
                  ),
                  child: const Text(
                    "Lire en ligne",
                    style: TextStyle(fontSize: 12, color: Colors.blueAccent),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [Color(0xFF3498DB), Color(0xFF2ECC71)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Télécharger",
                      style: TextStyle(fontSize: 12),
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

  // card

  Widget carte(
    String titre,
    Color couleur,
    double taille, {
    String contenu = "",
    IconData icon = Icons.add,
  }) {
    double size;
    if (icon != Icons.add) {
      size = 15;
    } else {
      size = 25;
    }
    return Container(
      height: 100,
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != Icons.add
                  ? Icon(icon, size: 27, color: couleur)
                  : SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  titre,
                  style: TextStyle(
                    fontSize: size,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              contenu != ""
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        contenu,
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 108, 103, 103),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  // favoris

  Widget favoris(
    String titre,
    String referencement,
    IconData icon,
    Color couleur,
    String labelButton,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconColorText(titre, couleur, icon, contenu: referencement),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.blueAccent),
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              ),
              child: Text(
                labelButton,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // iconColorText

  Widget iconColorText(
    String titre,
    Color couleur,
    IconData icon, {
    String contenu = "",
    double taille = 0.50,
  }) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: couleur,
          ),
          width: 50,
          height: 45,
          margin: EdgeInsets.only(right: 15),
          child: Center(child: Icon(icon, size: 20, color: Colors.white)),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * taille,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  titre,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 76, 72, 72),
                  ),
                ),
              ),

              contenu != ""
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        contenu,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 130, 124, 124),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
  // boxCard

  Widget boxCard(String titre) {
    return ElevatedButton(
      onPressed: () {},
      style:
          ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 16, right: 40, top: 8, bottom: 8),
            backgroundColor: Color(0xFFF8F9FA),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return const Color.fromARGB(255, 57, 201, 220);
              }
              return Color(0xFFF8F9FA);
            }),

            foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white;
              }
              return Colors.black;
            }),
            elevation: WidgetStateProperty.resolveWith<double>((states) {
              if (states.contains(WidgetState.hovered)) return 0;
              return 0;
            }),
          ),
      child: Text(
        titre,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }

  //rechercher

  Widget recherche() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Material(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 38,
              child: TextField(
                style: TextStyle(color: const Color.fromARGB(255, 68, 65, 65)),
                decoration: InputDecoration(
                  hintText: "Rechercher un livre, un article...",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                    color: Color.fromARGB(255, 117, 115, 115),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 20,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 38,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Icon(Icons.search, size: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // la fonction pour le box evenement

  Widget event(
    String date,
    String duree,
    String titre,
    Color couleur,
    String lieu,
    String organisateur,
    String contenu,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,

      margin: EdgeInsets.only(right: 15, bottom: 15),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              gradient: LinearGradient(
                colors: [couleur, const Color.fromARGB(255, 100, 68, 164)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    date + " ." + duree,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    titre,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                iconText(
                  "Salle 204- Bâtiment Principal",
                  Icons.local_activity_outlined,
                ),
                iconText("Organisé par: Club des Maths", Icons.people),
                Container(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text(
                      contenu,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {},
                          style:
                              ElevatedButton.styleFrom(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 20,
                                  top: 2,
                                  bottom: 2,
                                ),
                                backgroundColor: Colors.transparent,
                                side: BorderSide(
                                  color: Color(0xFF3498DB),
                                  width: 1,
                                ),
                              ).copyWith(
                                foregroundColor:
                                    WidgetStateProperty.resolveWith<Color?>((
                                      states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.hovered,
                                      )) {
                                        return Colors.lightBlue;
                                      }
                                      return null;
                                    }),
                                backgroundColor:
                                    WidgetStateProperty.resolveWith<Color?>((
                                      states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.hovered,
                                      )) {
                                        return Colors.lightBlue;
                                      }
                                      return Colors.white;
                                    }),
                              ),
                          child: Text(
                            "Participer",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 25,
                              top: 4,
                              bottom: 4,
                            ),
                            backgroundColor: Color(0xFF3498DB),
                          ),
                          child: Text(
                            "+Calendrier",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row iconText(String lieu, IconData icon) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Icon(
            icon,
            size: 23,
            color: const Color.fromARGB(255, 142, 138, 138),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            lieu,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 110, 104, 104),
            ),
          ),
        ),
      ],
    );
  }

  // tableau

  Widget tableau(final result) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        top: BorderSide(color: Color(0xFFEEEEEE)),
        bottom: BorderSide(color: Color(0xFFEEEEEE)),
      ),
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      children: [
        TableRow(
          decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Matière",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Note",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Statut",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        for (final r in result)
          TableRow(
            decoration: BoxDecoration(color: Colors.white),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Text(
                  r.matiere,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  r.note.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  r.statu,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget emploiTemps(final shedule) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        top: BorderSide(color: Color(0xFFEEEEEE)),
        bottom: BorderSide(color: Color(0xFFEEEEEE)),
      ),
      columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
      children: [
        TableRow(
          decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Jour",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Matiére",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Heure",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                "Salle",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        for (final r in shedule)
          TableRow(
            decoration: BoxDecoration(color: Colors.white),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: Text(
                  r.jour,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  r.matiere,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  r.heure,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  r.salle,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  //
}
