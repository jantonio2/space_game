import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:spacegame/User/bloc/bloc_user.dart';
import 'package:spacegame/User/ui/signin_screen.dart';
import 'package:spacegame/space_menu.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Indio que usare un bloc genérico
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        //Mi screen inicial es el signin
        home: SignInScreen(),
        navigatorKey: key,
      ),
      //Indico el bloc que usare
      bloc: UserBloc(),
    );
  }
}