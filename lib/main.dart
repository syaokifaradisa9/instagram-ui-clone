import 'package:flutter/material.dart';
import 'package:instagram_clone/home.dart';
import 'package:instagram_clone/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List pages = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset(
              "assets/icons/Home.png",
              width: 26,
              height: 26,
            )
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset(
              "assets/icons/Search.png",
              width: 26,
              height: 26,
            )
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset(
              "assets/icons/Add.png",
              width: 26,
              height: 26,
            )
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset(
              "assets/icons/Reels.png",
              width: 26,
              height: 26,
            )
          ),
          const BottomNavigationBarItem(
            label: "",
            icon: CircleAvatar(
              radius: 13,
              backgroundImage: AssetImage(
                "assets/images/Profile.jpeg"
              ),
            )
          )
        ],
      ),
    );
  }
}
