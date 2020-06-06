import 'package:flutter/material.dart';

import 'form.dart';

void main()
{

  runApp(MaterialApp(
    title: "Form Operations",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),

    home: form(),
  )
  );
}