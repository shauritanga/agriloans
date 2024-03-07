// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomerLoanDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> customer;
  const CustomerLoanDetailsScreen({
    required this.customer,
    super.key,
  });

  @override
  State<CustomerLoanDetailsScreen> createState() =>
      _CustomerLoanDetailsScreenState();
}

class _CustomerLoanDetailsScreenState extends State<CustomerLoanDetailsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List searchList(String name) {
    List searchList = [];
    String temp = "";
    for (int i = 0; i < name.length; i++) {
      temp += name[i];
      searchList.add(temp);
    }
    return searchList;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final totalLoan = widget.customer['loans']
        .map((e) => e['item']['cost'])
        .fold(0.0,
            (previousValue, element) => previousValue + element.toDouble());

    final paid = widget.customer['loans']
        .map((e) => e['item']['paid'])
        .fold(0.0, (previousValue, element) {
      if (element != null) {
        return previousValue + element.toDouble();
      }
      return previousValue + 0.0;
    });

    final unpaid = totalLoan - paid;

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
          title: const Text("Loan Deatails"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Container(
                height: size.height * 0.35,
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.coins,
                          color: Colors.blue[200],
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "Total Loan amount",
                          style: TextStyle(
                            color: Colors.blue[200],
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Tsh.${NumberFormat.currency(decimalDigits: 0, name: "").format(totalLoan)}",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Paid",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[300],
                          ),
                        ),
                        Text(
                          "Tsh.${NumberFormat.currency(decimalDigits: 0, name: "").format(paid)}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[300],
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 0.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Unpaid",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[300],
                          ),
                        ),
                        Text(
                          "Tsh.${NumberFormat.currency(decimalDigits: 0, name: "").format(unpaid)}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Loans",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.customer['loans'].length,
                itemBuilder: (context, index) {
                  final loni = widget.customer['loans'][index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${loni['item']['product_name']}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue[300],
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(decimalDigits: 0, name: "")
                                  .format(loni['item']['cost'] -
                                      loni['item']['paid']),
                              style: TextStyle(
                                color: Colors.blue[300],
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      content: TextField(
                                        controller: _controller,
                                        keyboardType: TextInputType.number,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (_controller.text.isEmpty) {
                                              return;
                                            }
                                            final Map<String, dynamic> data = {
                                              "paid": loni['item']['paid'] +
                                                  double.parse(
                                                      _controller.text),
                                            };
                                            await FirebaseFirestore.instance
                                                .collection("loans")
                                                .doc(loni['id'])
                                                .update(data);
                                            setState(
                                              () {
                                                _controller.text = "";
                                              },
                                            );
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: const Text("Pay"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: MaterialButton(
            onPressed: () async {
              String? productName;
              int? quantity;
              double? price;
              final GlobalKey<FormState> formKey = GlobalKey<FormState>();
              final result = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("New loan"),
                  content: Container(
                    padding: const EdgeInsets.all(0),
                    width: size.width * 0.7,
                    height: 200,
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Product name",
                              ),
                              onSaved: (value) => productName = value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter product name";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Its price",
                              ),
                              onSaved: (value) =>
                                  price = double.parse(value.toString()),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter its price";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Quntity",
                              ),
                              onSaved: (value) =>
                                  quantity = int.parse(value.toString()),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the quantity";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                            final data = {
                              "product_name": productName,
                              "price": price,
                              "quantity": quantity,
                              "cost": (price! * quantity!),
                              "phone": widget.customer['customer']['phone'],
                              "paid": 0.0,
                            };

                            await FirebaseFirestore.instance
                                .collection("loans")
                                .add(data);
                            Navigator.pop(context, true);
                          }
                        },
                        child: const Text("Ok")),
                  ],
                ),
              );
              if (result) {
                Navigator.pop(context);
              }
            },
            height: 56,
            minWidth: size.width * 1,
            color: const Color.fromARGB(255, 19, 97, 160),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Text(
              "Add Loan",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
