import 'package:flutter/material.dart';
import 'package:flutter_12/service_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'business/functions.dart';
import 'business/main_bloc.dart';

void main() {
  initializeServices();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = GetIt.I.get<MainBloc>();
    _mainBloc.add(const MainBlocEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return Provider<MainBloc>(
      create: (_) => _mainBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homework 12',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }

  @override
  void dispose() {
    _mainBloc.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String result = GetIt.I.get<SimpleFunctions>().gText();
    late int count = 0;

    void changeData() {
      count++;
      result = GetIt.I.get<SimpleFunctions>().gText(count);
    }

    return StreamBuilder<MainBlocState>(
      stream: context.read<MainBloc>().state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data;
          return state!.map<Widget>(
            loading: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Homework 12'),
              ),
              body: const Center(
                child: Text('Инициализация'),
              ),
            ),
            loaded: (state) => Scaffold(
              appBar: AppBar(
                title: const Text('Homework 12'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Тестирование GetIt:', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(result),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    const Text('Тестирование Freezed:', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(state.userData.name),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  changeData();
                  context
                      .read<MainBloc>()
                      .add(MainBlocEvent.setUser(userId: state.userData.id + 1));
                  },
                label: const Text('Добавить Data'),
                icon: const Icon(Icons.add),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
