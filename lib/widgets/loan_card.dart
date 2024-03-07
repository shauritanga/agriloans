import 'package:flutter/material.dart';
import 'package:loans/utils/status.dart';

class LoanCard extends StatelessWidget {
  final String debtor;
  final String item;
  final String date;
  final String cost;
  final Status status;
  const LoanCard({
    super.key,
    required this.size,
    required this.date,
    required this.debtor,
    required this.status,
    required this.item,
    required this.cost,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.only(bottom: 16),
      height: size.height * 0.16,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(debtor),
              Text(
                date,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          const Divider(thickness: 0.5, color: Colors.grey),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width * 0.145,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 94, 173, 238),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Tsh. $cost",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.05,
                        width: size.width * 0.22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          status.name,
                          style: const TextStyle(
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
        ],
      ),
    );
  }
}
