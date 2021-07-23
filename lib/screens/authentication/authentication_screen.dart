import 'package:flutter/material.dart';
import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';
import 'package:bar_code_reader/screens/authentication/components/body.dart';
import 'package:bar_code_reader/screens/registration/welcome_body.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../../utils.dart';


class AuthenticationScreen extends StatefulWidget {
  _Authentication createState() => _Authentication();
}


class _Authentication extends State<AuthenticationScreen> {

  AuthenticationBloc _authbloc;

  @override
  void initState() {
    super.initState();

    _authbloc = AuthenticationBloc();
  }

  @override
  void dispose() {
    _authbloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        bloc: AuthenticationBloc(),

        child: Scaffold(
          resizeToAvoidBottomPadding: false,

          appBar: GradientAppBar(
              title: Text('Natea'),
              gradient: LinearGradient(colors: [hexToColor("#57B8B7"), mainColor])
          ),
          //body: Authentication_Body(),
          body: Authentication_Body(),
        )
    );
  }
}