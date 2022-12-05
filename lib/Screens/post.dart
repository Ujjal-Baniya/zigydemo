import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final Uri _apiUri = Uri.parse("https://reqres.in/api/users");
  String loaded = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Data"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _jobController,
                    decoration: const InputDecoration(
                      labelText: "Job",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final res = await http.post(_apiUri, body: {
                        "name": _nameController.text,
                        "job": _jobController.text,
                      });
                      print(res.body);
                      if (res.statusCode == 201) {
                        setState(() {
                          loaded =
                              "User created Sucessfully \n Name: ${_nameController.text} Job: ${_jobController.text}";
                        });
                      } else {
                        setState(() {
                          loaded = "User creation UnSucessfull";
                        });
                      }
                    },
                    child: const Text("Post Data"),
                  ),
                  Text(loaded)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
