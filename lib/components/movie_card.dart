import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageLink;

  final String title;

  final Function callBack;

  final bool active;

  const MovieCard(
      {Key? key,
      required this.title,
      required this.imageLink,
      required this.callBack,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: InkWell(
            onTap: callBack as void Function()?,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(imageLink),
            ),
          ),
        ),
        Text(active ? title : '',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ],
    );
  }
}
