part of 'informacoes_do_tempo_bloc.dart';

abstract class InformacoesDoTempoState extends Equatable {
  final InformacoesDoTempo? informacoesDoTempo;

  const InformacoesDoTempoState(this.informacoesDoTempo);

  @override
  List<Object?> get props => [informacoesDoTempo];
}

class InformacoesDoTempoNaoInicializado extends InformacoesDoTempoState {
  const InformacoesDoTempoNaoInicializado(super.informacoesDoTempo);
}

class InformacoesDoTempoCarregarEmProgresso extends InformacoesDoTempoState {
  const InformacoesDoTempoCarregarEmProgresso(super.informacoesDoTempo);
}

class InformacoesDoTempoCarregarSucesso extends InformacoesDoTempoState {
  const InformacoesDoTempoCarregarSucesso(super.informacoesDoTempo);
}

class InformacoesDoTempoCarregarFalha extends InformacoesDoTempoState {
  const InformacoesDoTempoCarregarFalha(super.informacoesDoTempo);
}
