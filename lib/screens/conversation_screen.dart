import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe9e9e9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_sharp),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image(
                      image: AssetImage('assets/images/pp1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marie Dupont',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('Online', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                  SizedBox(width: 20),
                  Icon(Icons.video_call_rounded, size: 32, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.phone, size: 25, color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Expanded(
          child: Center(child: Column(children: [Text('Hello from conv')])),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: Colors.white,
          notchMargin: 5,
          elevation: 30,
          child: Row(children: []),
        ),
      ),
    );
  }
}
