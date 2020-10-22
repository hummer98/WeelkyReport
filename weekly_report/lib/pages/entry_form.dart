import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EntryForm extends StatefulWidget {
  EntryForm({Key key, this.user}) : super(key: key);

  final User user;
  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  /// 累積投稿数
  int postCount = 0;
  int likesCount = 0;
  int pvCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Text('累積投稿数'),
            trailing: SizedBox(
              width: 100,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    postCount = int.parse(text);
                  });
                },
              ),
            ),
          ),
          ListTile(
            leading: Text('Likes'),
            trailing: SizedBox(
              width: 100,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    likesCount = int.parse(text);
                  });
                },
              ),
            ),
          ),
          ListTile(
            leading: Text('PV'),
            trailing: SizedBox(
              width: 100,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    pvCount = int.parse(text);
                  });
                },
              ),
            ),
          ),
          RaisedButton(
            child: Text('投稿!'),
            onPressed: () async {
              print('$postCount, $likesCount, $pvCount');
              // /{uid}/document -> { 'pv': 20 ... }
              await FirebaseFirestore.instance
                  .doc('users/${widget.user.uid}')
                  .set({
                'postCount': postCount,
                'likesCount': likesCount,
                'pvCount': pvCount
              });
            },
          )
        ],
      ),
    );
  }
}
