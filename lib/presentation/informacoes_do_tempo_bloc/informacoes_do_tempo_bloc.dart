import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/entities/informacoes_do_tempo.dart';
import 'package:weather_app/domain/repositories/informacoes_do_tempo_repository.dart';

part 'informacoes_do_tempo_state.dart';
part 'informacoes_do_tempo_event.dart';

class InformacoesDoTempoBloc
    extends Bloc<InformacoesDoTempoEvent, InformacoesDoTempoState> {
  InformacoesDoTempoBloc(
    this.informacoesDoTempoRepository,
  ) : super(const InformacoesDoTempoNaoInicializado(null)) {
    on<InformacoesDoTempoCarregou>(_onInformacoesDoTempoCarregou);
  }

  final InformacoesDoTempoRepository informacoesDoTempoRepository;

  FutureOr<void> _onInformacoesDoTempoCarregou(
    InformacoesDoTempoCarregou event,
    Emitter<InformacoesDoTempoState> emit,
  ) async {
    try {
      emit(const InformacoesDoTempoCarregarEmProgresso(null));
      var informacoesDoTempo = await informacoesDoTempoRepository.get();
      emit(InformacoesDoTempoCarregarSucesso(informacoesDoTempo));
    } catch (e) {
      emit(const InformacoesDoTempoCarregarFalha(null));
    }
  }
}
