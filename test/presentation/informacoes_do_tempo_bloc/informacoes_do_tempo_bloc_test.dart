import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/domain/entities/informacoes_do_tempo.dart';
import 'package:weather_app/domain/repositories/informacoes_do_tempo_repository.dart';
import 'package:weather_app/presentation/informacoes_do_tempo_bloc/informacoes_do_tempo_bloc.dart';

import '../../doubles/fakes.dart';
import '../../doubles/repositories.mocks.dart';

final InformacoesDoTempoRepository informacoesDoTempoRepository =
    MockInformacoesDoTempoRepository();
late InformacoesDoTempoBloc informacoesDoTempoBloc;
void main() {
  setUp(() {
    informacoesDoTempoBloc = InformacoesDoTempoBloc(
      informacoesDoTempoRepository,
    );
  });
  //fakes
  var periodo1 = fakePeriodo(nome: 'manha', tempo: 'Sol', temperatura: 34);
  var periodo2 = fakePeriodo(nome: 'tarde', tempo: 'Nublado', temperatura: 28);
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

  var dias = [dia1, dia2];

  var estado1 = fakeEstado(estado: 'Ceará', dias: dias);
  var estados = [estado1];

  var informacoesDoTempo = fakeInformacoesDoTempo(estados: estados);
  blocTest<InformacoesDoTempoBloc, InformacoesDoTempoState>(
    'carregar informacoes do tempo',
    build: () => informacoesDoTempoBloc,
    setUp: () {
      _setupGet(informacoesDoTempo);
    },
    act: (bloc) => bloc.add(InformacoesDoTempoCarregou()),
    expect: () => [
      const InformacoesDoTempoCarregarEmProgresso(null),
      InformacoesDoTempoCarregarSucesso(informacoesDoTempo)
    ],
  );
}

void _setupGet(InformacoesDoTempo informacoesDoTempo) {
  when(informacoesDoTempoRepository.get())
      .thenAnswer((_) async => informacoesDoTempo);
}
