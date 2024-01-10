import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_router/data/models/player.dart';

part 'football_player_event.dart';
part 'football_player_state.dart';

class FootballPlayerBloc
    extends Bloc<FootballPlayerEvent, FootballPlayerState> {
  FootballPlayerBloc() : super(const FootballPlayerState()) {
    on<GetFootBallPlayers>(_onGetFootBallPlayers);
    on<AddFootBallPlayersEvent>(_onAddFootBallPlayers);
  }

  Future<void> _onAddFootBallPlayers(
    AddFootBallPlayersEvent event,
    Emitter<FootballPlayerState> emit,
  ) async {
    emit(
      state.copyWith(status: FootballPlayerStatus.loading),
    );
    await Future.delayed(const Duration(seconds: 1));
    try {
      Player player = Player(
        name: 'Bank',
        position: 'Forward',
        club: 'Manchester United',
        country: 'Portugal',
        age: 21,
      );

      emit(state.copyWith(
          status: FootballPlayerStatus.success,
          players: List.from(state.players)..add(player)));
      print(state.players.length);
    } catch (e) {
      print(e);
      emit(
        state.copyWith(status: FootballPlayerStatus.failure),
      );
    }
  }

  Future<void> _onGetFootBallPlayers(
    GetFootBallPlayers event,
    Emitter<FootballPlayerState> emit,
  ) async {
    emit(
      state.copyWith(status: FootballPlayerStatus.loading),
    );

    try {
      await Future.delayed(const Duration(seconds: 1));
      String jsonString =
          await rootBundle.loadString('assets/jsons/football_player.json');
      List<Player> playersData = (jsonDecode(jsonString) as List<dynamic>)
          .map((data) => Player.fromJson(data))
          .toList();

      emit(state.copyWith(
        status: FootballPlayerStatus.success,
        players: playersData,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(status: FootballPlayerStatus.failure));
    }
  }
}
