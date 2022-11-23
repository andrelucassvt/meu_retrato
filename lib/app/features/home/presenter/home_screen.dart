import 'package:flutter/material.dart';
import 'package:my_portrait/app/core/database/preference/preference_local_data.dart';
import 'package:my_portrait/app/features/local/presenter/local_screen.dart';
import 'package:my_portrait/app/features/remote/presenter/remote_screen.dart';
import 'package:my_portrait/app/features/tutorial/presenter/tutorial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pages = [const LocalScreen(), const RemoteScrenn()];

  _getPrimeiroAcesso() async {
    final result = await PreferenceLocalData.getPrimeiroAcesso();
    if (result) {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) => TutotialScreen(),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getPrimeiroAcesso();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pages[0];
    // return Scaffold(
    //   body: pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Local',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.cloud),
    //         label: 'Remote',
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: Colors.blueAccent,
    //     onTap: (value) {
    //       setState(() {
    //         _selectedIndex = value;
    //       });
    //     },
    //   ),
    // );
  }
}
