import 'package:accessment_mobile_project/screen/report/report_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ReportScreen extends GetView<ReportViewModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _buildBody(context),
        backgroundColor: Colors.blueAccent,
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  _buildBody(BuildContext context) => SfSparkBarChart();
}
