import 'package:flutter/material.dart';
import 'package:bar_code_reader/routes.dart';
import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/bloc/block_provider_tree.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';

void main() {
  runApp(Natea());

}

class Natea extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<AuthenticationBloc>(bloc: AuthenticationBloc())
        ],

        child: MaterialApp(
          title: "Naute",
          initialRoute: "/login",
          routes: routes,
        )
    );

  }
}
