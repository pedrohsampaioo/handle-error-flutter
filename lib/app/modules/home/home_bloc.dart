import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:handle_error/app/core/failures/failure.dart';
import 'package:meta/meta.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:handle_error/app/shared/services/post_service.dart';

class HomeBloc extends BlocBase {
  final PostService service;
  HomeBloc({@required this.service});

  StreamController _info$ = StreamController();
  Stream get output => _info$.stream;

  void getPost() async {
    await Task(() => service.getPosts())
        .attempt()
        .map(
          (either) => either.leftMap((obj) {
            try {
              return obj as Failure;
            } catch (e) {
              throw e;
            }
          }),
        )
        .run()
        .then(
          (value) => value.fold(
            (failure) => _info$.addError(failure),
            (data) => _info$.add(data),
          ),
        );
  }

  @override
  void dispose() {
    _info$.close();
    super.dispose();
  }
}
