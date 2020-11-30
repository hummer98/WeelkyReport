import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weekly_report/models/model.dart';

class ReportDetailPage extends HookWidget {
  const ReportDetailPage({this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('${report.twitter}'),
      ),
    );
  }
}
