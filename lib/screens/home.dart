import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loans/pages/home.dart';
import 'package:loans/widgets/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
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
        backgroundColor: Colors.transparent,
        body: [
          HomePage(statusBarHeight: statusBarHeight, size: size),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: statusBarHeight + 16),
                const Header(
                  title: "Phone 62***331",
                  subtitle: "Weclome back",
                )
              ],
            ),
          ),
        ][currentIndex],
        bottomNavigationBar: BottomNavigationView(
          firstButton: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: currentIndex == 0
                    ? const Color.fromARGB(255, 8, 30, 46)
                    : const Color.fromARGB(255, 22, 45, 63),
              ),
              child: Icon(
                FontAwesomeIcons.house,
                color: currentIndex == 0
                    ? Colors.green
                    : const Color.fromARGB(255, 69, 70, 93),
              ),
            ),
          ),
          secondButton: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: currentIndex == 1
                    ? const Color.fromARGB(255, 8, 30, 46)
                    : const Color.fromARGB(255, 22, 45, 63),
              ),
              child: Icon(
                FontAwesomeIcons.user,
                color: currentIndex == 1
                    ? Colors.green
                    : const Color.fromARGB(255, 69, 70, 93),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
