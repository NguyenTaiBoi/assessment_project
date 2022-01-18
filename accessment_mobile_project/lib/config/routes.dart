import 'package:accessment_mobile_project/screen/accessment/accessment_binding.dart';
import 'package:accessment_mobile_project/screen/accessment/accessment_screen.dart';
import 'package:accessment_mobile_project/screen/business/business_binding.dart';
import 'package:accessment_mobile_project/screen/business/business_screen.dart';
import 'package:accessment_mobile_project/screen/certificate/certificate_binding.dart';
import 'package:accessment_mobile_project/screen/certificate/certificate_screen.dart';
import 'package:accessment_mobile_project/screen/create_survey/survey_binding.dart';
import 'package:accessment_mobile_project/screen/create_survey/suvey_screen.dart';
import 'package:accessment_mobile_project/screen/dash_board/dash_board_binding.dart';
import 'package:accessment_mobile_project/screen/dash_board/dash_board_screen.dart';
import 'package:accessment_mobile_project/screen/ducument/document_binding.dart';
import 'package:accessment_mobile_project/screen/ducument/document_view_model.dart';
import 'package:accessment_mobile_project/screen/file/file_binding.dart';
import 'package:accessment_mobile_project/screen/file/file_screen.dart';
import 'package:accessment_mobile_project/screen/intro_screen/intro_binding.dart';
import 'package:accessment_mobile_project/screen/intro_screen/intro_screen.dart';
import 'package:accessment_mobile_project/screen/login/login_binding.dart';
import 'package:accessment_mobile_project/screen/login/login_screen.dart';
import 'package:accessment_mobile_project/screen/main/main_binding.dart';
import 'package:accessment_mobile_project/screen/main/main_screen.dart';
import 'package:accessment_mobile_project/screen/notification/notification_binding.dart';
import 'package:accessment_mobile_project/screen/notification/notification_screen.dart';
import 'package:accessment_mobile_project/screen/setting/setting_binding.dart';
import 'package:accessment_mobile_project/screen/setting/setting_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Rounter {
  static final route = [
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/loginScreen",
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/mainScreen",
        page: () => MainScreen(),
        binding: MainBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/accessmentScreen",
        page: () => AccessmentScreen(),
        binding: AccessmentBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/buinessScreen",
        page: () => BusinessScreen(),
        binding: BusinessBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/dashBoardScreen",
        page: () => DashBoardScreen(),
        binding: DashBoardBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/introScreen",
        page: () => InTroScreen(),
        binding: IntroBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/notificationScreen",
        page: () => NotificationScreen(),
        binding: NotificationBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/settingScreen",
        page: () => SettingScreen(),
        binding: SettingBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/certificateScreen",
        page: () => CertificateScreen(),
        binding: CertificateBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/ducumentScreen",
        page: () => DocumentScreen(),
        binding: DocumentBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/createSurveyScreen",
        page: () => CreateSurveyScreen(),
        binding: CreateSurveyBinding()),
    GetPage(
        transitionDuration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
        name: "/fileScreen",
        page: () => FileScreen(),
        binding: FileBinding()),
  ];
}
