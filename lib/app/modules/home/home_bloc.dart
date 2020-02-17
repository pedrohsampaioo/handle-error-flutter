import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:handle_error/app/shared/services/post_service.dart';

class HomeBloc extends BlocBase {
  final PostService service;
  HomeBloc({@required this.service});
  
  StreamController _info$ = StreamController();
  Stream get output => _info$.stream;

  void getPost() async {
    try {
      final data = await service.getPosts();
      _info$.add(data);
    } catch (e) {
      _info$.addError(e);
    }
  }

  @override
  void dispose() {
    _info$.close();
    super.dispose();
  }
}
