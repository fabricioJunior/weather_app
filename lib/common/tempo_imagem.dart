import 'package:flutter/widgets.dart';

class TempoImagem extends StatelessWidget {
  final String tempo;

  const TempoImagem({super.key, required this.tempo});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/${removerAcentos(tempo).toLowerCase()}.png',
      fit: BoxFit.fill,
      width: 80,
      height: 80,
    );
  }
}

String removerAcentos(String str) {
  var comAcento =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var semAcento =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < comAcento.length; i++) {
    str = str.replaceAll(comAcento[i], semAcento[i]);
  }

  return str;
}
