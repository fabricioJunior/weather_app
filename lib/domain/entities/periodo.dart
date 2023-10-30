import 'package:equatable/equatable.dart';

class Periodo extends Equatable {
  final String nome;
  final String tempo;
  final int temperatura;

  const Periodo(this.nome, this.tempo, this.temperatura);

  factory Periodo.fromJson(
      String jsonKey, List<Map<String, dynamic>> listJson) {
    var informacoesJson = listJson.first;
    var nome = jsonKey;

    var tempo = informacoesJson['tempo'];
    int temperatura = 0;
    if (informacoesJson['graus'] is String ||
        informacoesJson['graus'] == null) {
      temperatura = int.tryParse(informacoesJson['graus'] ?? '') ?? 0;
    } else {
      temperatura = informacoesJson['graus'];
    }
    return Periodo(nome, tempo, temperatura);
  }
  @override
  List<Object?> get props => [nome, tempo, temperatura];
}
