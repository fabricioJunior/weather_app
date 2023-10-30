import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/remote_datasources/informacoes_do_tempo_remote_datasource.dart';

import '../../doubles/fakes.dart';
import '../../doubles/http.mocks.dart';

final Client client = MockClient();

late InformacoesDoTempoRemoteDatasource informacoesDoTempoRemoteDatasource;
void main() {
  setUp(() async {
    informacoesDoTempoRemoteDatasource = InformacoesDoTempoRemoteDatasource(
      client,
    );
    await _setupGet();
  });

  test('retorna informacoes do tempo', () async {
    var periodo1 = fakePeriodo(nome: 'manha', tempo: 'Sol', temperatura: 34);
    var periodo2 =
        fakePeriodo(nome: 'tarde', tempo: 'Nublado', temperatura: 28);
    var periodo3 = fakePeriodo(nome: 'noite', tempo: 'Chuva', temperatura: 26);
    var periodo4 = fakePeriodo(
      nome: 'manha',
      tempo: 'Nublado',
      temperatura: 34,
    );

    var dia1 = fakeDia(
      nome: 'segunda',
      periodos: [
        periodo1,
        periodo2,
        periodo3,
      ],
    );
    var dia2 = fakeDia(
      nome: 'terca',
      periodos: [
        periodo4,
      ],
    );
    var dia3 = fakeDia(
      nome: 'quarta',
      periodos: [],
    );
    var dia4 = fakeDia(
      nome: 'quinta',
      periodos: [],
    );
    var dia5 = fakeDia(
      nome: 'sexta',
      periodos: [],
    );
    var dia6 = fakeDia(
      nome: 'sabado',
      periodos: [],
    );
    var dia7 = fakeDia(
      nome: 'domingo',
      periodos: [],
    );

    var dias = [dia1, dia2, dia3, dia4, dia5, dia6, dia7];

    var estado1 = fakeEstado(estado: 'Ceará', dias: dias);
    var estados = [estado1];

    var informacoesDoTempo = fakeInformacoesDoTempo(estados: estados);

    expect(await informacoesDoTempoRemoteDatasource.get(), informacoesDoTempo);
  });
}

Future<void> _setupGet() async {
  var jsonFile = File('test/resources/informacoes_do_tempo.json');
  var jsonText = await jsonFile.readAsString();
  when(client.post(Uri.parse(
          'https://parseapi.back4app.com/parse/functions/informacoes_do_tempo')))
      .thenAnswer(
    (_) async => Response(
      jsonText,
      200,
    ),
  );
}
