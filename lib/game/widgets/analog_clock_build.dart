// -This file has been edited according to the source below.
//https://github.com/AkashDivya/infinity_flutter_clock

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

import '../../settings/settings.dart';

class AnalogClockBuild extends StatelessWidget {
  AnalogClockBuild({
    Key? key,
    this.hourHand,
    this.minuteHand,
  }) : super(key: key);

  final int? hourHand;
  final int? minuteHand;

  //Total distance traveled by a second or a minute hand, each second or minute,
  // respectively.
  final double radiansPerTick = radians(360 / 60);

  // Total distance traveled by an hour hand, each hour, in radians.
  final double radiansPerHour = radians(360 / 12);

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: Image(
            image: AssetImage(settingsCubit.clockImage()),
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Minute's Hand.
              _customHand(
                xOffset: 0,
                yOffset: -30,
                angleRadians: minuteHand! * radiansPerTick,
                imagePath: 'assets/images/hand_min.png',
              ),
              // Hour's Hand.
              _customHand(
                xOffset: 0,
                yOffset: -22,
                angleRadians: hourHand! * radiansPerHour +
                    (minuteHand! / 60) * radiansPerHour,
                imagePath: 'assets/images/hand_hr.png',
              ),
              // Center Pin.
              _stud(),
            ],
          ),
        ),
      ],
    );
  }

  //This widget is used as Minutes and Hours hand in the Clock.
  Widget _customHand({
    required double angleRadians,
    required String imagePath,
    required double xOffset,
    required double yOffset,
  }) {
    return SizedBox(
      child: Transform.rotate(
        angle: angleRadians,
        child: Transform.translate(
          offset: Offset(xOffset, yOffset),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(-2, 2),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(7.5),
            ),
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }

  // This widget acts as the Center Pin for the Clock.
  Widget _stud() {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(-2, 2),
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: const Image(
        image: AssetImage('assets/images/stud.png'),
      ),
    );
  }
}
