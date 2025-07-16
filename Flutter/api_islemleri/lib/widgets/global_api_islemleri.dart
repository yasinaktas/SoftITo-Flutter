import 'package:api_islemleri/model/user_model.dart';
import 'package:api_islemleri/widgets/user_detay.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GlobalApiIslemleri extends StatefulWidget {
  const GlobalApiIslemleri({super.key});

  @override
  State<GlobalApiIslemleri> createState() => _GlobalApiIslemleriState();
}

class _GlobalApiIslemleriState extends State<GlobalApiIslemleri> {
  late Future<List<UserModel>> userList;
  @override
  void initState() {
    super.initState();
    userList = getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Global Api"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Colors.grey.shade300, height: 0),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
          future: userList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myUserList = snapshot.data!;
              return ListView.builder(
                itemCount: myUserList.length,
                itemBuilder: (context, index) {
                  var user = myUserList[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetay(userModel: user),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 20,
                      child: Text(user.id.toString()),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<List<UserModel>> getUserList() async {
    try {
      var response = await Dio().get(
        "https://jsonplaceholder.typicode.com/users",
      );
      List<UserModel> userList = [];
      if (response.statusCode == 200) {
        userList = (response.data as List)
            .map((userMap) => UserModel.fromJson(userMap))
            .toList();
      }
      return userList;
    } on DioException catch (e) {
      return Future.error(e.toString());
    }
  }
}
