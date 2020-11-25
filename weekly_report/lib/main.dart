import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weekly_report/pages/report_list.dart';

import 'app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final credential = await firebaseAuth.signInAnonymously();
  print(credential.user);
  runApp(MyApp(
    user: credential.user,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute(builder: (_) => router(routeSettings as AppRoute));
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReportListPage(userId: user.uid),
    );
  }
}
