import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unnecessary_import
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/remote_datasources/informacoes_do_tempo_remote_datasource.dart';
import 'package:weather_app/domain/repositories/informacoes_do_tempo_repository.dart';
import 'package:weather_app/presentation/informacoes_do_tempo_bloc/informacoes_do_tempo_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:http_interceptor/http_interceptor.dart';

class Providers extends StatelessWidget {
  final Widget? child;

  const Providers({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return _datasourceProviders(
      context: context,
      child: _repositoriesProvider(
        context: context,
        child: _blocProviders(
          child: child ?? const SizedBox(),
          context: context,
        ),
      ),
    );
  }
}

MultiBlocProvider _blocProviders({
  required Widget child,
  required BuildContext context,
}) =>
    MultiBlocProvider(
      providers: [
        BlocProvider<InformacoesDoTempoBloc>(
          create: (context) => InformacoesDoTempoBloc(context.read())
            ..add(
              InformacoesDoTempoCarregou(),
            ),
        )
      ],
      child: child,
    );

MultiProvider _repositoriesProvider({
  required Widget child,
  required BuildContext context,
}) =>
    MultiProvider(
      providers: [
        RepositoryProvider<InformacoesDoTempoRepository>(
          create: ((context) => InformacoesDoTempoRepository(
                context.read(),
              )),
        ),
      ],
      child: child,
    );

MultiProvider _datasourceProviders({
  required Widget child,
  required BuildContext context,
}) =>
    MultiProvider(
      providers: [
        Provider<InformacoesDoTempoRemoteDatasource>(
          create: (context) => InformacoesDoTempoRemoteDatasource(
            _client(),
          ),
        ),
      ],
      child: child,
    );
//Melhorias: adicionar interceptos para controlar autenticação e tratar alguns erros
Client _client() => InterceptedClient.build(interceptors: [
      AuteticacaoHttpIntercepetor(),
    ]);

class AuteticacaoHttpIntercepetor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers.addAll({
      'X-Parse-Application-Id': 'nAX5VLA1WnL3qkzuYnlh4tzUqS9NJuKGL13L4vas',
      'X-Parse-REST-API-Key': '3Q8wzFGU6isxalfOyagYkz2bu0lCTcrtgJ7Q4iD7',
      'X-Parse-Revocable-Session': '1'
    });
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    return response;
  }
}
