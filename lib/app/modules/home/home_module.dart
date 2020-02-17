import 'package:flutter_modular/flutter_modular.dart';
import 'package:handle_error/app/modules/home/home_bloc.dart';
import 'package:handle_error/app/modules/home/home_page.dart';
import 'package:handle_error/app/shared/repositories/http_client.dart';
import 'package:handle_error/app/shared/services/post_service.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FakeHttpClient()),
        Bind((i) => PostService(repository: i.get<FakeHttpClient>())),
        Bind((i) => HomeBloc(service: i.get<PostService>())),
      ];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, args) => HomePage())];
}
