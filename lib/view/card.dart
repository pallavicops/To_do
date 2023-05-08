import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key, required this.title, required this.body})
      : super(key: key);
  String title;
  String body;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        shadowColor: Colors.black,
        color: Color(0xFFCFF4F2),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${widget.title}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.body}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ));
  }
}
