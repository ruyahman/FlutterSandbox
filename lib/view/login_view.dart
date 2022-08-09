import 'package:flutter/material.dart';
 
import '../view_model/login_vm.dart';
import '../view/auth_view.dart';
import '../model/album_model.dart';
import '../util/shared_preferences_util.dart';
 
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  _MyAppState createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  late Future<bool> futureLoginCheck;
 
  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
    futureLoginCheck = loginCheck();
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<bool>(
            future: futureLoginCheck,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var _islogin = snapshot.data!;
                if (_islogin) {
                  // 遷移
                  return Text(_islogin.toString());
                }
                // 遷移
                return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: AuthPage(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}