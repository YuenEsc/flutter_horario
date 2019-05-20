import 'package:flutter/material.dart';



Map<int, Color> colorRangeGenerator(red, green, blue){
  Map <int, Color> color =
  {
  50:Color.fromRGBO(red, green, blue, .1),
  100:Color.fromRGBO(red, green, blue, .2),
  200:Color.fromRGBO(red, green, blue, .3),
  300:Color.fromRGBO(red, green, blue, .4),
  400:Color.fromRGBO(red, green, blue, .5),
  500:Color.fromRGBO(red, green, blue, .6),
  600:Color.fromRGBO(red, green, blue, .7),
  700:Color.fromRGBO(red, green, blue, .8),
  800:Color.fromRGBO(red, green, blue, .9),
  900:Color.fromRGBO(red, green, blue, 1),
  };
  return color;
}

final MaterialColor independence = MaterialColor(0xFF445066, colorRangeGenerator(68, 80, 102));
final MaterialColor maximumBlueGreen= MaterialColor(0xFF2bccb5, colorRangeGenerator(43,204,181));
final MaterialColor charcoal = MaterialColor(0xFF35435c, colorRangeGenerator(53, 67, 92));
final MaterialColor romanSilver = MaterialColor(0xFF858d9c, colorRangeGenerator(133, 141, 156));

final MaterialColor veryLightBlue = MaterialColor(0xFF7169ff, colorRangeGenerator(113, 105, 255));
final MaterialColor mandarin = MaterialColor(0xFFf97748, colorRangeGenerator(249, 119, 72));
final MaterialColor ufoGreen = MaterialColor(0xFF32d271, colorRangeGenerator(50, 210, 113));
final MaterialColor maximumYellowRed = MaterialColor(0xfff4b53e, colorRangeGenerator(244, 181, 62));
final MaterialColor ultraMarinBlue = MaterialColor(0xFF456df6, colorRangeGenerator(69,109,246));
final MaterialColor spiroDiscoBall = MaterialColor(0xff20bbf7, colorRangeGenerator(32, 187, 247));
final MaterialColor heliotrope = MaterialColor(0xffe146ff, colorRangeGenerator(225,70,255));
final MaterialColor fieryRose = MaterialColor(0xffff5a68, colorRangeGenerator(255,90,104));
final MaterialColor turquoise = MaterialColor(0xFF33d3e3, colorRangeGenerator(51, 211, 227));
final MaterialColor yankeesBlue = MaterialColor(0xff10243e, colorRangeGenerator(16,36,62));
final MaterialColor darkYankeesBlue = MaterialColor(0xff142746, colorRangeGenerator(20,39,70));
final MaterialColor gold = MaterialColor(0xffb5862d, colorRangeGenerator(181,134,45));
final MaterialColor fieldDrab = MaterialColor(0xff75571D, colorRangeGenerator(117, 87, 29));
final MaterialColor mediumOrchid = MaterialColor(0xFFBD5cff, colorRangeGenerator(189, 92, 255));
final MaterialColor navyPurple = MaterialColor(0xff8354e8, colorRangeGenerator(131, 84, 232));
final MaterialColor bittersweet = MaterialColor(0xfff77e5e, colorRangeGenerator(247,126,94));
final MaterialColor roseRed = MaterialColor(0xffcc2356, colorRangeGenerator(204, 35, 86));
final MaterialColor grainYellow = MaterialColor(0xffffd35e, colorRangeGenerator(255, 211, 94));
final MaterialColor begonia = MaterialColor(0xFFff737e, colorRangeGenerator(255,115,126));
final MaterialColor celadonGreen = MaterialColor(0xff1d8c7c, colorRangeGenerator(29, 140, 124));
final MaterialColor seaGreen = MaterialColor(0xff23914f, colorRangeGenerator(35, 145, 79));
final MaterialColor cobaltBlue = MaterialColor(0xff084fa8, colorRangeGenerator(8,79,168));



