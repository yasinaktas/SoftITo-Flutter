import 'package:clone_bip_messenger/views/channels_page.dart';
import 'package:clone_bip_messenger/views/chats_page.dart';
import 'package:clone_bip_messenger/views/services_page.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  IconData _getFabIconForTab(int index) {
    switch (index) {
      case 0:
        return Icons.message;
      case 1:
        return Icons.explore_outlined;
      case 2:
        return Icons.campaign_outlined;
      default:
        return Icons.help;
    }
  }

  List<Widget> tabs = [ChatsPage(), ServicesPage(), ChannelsPage()];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text("Mesajlar"),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Image.asset("images/logo.png"),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.blue,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.blue,
                indicatorColor: Colors.blueAccent,
                tabs: [
                  Tab(text: "Sohbetler"),
                  Tab(text: "Servisler"),
                  Tab(text: "Kanallar"),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: CircleBorder(),
          elevation: 4,
          child: Icon(_getFabIconForTab(selectedIndex)),
        ),
        body: TabBarView(controller: _tabController, children: tabs),
      ),
    );
  }
}
