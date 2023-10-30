import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/dia.dart';

class Estado extends Equatable {
  final String estado;
  final List<Dia> dias;

  const Estado(this.estado, this.dias);

  factory Estado.fromJson(Map<String, dynamic> json) {
    var estado = json['estado'];

    var diasJson =
        (json['dias'] as List<dynamic>).cast<Map<String, dynamic>>().first;

    var dias = diasJson.keys.map((key) => Dia.fromJson(key, diasJson)).toList();

    return Estado(estado, dias);
  }

  @override
  List<Object?> get props => [estado, dias];
}
