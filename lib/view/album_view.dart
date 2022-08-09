import 'package:flutter/material.dart';
 
import '../view_model/album_vm.dart';
import '../model/album_model.dart';
 
class MockApp extends StatefulWidget {
  const MockApp({Key? key}) : super(key: key);
 
  @override
  _MockApp createState() => _MockApp();
}
 
class _MockApp extends State<MockApp> {
  late Future<Album> futureAlbum;
 
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
 
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      );
  }
}