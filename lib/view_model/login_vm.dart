import 'dart:async';
import 'dart:convert';
 
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
 
import '../model/album_model.dart';
 
Future<bool> loginCheck() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
 
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var result = Album.fromJson(jsonDecode(response.body));
    return isLogin(result, await _prefs);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

bool isLogin(final Album _result, final SharedPreferences _prefs) {
  var user_list = _prefs.getKeys();
  return user_list.contains(_result.title);
}