import 'package:flutter/material.dart';

class AnimasyonYapilari extends StatefulWidget {
  const AnimasyonYapilari({super.key});

  @override
  State<AnimasyonYapilari> createState() => _AnimasyonYapilariState();
}

class _AnimasyonYapilariState extends State<AnimasyonYapilari>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;
  late Animation animation3;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    controller.addListener(() {
      setState(() {
        debugPrint(controller.value.toString());
      });
    });
    controller.addStatusListener((status) {
      debugPrint("Durum: $status");
      /*if (status == AnimationStatus.completed) {
        controller.reverse().orCancel;
      } else if (status == AnimationStatus.dismissed) {
        controller.forward().orCancel;
      }*/
    });
    //animation = Tween<double>(begin: 20,end: 50).animate(controller);
    animation = ColorTween(
      begin: Colors.amber,
      end: Colors.green,
    ).animate(controller);

    animation2 = AlignmentTween(
      begin: Alignment(-1, -1),
      end: Alignment(1, 1),
    ).animate(controller);

    animation3 = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    //controller.forward();
    //controller.repeat();

    controller.forward();
    //controller.reverse(from: 50);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: animation.value,
        foregroundColor: Colors.white,
        title: Text("Animasyonlar"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade200),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: animation2.value,
                child: Text(
                  "Yasin Aktaş",
                  style: TextStyle(fontSize: animation3.value * 36),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
