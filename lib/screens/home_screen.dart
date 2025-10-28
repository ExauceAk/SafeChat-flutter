import 'package:flutter/material.dart';

import 'auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> messages = [
    {
      "id": 1,
      "profileImage": "assets/images/pp1.jpg",
      "name": "Marie Dupont",
      "lastMessage": "Tu as reçu les fichiers que je t’ai envoyés ?",
      "date": "09:32 PM",
      "unreadCount": 2,
    },
    {
      "id": 2,
      "profileImage": "assets/images/pp3.jpg",
      "name": "Jean-Marc Lefèvre",
      "lastMessage": "Merci pour ton aide hier 🙏",
      "date": "09:32 PM",
      "unreadCount": 0,
    },
    {
      "id": 3,
      "profileImage": "assets/images/pp2.jpg",
      "name": "Alice Martin",
      "lastMessage": "On se voit toujours demain pour le déjeuner ?",
      "date": "09:32 PM",
      "unreadCount": 1,
    },
    {
      "id": 4,
      "profileImage": "assets/images/pp1.jpg",
      "name": "Thomas Bernard",
      "lastMessage": "Je t’envoie la présentation dans 5 minutes.",
      "date": "09:32 PM",
      "unreadCount": 0,
    },
    {
      "id": 5,
      "profileImage": "assets/images/pp3.jpg",
      "name": "Élodie Rousseau",
      "lastMessage": "C’était super hier soir 😄",
      "date": "09:32 PM",
      "unreadCount": 3,
    },
    {
      "id": 6,
      "profileImage": "assets/images/pp2.jpg",
      "name": "Lucas Durand",
      "lastMessage": "Peux-tu vérifier les chiffres du rapport ?",
      "date": "09:32 PM",
      "unreadCount": 0,
    },
    {
      "id": 7,
      "profileImage": "assets/images/pp1.jpg",
      "name": "Sophie Laurent",
      "lastMessage": "Ok parfait, je note ça.",
      "date": "09:32 PM",
      "unreadCount": 0,
    },
    {
      "id": 8,
      "profileImage": "assets/images/pp3.jpg",
      "name": "Paul Girard",
      "lastMessage": "Je passe te voir cet après-midi.",
      "date": "09:32 PM",
      "unreadCount": 4,
    },
    {
      "id": 9,
      "profileImage": "assets/images/pp1.jpg",
      "name": "Nadia Petit",
      "lastMessage": "Tu peux m’appeler dès que tu es dispo ?",
      "date": "09:32 PM",
      "unreadCount": 1,
    },
    {
      "id": 10,
      "profileImage": "assets/images/pp2.jpg",
      "name": "Antoine Moreau",
      "lastMessage": "Bonne nuit 🌙",
      "date": "09:32 PM",
      "unreadCount": 0,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: Builder(
        builder: (context) => SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 15,
              children: [
                SizedBox(
                  height: size.height * 0.8,
                  child: GridView.builder(
                    itemCount: messages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 4,
                        ),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Container(
                        height: 10,
                        width: 10,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                message["profileImage"],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    message['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    message['lastMessage'],
                                    style: const TextStyle(fontSize: 15),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(message['date']),
                                if (message['unreadCount'] != 0)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueAccent,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${message['unreadCount']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
