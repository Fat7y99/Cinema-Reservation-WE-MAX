import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageLink;

  final String title;

  final Function callBack;

  final bool active;

  final double height;

  final double width;

  const MovieCard({
    required this.title,
    required this.imageLink,
    required this.callBack,
    required this.active,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: callBack as void Function()?,
          child: SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.network(imageLink),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
