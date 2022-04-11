import 'package:flutter/material.dart';

appbar(
  BuildContext context,
) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        )),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          "Flutter",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
      ],
    ),
    centerTitle: true,
    actions: const [
      Opacity(
        child: Icon(
          Icons.abc,
          color: Colors.black,
          size: 60,
        ),
        opacity: 0,
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
