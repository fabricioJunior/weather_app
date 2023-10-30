import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_app/domain/entities/informacoes_do_tempo.dart';

class InformacoesDoTempoRemoteDatasource {
  final Client client;

  InformacoesDoTempoRemoteDatasource(this.client);

  Future<InformacoesDoTempo> get() async {
    var response = await client.post(
      Uri.parse(
        'https://parseapi.back4app.com/parse/functions/informacoes_do_tempo',
      ),
    );

    var json = jsonDecode(response.body) as Map<String, dynamic>;

    return InformacoesDoTempo.fromJson(json['result']);
  }
}
