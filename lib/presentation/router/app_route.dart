import 'package:flutter/material.dart';
import 'package:flutter_bloc_router/presentation/bloc/counter_bloc.dart';
import 'package:flutter_bloc_router/presentation/bloc/football_player_bloc.dart';
import 'package:flutter_bloc_router/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_router/presentation/screens/second_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterBloc _counterBloc = CounterBloc();
  final FootballPlayerBloc _footballPlayerBloc = FootballPlayerBloc();
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterBloc,
                  child: const HomeScreen(),
                ));

      case '/second':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _footballPlayerBloc,
              ),
              BlocProvider.value(
                value: _counterBloc,
              ),
            ],
            child: const SecondPage(),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    // close bloc.
  }
}
