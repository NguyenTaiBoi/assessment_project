import 'package:accessment_mobile_project/screen/intro_screen/intro_view_model.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class InTroScreen extends GetView<IntroViewModel> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.orange[300],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: height / 2,
                width: width,
                child: Center(
                  child: Text(
                    "BADINCO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: height / 12,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.orange),
                          onPressed: () =>
                              goTo(context: context, screen: "/loginScreen"),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )),
                    ),
                    SizedBox(
                      height: height / 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: height / 12,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          child: Text(
                            "Chat",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 24),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build metho
  }
}
