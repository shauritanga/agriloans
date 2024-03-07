import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loans/screens/loan_details.dart';
import 'package:rxdart/rxdart.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  TextEditingController _controller = TextEditingController();
  void _search(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          leading: Container(
            height: 58,
            width: 58,
            child: const Icon(Icons.chevron_left),
          ),
          title: TextField(controller: _controller, onChanged: _search),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Colors.transparent,
        body: StreamBuilder(
          stream: CombineLatestStream.list([
            FirebaseFirestore.instance.collection('customers').snapshots(),
            FirebaseFirestore.instance.collection('loans').snapshots(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("${snapshot.error}"),
                ),
              );
            }
            final customers =
                snapshot.data![0].docs.map((doc) => doc.data()).toList();
            final loans = snapshot.data![1].docs
                .map((doc) => {"id": doc.id, "item": doc.data()})
                .toList();

            List finalLoans = [];
            for (int i = 0; i < customers.length; i++) {
              Map<String, dynamic> customerLoans = {};
              List deducedLoans = [];
              customerLoans['customer'] = customers[i];
              for (int j = 0; j < loans.length; j++) {
                final lon = loans[j]['item']! as Map;
                if (lon['phone'] == customers[i]['phone']) {
                  deducedLoans.add(loans[j]);
                }
              }
              customerLoans['loans'] = deducedLoans;
              finalLoans.add(customerLoans);
            }
            List filteredList = [];
            if (_controller.text.isEmpty) {
              filteredList = finalLoans;
            } else {
              filteredList = finalLoans
                  .where(
                    (element) => element['customer']['name']
                        .toLowerCase()
                        .contains(_controller.text.toLowerCase()),
                  )
                  .toList();
            }

            return ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final customerLoan = filteredList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CustomerLoanDetailsScreen(customer: customerLoan),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin:
                          const EdgeInsets.only(top: 16, right: 16, left: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 0.1),
                            blurRadius: 0.2,
                            color: Color.fromARGB(255, 207, 207, 207),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${customerLoan['customer']['name']}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 27, 27, 27),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${customerLoan['loans'].length} active loans",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
