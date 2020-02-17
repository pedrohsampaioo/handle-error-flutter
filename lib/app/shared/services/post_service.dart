import 'dart:io';

import 'package:handle_error/app/core/failures/failure.dart';
import 'package:handle_error/app/shared/models/post_model.dart';
import 'package:handle_error/app/shared/repositories/http_client.dart';
import 'package:meta/meta.dart';

class PostService {
  FakeHttpClient repository;
  PostService({@required this.repository});

  Future<Post> getPosts() async {
    try {
      final data = await repository.fetch();
      return Post.fromJSON(data);
    } on SocketException {
      throw Failure(message: "No Internet!!!");
    } on HttpException {
      throw Failure(message: "Don't found!!!");
    } on FormatException {
      throw Failure(message: "Invalid format!!");
    }
  }
}
