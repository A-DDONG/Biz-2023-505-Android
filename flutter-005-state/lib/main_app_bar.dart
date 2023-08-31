import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "집에가세요",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 90, 90, 1.0),
      centerTitle: true,
      elevation: 0.0,
      actions: [
        IconButton(
            onPressed: () {
              const snackBar = SnackBar(
                content: Text("집에가세요"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(
              Icons.person,
            )),
      ],
    );
