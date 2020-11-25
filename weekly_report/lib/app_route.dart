import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weekly_report/pages/report_list.dart';

import 'pages/settings_page.dart';

part 'app_route.freezed.dart';

@freezed
abstract class AppRoute with _$AppRoute {
  const factory AppRoute.settings() = SettingsRoute;
  const factory AppRoute.top() = TopRoute;
  const factory AppRoute.report(String id) = ReportRoute;

  // MaterialPageRoute route() => MaterialPageRoute(builder: (_) => router(this));
}

Widget router(AppRoute route) {
  if (route is SettingsRoute) {
    return SettingsPage(user: FirebaseAuth.instance.currentUser);
  } else if (route is TopRoute) {
    return ReportListPage();
  } else if (route is ReportRoute) {
    print(route.id);
    return Container();
  } else {
    throw Exception();
  }
}
