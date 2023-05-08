import 'package:flutter/material.dart';
import 'package:to_do/view/card.dart';

import 'add_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return CardWidget(
                title: "Todo title",
                body: "I will cook in morning at 9 o`clock ",
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10,
            ),
            itemCount: 3,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5DDBE3),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCard(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
