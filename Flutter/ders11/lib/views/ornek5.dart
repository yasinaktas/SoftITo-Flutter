import 'package:ders11/models/user.dart';
import 'package:ders11/views/ornek5_detay.dart';
import 'package:flutter/material.dart';

class Ornek5 extends StatelessWidget {
  const Ornek5({super.key});

  @override
  Widget build(BuildContext context) {
    final String mainUrl = "resimler/";
    List<User> users = [
      User(name: "Sevil Aydın", imageUrl: "${mainUrl}1.png", tel: 5157661950),
      User(name: "Berke Özdemir", imageUrl: "${mainUrl}2.png", tel: 5257661953),
      User(name: "Zehra Gümüş", imageUrl: "${mainUrl}3.png", tel: 5354731952),
      User(name: "Aycan Mutlu", imageUrl: "${mainUrl}4.png", tel: 5457661950),
      User(name: "Serpil Ulus", imageUrl: "${mainUrl}5.png", tel: 5557661364),
      User(name: "Aydan Özdemir", imageUrl: "${mainUrl}6.png", tel: 5657661950),
      User(name: "Zeynep Akmar", imageUrl: "${mainUrl}7.png", tel: 5756941959),
      User(name: "Lütfü Sarı", imageUrl: "${mainUrl}8.png", tel: 5857661957),
      User(name: "Ece Ulus", imageUrl: "${mainUrl}9.png", tel: 5957628050),
      User(name: "Can Apaydın", imageUrl: "${mainUrl}10.png", tel: 5057447858),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView with Model"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: MyUserList(users: users),
    );
  }
}

class MyUserList extends StatefulWidget {
  final List<User> users;
  const MyUserList({super.key, required this.users});

  @override
  State<MyUserList> createState() => _MyUserListState();
}

class _MyUserListState extends State<MyUserList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.users.length,
        itemBuilder: (ctx, i) {
          return UserCard(user: widget.users[i]);
        },
      ),
    );
  }
}

class UserCard extends StatefulWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 85,
          alignment: Alignment.center,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Ornek5Detay(user: widget.user),
                ),
              );
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(widget.user.imageUrl),
            ),
            title: Text(widget.user.name),
            subtitle: Text("0${widget.user.tel}"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
