import 'package:flutter/material.dart';

class AnimasyonYapilari extends StatefulWidget {
  const AnimasyonYapilari({super.key});

  @override
  State<AnimasyonYapilari> createState() => _AnimasyonYapilariState();
}

class _AnimasyonYapilariState extends State<AnimasyonYapilari>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 20,
      upperBound: 40,
    );
    controller.addListener(() {
      setState(() {
        debugPrint(controller.value.toString());
      });
    });
    controller.addStatusListener((status) {
      debugPrint("Durum: $status");
      /*if (status == AnimationStatus.completed) {
        controller.reverse().orCancel();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward().orCancel();
      }*/
    });

    //controller.forward();
    //controller.repeat();

    controller.forward(from: 20);
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
        backgroundColor: Colors.white,
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
            Text("Yasin Aktaş", style: TextStyle(fontSize: controller.value)),
          ],
        ),
      ),
    );
  }
}
