import 'dart:async';
import 'dart:convert';

import 'package:flutter_app_bloc/data/post.dart';
import 'package:flutter_app_bloc/data/user.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return User("Stas", "Stasov");
  }

  Future<List<Post>> getPosts() async{
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
      final List<Post> fetchedPosts = [];
      final List<dynamic> postsData = json.decode(response.body);
      if (postsData == null) {
        return null;
      }else{
        for (var i = 0; i < postsData.length; i++) {
          final Post post = Post(
              userId: postsData[i]['userId'],
              id: postsData[i]['id'],
              title: postsData[i]['title'],
              body: postsData[i]['body']);
          fetchedPosts.add(post);
        }
        return fetchedPosts;
      }

  }
}
