import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_router/presentation/bloc/counter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> homeScreenkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenkey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("hello HomeScreen"),
            MaterialButton(
              color: Colors.redAccent,
              child: const Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/second',
                  arguments: homeScreenkey,
                );
              },
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(
                      const IncrementEvent(),
                    );
              },
              child: const Text("Increment"),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}

class $ {}
