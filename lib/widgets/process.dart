import 'package:flutter/material.dart';

class BorrowingPrpcess extends StatelessWidget {
  final String title;
  final String subtitle;
  final String number;
  final void Function()? onTap;
  final IconData? icon;
  const BorrowingPrpcess({
    this.title = "",
    this.subtitle = "",
    this.number = "",
    this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 22, 45, 63),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xff999999),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 106, 114, 121),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        number,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 227, 227, 227),
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
