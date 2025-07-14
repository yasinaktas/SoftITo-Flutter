import 'package:ders16/widgets/expansion_tile_page.dart';
import 'package:ders16/widgets/filter_menu_with_chips.dart';
import 'package:ders16/widgets/image_and_tabbar_page.dart';
import 'package:ders16/widgets/liste_ornek.dart';
import 'package:ders16/widgets/nested_tabbar_ornek.dart';
import 'package:ders16/widgets/pageview_page.dart';
import 'package:ders16/widgets/settings_expansion_menu.dart';
import 'package:ders16/widgets/simple_image_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyProject());
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  int bottomIndex = 0;
  var keyList = PageStorageKey("KeyListPage");
  var keyExpansion = PageStorageKey("KeyExpansionPage");
  var keySettings = PageStorageKey("SettingsPAge");
  late List<Widget> sayfalar;
  @override
  void initState() {
    super.initState();
    sayfalar = [
      ListeOrnek(listKey: keyList),
      ExpansionTilePage(expansionKey: keyExpansion),
      PageviewPage(),
      SimpleImageSlider(),
      SettingsExpansionMenu(settingsKey: keySettings),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tasarım Araçları"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300, height: 0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageAndTabbarPage()),
              );
            },
            icon: Icon(Icons.tab),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NestedTabbarOrnek()),
              );
            },
            icon: Icon(Icons.apps),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterMenuWithChips()),
              );
            },
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: sayfalar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigoAccent,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste"),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand_less_outlined),
            label: "Expansion",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Pageview"),
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow_rounded),
            label: "Img Slider",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
