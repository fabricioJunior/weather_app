import 'package:weather_app/domain/entities/dia.dart';
import 'package:weather_app/domain/entities/estado.dart';
import 'package:weather_app/domain/entities/informacoes_do_tempo.dart';
import 'package:weather_app/domain/entities/periodo.dart';

InformacoesDoTempo fakeInformacoesDoTempo({
  List<Estado> estados = const [],
}) =>
    InformacoesDoTempo(estados);

Estado fakeEstado({
  String estado = 'estado',
  List<Dia> dias = const [],
}) =>
    Estado(estado, dias);

Dia fakeDia({String nome = 'dia', List<Periodo> periodos = const []}) => Dia(
      nome,
      periodos,
    );

Periodo fakePeriodo({
  String nome = 'nome',
  String tempo = 'tempo',
  int temperatura = 10,
}) =>
    Periodo(
      nome,
      tempo,
      temperatura,
    );
