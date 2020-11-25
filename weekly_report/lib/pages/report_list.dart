import 'package:flutter/material.dart';
import 'package:weekly_report/app_route.dart';
import 'package:weekly_report/models/report.dart';

class ReportListPage extends StatelessWidget {
  ReportListPage({this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => router(AppRoute.settings())),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Report>>(
          stream: Report.stream(userId: userId),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('hoge'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
