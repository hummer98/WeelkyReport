import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
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
            } else if (snapshot.hasError) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                debugPrint('${snapshot.error}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${snapshot.error}')),
                );
              });
              return Container();
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final report = snapshot.data[index];
                  final createdAt = DateFormat('yyyy/MM/dd HH:mm', 'ja_JP').format(report.createdAt);
                  return ListTile(
                    title: Text(report.id),
                    subtitle: Text('作成日: $createdAt'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => router(ReportRoute(report))),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return Divider();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
