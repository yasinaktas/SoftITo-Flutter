import 'package:flutter/material.dart';

class PageviewPage extends StatefulWidget {
  const PageviewPage({super.key});

  @override
  State<PageviewPage> createState() => _PageviewPageState();
}

class _PageviewPageState extends State<PageviewPage> {
  bool yatayEksen = true;
  bool pageSnapping = true;
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: PageView(
                controller: controller,
                scrollDirection: yatayEksen ? Axis.horizontal : Axis.vertical,
                pageSnapping: pageSnapping,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.amber,
                    child: Center(child: Text("Sayfa 1")),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.indigo,
                    child: Center(child: Text("Sayfa 2")),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.purpleAccent,
                    child: Center(child: Text("Sayfa 3")),
                  ),
                ],
              ),
            ),
          ),
          ExpansionTile(
            shape: RoundedRectangleBorder(),
            title: const Text("Scroll Direction"),
            children: [
              SwitchListTile(
                title: Text("Yatay Eksen"),
                value: yatayEksen,
                onChanged: (value) {
                  setState(() {
                    yatayEksen = value;
                  });
                },
              ),
            ],
          ),
          ExpansionTile(
            shape: RoundedRectangleBorder(),
            title: const Text("Page Snapping"),
            children: [
              SwitchListTile(
                title: Text("Kaydırılabilir"),
                value: pageSnapping,
                onChanged: (value) {
                  setState(() {
                    pageSnapping = value;
                  });
                },
              ),
            ],
          ),
          ExpansionTile(
            shape: RoundedRectangleBorder(),
            title: const Text("Şuanki Sayfa"),
            childrenPadding: EdgeInsets.only(left: 16, right: 28, top: 12),
            children: [
              Row(
                children: [
                  Text("Mevcut Index", style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Text(currentIndex.toString(), style: TextStyle(fontSize: 24)),
                ],
              ),
            ],
          ),
          ExpansionTile(
            shape: RoundedRectangleBorder(),
            title: const Text("Sayfayı İlerlet"),
            childrenPadding: EdgeInsets.only(left: 16, right: 16, top: 12),
            children: [
              Row(
                children: [
                  Text("İleri / Geri", style: TextStyle(fontSize: 16)),
                  Spacer(),
                  TextButton(
                    onPressed: currentIndex == 0
                        ? null
                        : () {
                            controller.previousPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.decelerate,
                            );
                          },
                    child: Text("Geri"),
                  ),
                  TextButton(
                    onPressed: currentIndex == 2
                        ? null
                        : () {
                            controller.nextPage(
                              duration: Duration(seconds: 1),
                              curve: Curves.decelerate,
                            );
                          },
                    child: Text("İleri"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
