import 'package:flutter/foundation.dart';
import 'package:resful_app/src/model/model.dart';
import 'package:http/http.dart' as http;

class FetchPost {
  Future<List<Post>?> getPost() async {
    try {
      var client = http.Client();
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        return PostFromJson(response.body);
      } else {
        debugPrint(response.statusCode.toString());
      }
      ;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
