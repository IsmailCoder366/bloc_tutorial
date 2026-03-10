import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_tutorial/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {

  Future<List<PostModel>> fetchPost() async{
    try{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if(response.statusCode == 200){
      final List body = json.decode(response.body); // convert data in list form
      return body
          .map((e) => PostModel.fromJson(e)) // convert json to model class
          .toList(); // show all the data in list
    }
    }on SocketException {
      throw Exception('error while fetching data');
    }on TimeoutException{
      throw Exception('error while fetching data');
    }
    throw Exception('error while fetching data');
  }
}