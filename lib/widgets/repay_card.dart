import 'package:flutter/material.dart';

class RepayCard extends StatelessWidget {
  final String item;
  final String amount;
  final String paymentDate;
  const RepayCard({
    super.key,
    required this.size,
    required this.item,
    required this.amount,
    required this.paymentDate,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: size.height * 0.15,
      width: size.width * 0.29,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 19, 77, 124),
            Colors.blue,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item,
            style: const TextStyle(
              color: Color.fromARGB(255, 183, 192, 255),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tsh $amount",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            paymentDate,
            style: const TextStyle(
              color: Color.fromARGB(255, 183, 192, 255),
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
