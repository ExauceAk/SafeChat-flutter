import 'package:flutter/material.dart';

class AuthSwitch extends StatefulWidget {
  final ValueChanged<bool> onToggle;

  const AuthSwitch({Key? key, required this.onToggle}) : super(key: key);

  @override
  State<AuthSwitch> createState() => _AuthSwitchState();
}

class _AuthSwitchState extends State<AuthSwitch> {
  bool isLogin = true;

  void _toggle(bool value) {
    setState(() => isLogin = value);
    widget.onToggle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFFf6f6f6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // 🟣 Fond animé
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: isLogin ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: 150,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          // 🔘 Boutons texte
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _toggle(true)),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: isLogin ? Colors.white : Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => setState(() => _toggle(false)),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: !isLogin ? Colors.white : Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
