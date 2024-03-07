import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loans/screens/loan_history.dart';
import 'package:loans/widgets/repay_card.dart';

class RepaymentScreen extends StatelessWidget {
  const RepaymentScreen({super.key});

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
          title: const Text("Repayment"),
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                height: size.height * 0.38,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current amount due",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff79aed9),
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.qrcode,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Text(
                          "Tsh",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "5,957,000",
                          style: TextStyle(
                            fontSize: 48,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              size: 16,
                              FontAwesomeIcons.clock,
                              color: Color(
                                0xff79aed9,
                              ),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Repayment date",
                                  style: TextStyle(
                                    color: Color(0xff79aed9),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "2024-03-12",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.download,
                              size: 16,
                              color: Color(0xff79aed9),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Repayment amount",
                                  style: TextStyle(
                                    color: Color(0xff79aed9),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Tsh 539,400",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          onPressed: () {},
                          height: 56,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: const Color.fromARGB(255, 92, 172, 238),
                          child: const Text(
                            "Repayment",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Remaining payment",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                height: size.height * 0.17,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 104, 156, 229),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    RepayCard(
                        size: size,
                        item: "Misumali",
                        amount: "50,000",
                        paymentDate: "2024-05-02"),
                    SizedBox(width: size.width * 0.04),
                    RepayCard(
                      size: size,
                      item: "Mabati",
                      amount: "850,900",
                      paymentDate: "2024-07-23",
                    ),
                    SizedBox(width: size.width * 0.04),
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: size.height * 0.15,
                      width: size.width * 0.17,
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
                      child: const Column(
                        children: [
                          Flexible(
                            child: Text(
                              "View all",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 168, 180, 255),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Color.fromARGB(255, 168, 180, 255),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoanHistoryScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  height: size.height * 0.14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: size.height * 0.13,
                        width: size.height * 0.08,
                        decoration: BoxDecoration(
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
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              height: size.height * 0.11,
                            ),
                            const Positioned(
                              top: 10,
                              child: Icon(
                                Icons.receipt_long_outlined,
                                size: 38,
                                color: Color.fromARGB(255, 183, 192, 255),
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              child: Icon(
                                FontAwesomeIcons.clock,
                                size: 22,
                                color: Color.fromARGB(255, 183, 192, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "All Loan History",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Color.fromARGB(255, 90, 90, 90),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "View all past loan payment record",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
