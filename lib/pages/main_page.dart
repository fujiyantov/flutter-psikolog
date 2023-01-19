import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/components/header.dart';
import 'package:psikolog/pages/home/account_page.dart';
import 'package:psikolog/pages/home/graph_page.dart';
import 'package:psikolog/pages/home/history_page.dart';
import 'package:psikolog/pages/home/home_page.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/providers/user_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _asyncMethod();
  }

  void _asyncMethod() async {
    me();
  }

  me() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<UserProvider>(context, listen: false)
        .me(token: authProvider.auth?.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    Widget btnMenu() {
      switch (_selectedIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const HistoryPage();
        case 2:
          return const GraphPage();
        case 3:
          return const AccountPage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Header(),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Riwayat',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Grafik',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
            backgroundColor: Colors.white,
          ),
        ],
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        selectedIconTheme: const IconThemeData(color: Colors.green),
        unselectedIconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
      body: btnMenu(),
    );
  }
}
