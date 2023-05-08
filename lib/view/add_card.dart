import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: TextField(
              controller: _titleController,
              autofocus: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 30),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '_ _ _ _ _ _',
              ),
            ),
          ),
          Container(
            child: TextField(
              controller: _bodyController,
              autofocus: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 30),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '_ _ _ _ _ _',
              ),
            ),
          )
        ],
      ),
    );
  }
}
