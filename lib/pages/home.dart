// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loans/screens/customer_loan.dart';
import 'package:loans/screens/repayment.dart';
import 'package:loans/widgets/process.dart';
import 'package:loans/widgets/tree.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.statusBarHeight,
    required this.size,
  });

  final double statusBarHeight;
  final Size size;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: widget.statusBarHeight + 16),
            const Header(
              title: "Hi",
              titleStyle: TextStyle(
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              subtitle: "Welcome",
              subtitleStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(22),
              height: widget.size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/img/cool.png"),
                  fit: BoxFit.cover,
                ),
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Expanded(
                      child: Column(
                    children: [
                      Text(
                        "up to(TZS)",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "800,000",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )),
                  MaterialButton(
                    onPressed: () {},
                    height: 48,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: const Color.fromARGB(255, 60, 187, 64),
                    child: const Text(
                      "Get Cash",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Borrowing process",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            BorrowingPrpcess(
              onTap: () {
                String? name;
                String? phone;
                final GlobalKey<FormState> formKey = GlobalKey<FormState>();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("New Customer"),
                    content: Container(
                      //padding: const EdgeInsets.all(12),
                      width: widget.size.width * 0.7,
                      height: 100,
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Full name",
                                ),
                                onSaved: (value) => name = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Full name is required";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Phone number",
                                ),
                                onSaved: (value) => phone = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Phone number is required";
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
                                "name": name,
                                "phone": phone,
                                "search_list": searchList(name!),
                              };

                              await FirebaseFirestore.instance
                                  .collection("customers")
                                  .add(data);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Ok")),
                    ],
                  ),
                );
              },
              icon: FontAwesomeIcons.clipboardList,
              number: "01",
              title: "Customer management",
              subtitle: "Enter Your Basic Information",
            ),
            const Tree(),
            BorrowingPrpcess(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CustomersScreen()));
              },
              icon: FontAwesomeIcons.creditCard,
              number: "02",
              title: "Loan",
              subtitle: "Obtain Qualification",
            ),
            const Tree(),
            BorrowingPrpcess(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RepaymentScreen(),
                  ),
                );
              },
              icon: FontAwesomeIcons.wallet,
              number: "03",
              title: "Repayment",
              subtitle: "Safety And Security",
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  const Header({
    this.title = "",
    this.subtitle = "",
    this.subtitleStyle,
    this.titleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            Text(subtitle, style: subtitleStyle),
          ],
        )
      ],
    );
  }
}
