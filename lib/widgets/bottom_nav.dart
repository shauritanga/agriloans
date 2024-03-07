import "package:flutter/material.dart";

class BottomNavigationView extends StatelessWidget {
  final Widget firstButton;
  final Widget secondButton;
  const BottomNavigationView({
    required this.firstButton,
    required this.secondButton,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0.0, -10),
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: const Color.fromARGB(255, 22, 45, 63),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(child: firstButton),
            Expanded(child: secondButton),
          ],
        ),
      ),
    );
  }
}
