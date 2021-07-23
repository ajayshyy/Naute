import 'package:flutter/material.dart';
import 'package:bar_code_reader/screens/authentication/components/signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, top: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("logo.png", height: 120,),
              ]
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to ", style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: hexToColor("#3F3F3F"),
                )),
                Text("Glimpse", style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: hexToColor("#FC287A"),
                )),
                Text(".", style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: hexToColor("#3F3F3F"),
                )),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Please be sure to follow our rules.", style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: hexToColor("#3F3F3F"),
                )),

                ],
              ),
            SizedBox(height: 70,),
            Text("Be respectful.", style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: hexToColor("#3F3F3F"),
            )),
            SizedBox(height: 7,),

            Text("Respect others and their thoughts. We do not tolerate offensive or istigative words. ",
                overflow: TextOverflow.clip,style: GoogleFonts.montserrat(
                  fontSize: 15,

                  fontWeight: FontWeight.w400,
                  color: hexToColor("#3F3F3F"),
                )),
            SizedBox(height: 30,),
            Text("Be proactive.", style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: hexToColor("#3F3F3F"),
            )),
            SizedBox(height: 7,),

            Text("Always report bad behaviour or anything against the rules. ",
                overflow: TextOverflow.clip,style: GoogleFonts.montserrat(
                  fontSize: 15,

                  fontWeight: FontWeight.w400,
                  color: hexToColor("#3F3F3F"),
                )),
            SizedBox(height: 30,),
            Text("Be proactive.", style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: hexToColor("#3F3F3F"),
            )),
            SizedBox(height: 7,),

            Text("Always report bad behaviour or anything against the rules. ",
                overflow: TextOverflow.clip,style: GoogleFonts.montserrat(
                  fontSize: 15,

                  fontWeight: FontWeight.w400,
                  color: hexToColor("#3F3F3F"),
                )),

              ],

        ),
      ),
    );

  }



}