import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_router/data/models/player.dart';
import 'package:flutter_bloc_router/presentation/bloc/counter_bloc.dart';
import 'package:flutter_bloc_router/presentation/bloc/football_player_bloc.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Player> players = [];
  GlobalKey<ScaffoldState> secondScreenKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //     context.read ไม่ทำให้วิดเจ็ตสร้างใหม่เมื่อสถานะของบล็อกเปลี่ยนแปลง
// BlocProvider.of อาจทำให้เกิดการสร้างใหม่ถ้าวิดเจ็ตติดตามการเปลี่ยนแปลงในสถานะของบล็อก
    context.read<FootballPlayerBloc>().add(const GetFootBallPlayers());
    setState(() {
      players = context.read<FootballPlayerBloc>().state.players;
    });
    // BlocProvider.of<FootballPlayerBloc>(context).add(
    //   const GetFootBallPlayers(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<FootballPlayerBloc>().add(
                        const AddFootBallPlayersEvent(),
                      );
                },
                child: const Text("Add Player"),
              ),
              // FloatingActionButton(
              //   onPressed: () {
              //     context.read<CounterBloc>().add(
              //           const IncrementEvent(),
              //         );
              //   },
              //   child: const Text("Increment"),
              // ),
            ]),
            Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  print('Bilding with state' + state.toString());
                  switch (state.status) {
                    case CounterStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case CounterStatus.success:
                      return Text('${state.counter}');
                    case CounterStatus.failure:
                      return const Text('Something went wrong');
                    default:
                      return const Text('0'); // inital
                  }
                },
              ),
            ),
            Expanded(
              child: BlocListener<FootballPlayerBloc, FootballPlayerState>(
                listener: (context, state) {
                  setState(() {
                    players = state.players;
                  });
                },
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(players[index].name!),
                      subtitle: Text(players[index].position!),
                    );
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: BlocBuilder<FootballPlayerBloc, FootballPlayerState>(
            //     builder: (context, state) {
            //       print('Bilding Football with state' + state.toString());
            //       switch (state.status) {
            //         case FootballPlayerStatus.loading:
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );

            //         case FootballPlayerStatus.success:
            //           return ListView.builder(
            //             itemCount: state.players.length + 1,
            //             itemBuilder: (context, index) {
            //               if (index < state.players.length) {
            //                 return ListTile(
            //                   title: Text(state.players[index].name!),
            //                   subtitle: Text(state.players[index].position!),
            //                 );
            //               } else {
            //                 return const CircularProgressIndicator();
            //               }
            //             },
            //           );
            //         case FootballPlayerStatus.failure:
            //           return const Text('Something went wrong');
            //         default:
            //           return const Text('0'); // inital
            //       }
            //     },
            //   ),
            // )
          ],
        ));
  }
}
