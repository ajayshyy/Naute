import 'package:flutter/material.dart';
import 'package:bar_code_reader/components/custom_paint.dart';
import 'package:bar_code_reader/utils.dart';

class AvatarIcon extends StatelessWidget {

  final double radius;
  final Color backgroundColor, backgroundIcon;

  final String image;
  final IconData icon;



  const AvatarIcon({Key key, this.radius, this.backgroundColor, this.backgroundIcon, this.image, this.icon}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius + 2,
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(image),
          ),
        ),
        CircleAvatar(
          radius: radius / 3,
          backgroundColor: backgroundIcon,
          child: Icon(icon, color: Colors.white, size: radius / 3,),
        )
      ],
    );
  }

}