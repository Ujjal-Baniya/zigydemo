import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zigy demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/PostData");
                },
                child: const Text("Post")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/GetData");
                },
                child: const Text("Get")),
          ],
        ),
      ),
    );
  }
}
