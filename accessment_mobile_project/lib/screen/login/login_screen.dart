import 'package:accessment_mobile_project/bloc/auth/auth_bloc.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc authBloc;

  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _buildBody(context),
      backgroundColor: Colors.blueAccent,
      resizeToAvoidBottomInset: true,
    );
  }

  _buildBody(BuildContext context) => Center(
        child: Container(
          height: screenSize(context).height * 0.5,
          width: screenSize(context).width * 0.75,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 7)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextField(
                    hintText: "User name", controller: userController),
                SizedBox(
                  height: screenSize(context).height * 0.05,
                ),
                _buildTextField(
                    hintText: "Password", controller: passwordController),
                SizedBox(
                  height: screenSize(context).height * 0.05,
                ),
                TextButton(
                    onPressed: () =>
                        goTo(context: context, screen: "/mainScreen"),
                    child: Container(
                      width: screenSize(context).width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      );

  TextField _buildTextField(
      {String hintText, TextEditingController controller}) {
    return TextField(
      controller: controller,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
