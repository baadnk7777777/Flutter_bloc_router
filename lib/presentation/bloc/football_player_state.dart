part of 'football_player_bloc.dart';

enum FootballPlayerStatus { initial, loading, success, failure }

class FootballPlayerState extends Equatable {
  final List<Player> players;
  final FootballPlayerStatus status;

  const FootballPlayerState({
    this.players = const [],
    this.status = FootballPlayerStatus.initial,
  });

  FootballPlayerState copyWith({
    List<Player>? players,
    FootballPlayerStatus? status,
  }) =>
      FootballPlayerState(
        players: players ?? this.players,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [players, status];
}
