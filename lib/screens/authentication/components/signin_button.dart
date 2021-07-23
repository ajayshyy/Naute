import 'package:flutter/material.dart';
import 'package:bar_code_reader/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatelessWidget {

  final String text;

  final Function onPressed;

  final double borderRadius;

  final IconData icon;

  final Color backgroundColor, splashColor, textColor, iconColor;

  final Widget image;

  final double width, height;

  final Color borderColor;

  final bool gradient;
  final List<Color> gradientColors;

  const SignInButton({Key key, this.text = "Sign in", this.onPressed, this.borderRadius = 20, this.image, this.backgroundColor = Colors.white, this.splashColor = Colors.black, this.width = 500, this.height = 50, this.icon, this.textColor = Colors.black, this.iconColor = Colors.blue, this.gradient = false, this.gradientColors, this.borderColor = Colors.transparent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: key,
      onPressed: onPressed,
      splashColor: splashColor,
      elevation: 2,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          gradient: LinearGradient(
            colors: gradient ? gradientColors : [backgroundColor, backgroundColor]
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.grey,
              spreadRadius: 0
           )
          ]

        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
               child: Stack(
                 children: [
                   Align(
                     child: Text(
                       text, style: GoogleFonts.montserrat(
                         color: textColor,
                         fontSize: 16,
                         fontWeight: FontWeight.w400),
                     ),
                   ),
                   if(image == null)
                     new Align(
                         alignment: Alignment.centerLeft,
                         child: Padding(
                             padding: EdgeInsets.only(left: 15),
                             child:  Icon(
                               icon,
                               color: iconColor,
                               size: 20,
                             )
                         )
                     ),
                   if(image != null)
                     new Align(
                         alignment: Alignment.centerLeft,
                         child: Padding(
                             padding: EdgeInsets.only(left: 15),
                             child: image
                         )
                     )


                 ],
               ),
              ),
            ],
          )
        ),
      ),

    );
  }

}