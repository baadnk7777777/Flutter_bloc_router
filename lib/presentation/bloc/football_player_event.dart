part of 'football_player_bloc.dart';

@immutable
abstract class FootballPlayerEvent extends Equatable {
  const FootballPlayerEvent();

  @override
  List<Object> get props => [];
}

class GetFootBallPlayers extends FootballPlayerEvent {
  const GetFootBallPlayers();
}

class AddFootBallPlayersEvent extends FootballPlayerEvent {
  const AddFootBallPlayersEvent();
}
