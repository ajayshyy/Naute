import 'file:///C:/Users/ale/AndroidStudioProjects/bar_code_reader/lib/screens/camera/components/camera_button/partial_painter.dart';
import 'package:bar_code_reader/screens/camera/components/camera_button/partial_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bar_code_reader/bloc/bloc_provider.dart';
import 'package:bar_code_reader/blocs/authentication_bloc.dart';
import 'package:bar_code_reader/screens/authentication/components/body.dart';
import 'package:bar_code_reader/screens/registration/welcome_body.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bar_code_reader/utils.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CameraScreen extends StatefulWidget {

  _Camera createState() => _Camera();
}

class _Camera extends State<CameraScreen> {

  String _childBarcode = 'Unknown';
  String _motherBarcode = 'Unknown1';

  int currentState = 1;
  //1: Madre, 2: Figlio

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
        bloc: AuthenticationBloc(),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: GradientAppBar(
              title: Text('Inquadra il barcode'),
              gradient: LinearGradient(colors: [hexToColor("#57B8B7"), mainColor])
          ),
          //body: Authentication_Body(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/screening_bracelet.jpg"),
                fit: BoxFit.cover,
              )
            ),
            child: Center(
              child: Column(
                children: [

                  Expanded(flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Text("Scansiona il bracciale", textAlign: TextAlign.center, style: GoogleFonts.montserrat(
                            color: mainColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,),),
                          SizedBox(height: 10,),
                          Text(stateToName(), textAlign: TextAlign.center, style: GoogleFonts.montserrat(
                            color: mainColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,),),
                        ],
                      )
                    ),
                  ),

                  Expanded(flex: 1, child:
                    Center(
                      child:  PartialBorderContainer(
                          strokeWidth: 15,
                          gradient: LinearGradient(colors: [hexToColor("#59B9B7"), hexToColor("#4BC1B3"), mainColor]),
                          child: Image(image: AssetImage("assets/barcode.png") ,height: 150, width: 200,),

                          onPressed: () => scanBarcodeNormal()
                      ),
                    ),),
                  Expanded(flex: 1, child:
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(opacity: 0.7, child:
                          RaisedButton(onPressed: () => insertCode(context),
                            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: mainColor)
                            ),
                            child: Text(
                              "Inserisci manualmente il codice", style: GoogleFonts.montserrat(
                            color: mainColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,)
                          ),),),
                        SizedBox(height: 20,),

                        Row(
                          children: [
                            Expanded(flex: 3, child: Container(),),

                            SizedBox(
                              width: 50,
                              height: 50,
                              child: RawMaterialButton(
                                elevation: 2,
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                                child: Text(
                                  '1', style: GoogleFonts.montserrat(
                                    color: _motherBarcode.contains("Unknown")? Colors.red : mainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                                ),
                                onPressed: () => changeState(1),
                              ),
                            ),
                            Container(
                                height:1.1,
                                width:50.0,
                                color:Colors.white),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: RawMaterialButton(
                                elevation: 2,
                                fillColor: Colors.white,
                                shape: CircleBorder(),
                                child: Text(
                                  '2', style: GoogleFonts.montserrat(
                                    color: _childBarcode.contains("Unknown")? Colors.red : mainColor, // Color(0xff5270aa)
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                                ),
                                onPressed: () => changeState(2),

                              ),
                            ),
                            Container(
                                height:1.1,
                                width:50.0,
                                color:Colors.white),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: RawMaterialButton(
                                elevation: 2,
                                fillColor: Colors.white,
                                shape: CircleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: Colors.white
                                  ),

                                ),
                                onPressed: () => changeState(2),
                                child: Icon(
                                  checkBarcode() ?  Icons.lock_open_outlined : Icons.lock_outline  ,
                                  color: checkBarcode() ? mainColor : Colors.red, size: 30,),

                              ),
                            ),
                            Expanded(flex: 3, child: Container(),)

                          ],
                        ),
                        SizedBox(height: 40,)
                      ],
                    ),
                  ),)
                ],
              ),
            )
          ),
        )
    );
  }

  void insertCode(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final controller = TextEditingController();
          final emailField = TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                icon: Icon(Icons.qr_code),
                labelText: 'Inserisci il codice',
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(borderSide: BorderSide())

              )
          );
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 110,

              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xFFFFFF),
                borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
              ),

              child: Column(
                children: [
                  emailField,
                  SizedBox(height: 10,),
                  RaisedButton(
                      onPressed: ()  {
                        handlerBarCode(controller.text);
                        Navigator.pop(context);
                      },
                      child: Text("Scansiona")
                  )
                ]
              ),
            ),
          );

        },


    );
  }

  void changeState(int state) {
    setState(() {
      this.currentState = state;
    });
  }

  String stateToName() {
    return currentState == 1 ? "Madre" : "Figlio";
  }
  //TODO: funzione per definire immagine -rossa se non è unknown
  void handlerBarCode(String code) {
    if(currentState== 1) { // madre
      setState(() {
        _motherBarcode = code;
      });
    }else {
      setState(() {
        _childBarcode = code;
      });
    }
    checkBarcode();
    if(currentState == 1)changeState(2);

  }

  bool barcode_corresponde = false;
  bool checkBarcode() {
    if(_motherBarcode == (_childBarcode)) {
      setState(() {
        barcode_corresponde = true;
      });
    } else {
      setState(() {
        barcode_corresponde = false;
      });
    }
    return barcode_corresponde;
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Annulla", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    if(barcodeScanRes == "-1") return; //TODO:GIVE ERROR
    handlerBarCode(barcodeScanRes);
    checkBarcode();
    if(currentState == 1)changeState(2);
  }
  //TODO: Highlight when in state




}