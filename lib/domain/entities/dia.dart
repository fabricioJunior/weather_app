import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/periodo.dart';

class Dia extends Equatable {
  final String nome;
  final List<Periodo> periodos;

  const Dia(this.nome, this.periodos);

  factory Dia.fromJson(String jsonKey, Map<String, dynamic> json) {
    var nome = jsonKey;
    var peridosJson =
        (json[jsonKey] as List<dynamic>).cast<Map<String, dynamic>>().first;
    var periodos = peridosJson.keys
        .map((key) =>
            Periodo.fromJson(key, (peridosJson[key] as List<dynamic>).cast()))
        .toList();
    return Dia(nome, periodos);
  }

  @override
  List<Object?> get props => [nome];
}
