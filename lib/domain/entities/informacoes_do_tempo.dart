import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/estado.dart';

class InformacoesDoTempo extends Equatable {
  final List<Estado> estados;

  const InformacoesDoTempo(this.estados);

  factory InformacoesDoTempo.fromJson(Map<String, dynamic> json) {
    var estadosJson =
        (json['estados'] as List<dynamic>).cast<Map<String, dynamic>>();
    List<Estado> estados =
        estadosJson.map((json) => Estado.fromJson(json)).toList();

    return InformacoesDoTempo(estados);
  }

  @override
  List<Object?> get props => [estados];
}
