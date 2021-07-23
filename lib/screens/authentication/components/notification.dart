import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bar_code_reader/utils.dart';
import 'package:google_fonts/google_fonts.dart';



/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  final String message;

  const MyStatefulWidget({Key key, this.message}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _animation;


  @override
  void dispose() {
    _animation = null;
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    _controller..addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
        Future.delayed(Duration(milliseconds: 3000),(){
          _controller.reverse().then((value) {

            setState(() {
              dispose();
            });
          });
        });
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,

      child: Container(
        height: 70,
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(widget.message, textAlign: TextAlign.center, style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w500,)
          ),
        )
      ),
    );
  }
}
