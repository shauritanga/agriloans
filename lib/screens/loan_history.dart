import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loans/utils/status.dart';
import 'package:loans/widgets/loan_card.dart';

class LoanHistoryScreen extends StatelessWidget {
  const LoanHistoryScreen({super.key});

  List get loans => [
        {
          "name": "Athanas Shauritanga",
          "item": "Misumali",
          "cost": "46,900",
          "status": Status.paid,
          "date": "Wed, January 12, 2024"
        },
        {
          "name": "Salim Abu",
          "date": "Wed, June 12, 2023",
          "item": "Misumali",
          "cost": "460,900",
          "status": Status.paid
        },
        {
          "name": "Said Makono",
          "date": "Fri, January 12, 2024",
          "item": "Windows",
          "cost": "3,500,000",
          "status": Status.paid
        },
        {
          "name": "Salim Abu",
          "date": "Wed, February 12, 2023",
          "item": "Mbao",
          "cost": "907,900",
          "status": Status.unpaid
        },
        {
          "name": "Elizebeth Israel",
          "date": "Mon, July 12, 2023",
          "item": "Tiles",
          "cost": "500,900",
          "status": Status.unpaid
        },
      ];

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.3, 0.5, 0.7, 0.9],
          colors: [
            Colors.blue[500]!,
            const Color.fromARGB(255, 18, 81, 136),
            const Color.fromARGB(255, 14, 67, 120),
            const Color.fromARGB(255, 11, 52, 100),
            const Color.fromARGB(255, 6, 36, 80),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Loan History",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final result = await showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            200, statusBarHeight + 108, 16, 0),
                        items: [
                          PopupMenuItem(
                            value: "asc",
                            onTap: () {},
                            child: const Text("Ascending"),
                          ),
                          PopupMenuItem(
                            value: "desc",
                            onTap: () {},
                            child: const Text("Descending"),
                          ),
                          PopupMenuItem(
                            value: "paid",
                            onTap: () {},
                            child: const Text("Paid"),
                          ),
                          PopupMenuItem(
                            value: "unpaid",
                            onTap: () {},
                            child: const Text("Unpaid"),
                          ),
                        ],
                      );
                      print(result);
                    },
                    child: const SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          Text(
                            "Filter",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            FontAwesomeIcons.chevronDown,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: loans.length,
                itemBuilder: (context, index) {
                  final loan = loans[index];
                  return LoanCard(
                    debtor: loan['name'],
                    date: loan['date'],
                    size: size,
                    status: loan['status'],
                    item: loan['item'],
                    cost: loan['cost'],
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
