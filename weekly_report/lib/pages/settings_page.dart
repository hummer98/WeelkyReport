import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weekly_report/models/profile.dart';
import 'package:weekly_report/widgets/waitable.dart';

class SettingsPage extends HookWidget {
  SettingsPage({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  final _formKey = GlobalKey<FormState>();
  final User user;

  @override
  Widget build(BuildContext context) {
    final profileFuture = useMemoized(() => Profile.get(user.uid));
    final snapshot = useFuture(profileFuture);
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: (!snapshot.hasData) ? Container() : _buildBody(snapshot.data),
    );
  }

  Widget _buildBody(Profile profile) {
    final state = useState(profile);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                leading: user.photoURL == null ? Icon(Icons.no_photography) : Image.network(user.photoURL),
                title: user.isAnonymous ? Text('ゲスト') : Text('${user.email}'),
                subtitle: Text('${user.uid}'),
              ),
              Divider(),
              SizedBox(height: 8),
              TextFormField(
                initialValue: state.value.twitterId,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Twitterのアカウント名', border: OutlineInputBorder()),
                onChanged: (value) {
                  state.value = state.value.copyWith(twitterId: value);
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                initialValue: state.value.noteId,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'noteのアカウント名', border: OutlineInputBorder()),
                onChanged: (value) {
                  state.value = state.value.copyWith(noteId: value);
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                initialValue: state.value.qiitaId,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'qiitaのアカウント名', border: OutlineInputBorder()),
                onChanged: (value) {
                  state.value = state.value.copyWith(qiitaId: value);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: state.value.zennId,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'zennのアカウント名', border: OutlineInputBorder()),
                onChanged: (value) {
                  state.value = state.value.copyWith(zennId: value);
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                child: Text('保存'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    state.value.save();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
