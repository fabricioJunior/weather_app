import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/tempo_imagem.dart';
import 'package:weather_app/domain/entities/estado.dart';
import 'package:weather_app/presentation/informacoes_do_tempo_bloc/informacoes_do_tempo_bloc.dart';

class SelecionarCidadePage extends StatelessWidget {
  SelecionarCidadePage({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: BlocBuilder<InformacoesDoTempoBloc,
                    InformacoesDoTempoState>(
                  builder: (context, state) {
                    if (state is InformacoesDoTempoCarregarEmProgresso) {
                      return const Row(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      );
                    }
                    if (state is InformacoesDoTempoCarregarFalha) {
                      return const Row(
                        children: [
                          Text(
                              'Falha: Não foi possível carregar as informações'),
                        ],
                      );
                    }
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(flex: 60, child: _backButton()),
                                const Expanded(
                                  flex: 40,
                                  child: Text(
                                    'Search for State',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Expanded(flex: 20, child: SizedBox())
                              ],
                            ),
                            const SizedBox(
                              height: 44,
                            ),
                            ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 32,
                                  );
                                },
                                controller: scrollController,
                                itemCount:
                                    state.informacoesDoTempo?.estados.length ??
                                        0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var estado =
                                      state.informacoesDoTempo?.estados[index];
                                  return _estadoCard(context, estado!);
                                })
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _estadoCard(BuildContext context, Estado estado) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                gradient: LinearGradient(
                  colors: [
                    const Color(
                      0xFF957DCD,
                    ).withOpacity(0.5),
                    const Color(0xFF523D7F).withOpacity(0.5),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 43, top: 27, bottom: 37),
                child: Row(
                  children: [
                    Text(
                      estado.estado,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: TempoImagem(tempo: estado.dias.first.periodos.first.tempo),
          )
        ],
      );

  Widget _backButton() => Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFF3C388A),
      ),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ));
}
