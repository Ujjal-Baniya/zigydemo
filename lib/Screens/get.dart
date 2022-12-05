import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List<User> users = [];

  Future<List<User>> getData() async {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data['data']) {
        User user =
            User(i['first_name'], i['last_name'], i['email'], i['avatar']);
        users.add(user);
      }
      return users;
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Data"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(snapshot.data![index].firstname.toString() +
                    snapshot.data![index].lastname.toString()),
                subtitle: Text(snapshot.data![index].email.toString()),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data![index].avatar),
                  radius: 20,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class User {
  final String firstname, lastname, email, avatar;
  User(this.firstname, this.lastname, this.email, this.avatar);
}
