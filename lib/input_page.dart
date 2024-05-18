import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import 'ReusableCard.dart';
import 'package:my_bmi_calculater/IconContent.dart';

const bottomContainerHeight = 80.0;
const activeCardcolour = Color(0xFF1D1E33);
const inactiveCardcolour = Color(0xFF111328);
const bottomContainercolour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardcolour;
  Color femaleCardColour = inactiveCardcolour;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardcolour) {
        maleCardColour = activeCardcolour;
        femaleCardColour = inactiveCardcolour;
      } else {
        maleCardColour = inactiveCardcolour;
      }
    } else {
      if (femaleCardColour == inactiveCardcolour) {
        femaleCardColour = activeCardcolour;
        maleCardColour=inactiveCardcolour;
      } else {
        femaleCardColour = inactiveCardcolour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(
                      activeCardcolour,
                      IconContent(FontAwesomeIcons.mars, 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                      activeCardcolour,
                      IconContent(FontAwesomeIcons.venus, 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            activeCardcolour,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(activeCardcolour)),
                Expanded(child: ReusableCard(activeCardcolour))
              ],
            ),
          ),
          Container(
            color: bottomContainercolour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
