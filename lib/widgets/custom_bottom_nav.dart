import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.public,
    Icons.chat_bubble_outline,
    Icons.phone_outlined,
    Icons.settings_outlined,
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // 🟣 La barre du bas
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_icons.length, (index) {
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Icon(
                  _icons[index],
                  color: _selectedIndex == index
                      ? const Color(0xFF7B42F6)
                      : Colors.grey,
                  size: 28,
                ),
              );
            }),
          ),
        ),

        // 🔵 Le bouton central flottant
        Positioned(
          bottom: 45,
          child: GestureDetector(
            onTap: () {
              // Action du bouton central
            },
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: const Color(0xFF7B42F6),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7B42F6).withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 32),
            ),
          ),
        ),
      ],
    );
  }
}
