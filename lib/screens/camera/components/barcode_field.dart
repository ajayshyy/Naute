import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';
import 'package:bar_code_reader/blocs/camera_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bar_code_reader/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class BarcodeTextField extends StatelessWidget {
  final String hintText, labelText;
  final IconData icon;
  final Stream<String> stream;
  final TextInputType type;

  const BarcodeTextField(
      {Key key,
      this.hintText,
      this.labelText,
      this.icon,
      this.stream,
      this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraBloc cameraBloc = BlocProvider.of<CameraBloc>(context);

    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<String> textStream) {
        return TextField(
          onChanged: (String text) =>
              cameraBloc.updateText(text, 1), //TODO: INSERT STATE TO CHANGE

          keyboardType: type,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              labelText: labelText,
              suffixIcon: Icon(icon),
              errorText: textStream.hasError ? textStream.error : null,
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 0.0),
                borderRadius: BorderRadius.circular(6.0),
              )),
        );
      },
    );
  }
}
