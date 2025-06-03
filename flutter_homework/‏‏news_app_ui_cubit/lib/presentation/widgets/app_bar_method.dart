
import 'package:flutter/material.dart';

AppBar appBarMethod() {
    return AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
  }
