import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/network/network_info.dart';
import 'package:rickandmorty/features/rickandmorty/data/datasource/person_remote_data_source.dart';
import 'package:rickandmorty/features/rickandmorty/data/repository/person_local_data_source.dart';
import 'package:rickandmorty/features/rickandmorty/domain/repository/person_repository.dart';
import 'package:rickandmorty/features/rickandmorty/domain/usecases/persons/get_char.dart';
import 'package:rickandmorty/features/rickandmorty/presentation/bloc/test_bloc.dart';
import 'package:rickandmorty/injection_container.dart' as di;

import 'features/rickandmorty/data/repository/person_repository_impl.dart';
import 'features/rickandmorty/presentation/screens/test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // GetPersonsUseCase getPersonsUseCase = GetPersonsUseCase(repository: PersonRepository);
  final NetworkInfo? networkInfo;

  const MyApp({Key? key, this.networkInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<TestBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TestScreen()));
        },
      ),
    );
  }
}
