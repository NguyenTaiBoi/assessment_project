import 'package:accessment_mobile_project/constant/ui_constant.dart';
import 'package:accessment_mobile_project/screen/business/business_view_model.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BusinessScreen extends GetView<BusinessViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              BusinessItem(
                context: context,
                icon: "assets/icons/icon_survey.png",
                title: "Create survey",
                onTap: () {
                  goTo(screen: "/createSurveyScreen");
                },
              ),
              BusinessItem(
                context: context,
                icon: "assets/icons/icon_chat_room.jpg",
                title: "Create chat room",
                onTap: () {},
              ),
              BusinessItem(
                context: context,
                icon: "assets/icons/icon_time_keeping.png",
                title: "Time-keeping",
                onTap: () {},
              ),
              BusinessItem(
                context: context,
                icon: "assets/icons/icon_report.png",
                title: "Reports",
                onTap: () {
                  goTo(screen: "/reportScreen");
                },
              ),
              BusinessItem(
                context: context,
                icon: "assets/icons/icon_report.png",
                title: "CERTIFICATE",
                onTap: () {},
              ),
              BusinessItem(
                context: context,
                icon: "assets/icons/icon_report.png",
                title: "Documents",
                onTap: () {
                  goTo(screen: "/ducumentScreen");
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        centerTitle: true,
        title: Text("Business"),
        automaticallyImplyLeading: false,
      );
}

class BusinessItem extends StatelessWidget {
  BusinessItem({
    Key key,
    @required this.context,
    @required this.icon,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final BuildContext context;
  final String icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Container(
          height: screenSize(context).height / 3.5,
          width: screenSize(context).width / 2.5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 5, offset: Offset(5, 3))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(icon),
                  Text(
                    title,
                    style: kDefaultTextStyle.copyWith(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
