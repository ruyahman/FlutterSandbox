import 'package:flutter/material.dart';

import '../view/album_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ユーザ名を入力してください (dummy'
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'パスワードを入力してください (dummy'
                  ),
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MockApp()
                    ));
                  },
                  child: Text('ログイン')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}