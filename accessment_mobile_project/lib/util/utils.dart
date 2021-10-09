import 'package:flutter/material.dart';

Size screenSize(BuildContext context) => MediaQuery.of(context).size;

Future goTo({@required String screen, @required BuildContext context}) async =>
    await Navigator.pushNamed(context, screen);
