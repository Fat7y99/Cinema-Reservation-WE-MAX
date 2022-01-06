import 'package:flutter/material.dart';

import '../const.dart';

class SeatComponent extends StatefulWidget {
  bool isReserved;
  int id;
  bool isSelected;
  Function reserve;

  SeatComponent({
    Key? key,
    required this.id,
    this.isSelected = false,
    this.isReserved = false,
    required this.reserve,
  }) : super(key: key);

  @override
  _SeatComponentState createState() => _SeatComponentState();
}

class _SeatComponentState extends State<SeatComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
          widget.reserve(widget.id);
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? kPimaryColor
                  : widget.isReserved
                      ? Colors.white
                      : null,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color: Colors.white, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
