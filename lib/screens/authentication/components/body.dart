import 'package:bar_code_reader/api/Authenticator.dart';
import 'package:bar_code_reader/api/storage/Storage.dart';
import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/screens/authentication/components/textfield_button.dart';
import 'package:bar_code_reader/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification.dart';


class Authentication_Body extends StatefulWidget {
  _Authentication_Body createState() => _Authentication_Body();
}

class _Authentication_Body extends State<Authentication_Body> {

  bool _visible = false;
  bool buttonDisabled = false;
  String authMessage;

  @override
  void initState() {
     _visible = false;
     buttonDisabled = false;
     authMessage = "";

     isLogged().then((value) {
       if(value)Navigator.pushReplacementNamed(context, "/camera");
     });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    AuthenticationBloc authenticationBody = BlocProvider.of<AuthenticationBloc>(
        context);

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(20),
      color: hexToColor("#FCFDFF"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          TextFieldButton(
            onChanged: authenticationBody.emailChanged,

            hintText: "Inserisci la tua email",
            labelText: "Email",
            obscureText: false,
            type: TextInputType.emailAddress,
            icon: Icons.email,
            stream: authenticationBody.emailStream,

          ),
          SizedBox(height: 10,),
          TextFieldButton(
            hintText: "Inserisci la tua password",
            labelText: "Password",
            obscureText: true,
            type: TextInputType.visiblePassword,
            icon: Icons.security,
            stream: authenticationBody.passwordStream,
            onChanged: authenticationBody.passwordChanged,

          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: Text("Password dimenticata?", style: GoogleFonts.montserrat(
              color: mainColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,),),
          ),
          SizedBox(height: 30,),
          Container(
              width: double.infinity, child:
              StreamBuilder<bool>(
                stream: authenticationBody.submitCheck,
                builder: (context, snapshot) =>
                RaisedButton(
                  elevation: 5,
                  padding: EdgeInsets.all(10),

                  //Recode this
                  onPressed: buttonDisabled | !snapshot.hasData ? null : () async {

                    setState(() {
                      buttonDisabled = true;
                    });
                    await authenticationBody.authenticate();
                    User user = authenticationBody.getUser();
                    String message = user.message;
                    int ret = int.parse(user.ret);

                    if (ret == 0) {
                      saveSession(user);
                      Navigator.pushReplacementNamed(context, "/camera");
                    }

                    setState(() {
                      authMessage = message;
                      _visible = true;
                    });
                    Future.delayed(Duration(milliseconds: 4000)).then((value) => {
                      setState(() {
                        _visible= false;
                        buttonDisabled = false;
                      })
                    });


                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  color: buttonDisabled? Colors.red : mainColor,

                  child: Text('Accedi', style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w500,)
                  ),

                )
              )
          ),
          Spacer(),
          Align(alignment: Alignment.bottomCenter,
            child: showNotification(),
          )

        ],
      ),

    );
  }

  Widget showNotification() {
    if(_visible) {
      return MyStatefulWidget(message: this.authMessage);
    } else {
      return SizedBox(height: 0,);
    }
  }
}