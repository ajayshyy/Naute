import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bar_code_reader/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldButton extends StatelessWidget {

  final String hintText, labelText;
  final IconData icon;
  final Stream<String> stream;
  final TextInputType type;
  final obscureText;
  final onChanged;

  const TextFieldButton({Key key,this.onChanged, this.obscureText, this.hintText, this.labelText, this.icon, this.stream, this.type}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBody = BlocProvider.of<AuthenticationBloc>(context);
    return StreamBuilder(

      stream: stream,
      builder: (context, AsyncSnapshot<String> textStream) {

        return Theme( data: Theme.of(context)
            .copyWith(primaryColor: mainColor,),child: TextField(

          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: type,
          decoration: InputDecoration(
            hintText: hintText,

            hintStyle: TextStyle(
                color: Colors.grey
            ),
            labelText: labelText,
            suffixIcon: Icon(icon),
            errorText: textStream.hasError? textStream.error : null, //TODO:AUTHENTICATION
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.redAccent, width: 0.0),
              borderRadius: BorderRadius.circular(6.0),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: mainColor
              )
            ),

          ),
        ));
      },
    );
  }

}