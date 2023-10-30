import 'package:weather_app/data/remote_datasources/informacoes_do_tempo_remote_datasource.dart';
import 'package:weather_app/domain/entities/informacoes_do_tempo.dart';

class InformacoesDoTempoRepository {
  final InformacoesDoTempoRemoteDatasource informacoesDoTempoRemoteDatasource;

  InformacoesDoTempoRepository(this.informacoesDoTempoRemoteDatasource);

  Future<InformacoesDoTempo> get() {
    return informacoesDoTempoRemoteDatasource.get();
  }
}
