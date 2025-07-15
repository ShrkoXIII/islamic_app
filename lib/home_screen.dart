import 'package:flutter/material.dart';
import 'package:islamic_app/taps/hadeeth/hadeth_Tap.dart';
import 'package:islamic_app/taps/quran/quran_tap.dart';
import 'package:islamic_app/taps/radio/radio_tap.dart';
import 'package:islamic_app/taps/sebha/sebha_tap.dart';
import 'package:islamic_app/taps/settings/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routename = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    Setting()
  ];
  int selected_index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/default_bg.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("إسلامي"),
        ),
        body: taps[selected_index],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selected_index,
            onTap: (index) {
              selected_index = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: 'quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png'),
                  ),
                  label: 'hadeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png'),
                  ),
                  label: 'sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png'),
                  ),
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: 'settings'),
            ]),
      ),
    );
  }
}
