import 'package:flutter/material.dart';
import 'package:flutter_horario/screens/home_page.dart';
import 'package:flutter_horario/state/state.dart';
import 'package:flutter_horario/reducers/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';


void main() async{

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  // Load initial state
  final initialState = await persistor.load();
  print("Initial state: $initialState");
  final store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [persistor.createMiddleware()],
  );

  runApp(FlutterHorarioApp(
    store: store,
  ));
}

class FlutterHorarioApp extends StatelessWidget {

  final Store<AppState> store;

  FlutterHorarioApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) => StoreProvider(
    store: store,
    child: MaterialApp(
      title: 'Flutter Horario',
      theme: ThemeData(
          primaryColorLight: Colors.white,
          primaryColorDark: Color(0xFF171b21),
          primaryColor: Colors.white,
          textTheme: TextTheme(
//          display4,
//          display3,
//          display2,
//          display1,
//          headline,
            title: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w600),
            subhead: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w500),
            body2: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w400),
            body1: TextStyle(fontFamily: 'Manrope'),
//          caption,
            button: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w600),
//          subtitle,
//          overline,
          )
      ),
      home: HomePage(),
    ),
  );
}




