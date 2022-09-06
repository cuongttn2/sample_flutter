import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

SideTitles bottomTitleSwitch(bottomTitlesType) {
  switch (bottomTitlesType) {
    case 'Week':
      return SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: weekBottomTitleWidgets,
      );

    case 'Month':
      return SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: monthBottomTitleWidgets,
      );

    case 'Year':
      return SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 1,
        getTitlesWidget: yearBottomTitleWidgets,
      );
    default:
      return SideTitles(
        showTitles: true,
        reservedSize: 40,
        interval: 4,
        getTitlesWidget: monthBottomTitleWidgets,
      );
  }
}

Widget weekBottomTitleWidgets(double value, TitleMeta meta) {
  TextStyle style = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Mon', style: style);
      break;
    case 2:
      text = Text('Tue', style: style);
      break;
    case 3:
      text = Text('Wed', style: style);
      break;
    case 4:
      text = Text('Thu', style: style);
      break;
    case 5:
      text = Text('Fri', style: style);
      break;
    case 6:
      text = Text('Sat', style: style);
      break;
    case 7:
      text = Text('Sun', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return Padding(padding: const EdgeInsets.only(top: 16), child: text);
}

Widget monthBottomTitleWidgets(double value, TitleMeta meta) {
  TextStyle style = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  if (value > 0 && value < 32) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          '.',
          style: style,
        ));
  } else {
    return const Text('');
  }
}

Widget yearBottomTitleWidgets(double value, TitleMeta meta) {
  TextStyle style = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Jan', style: style);
      break;
    case 2:
      text = Text('Feb', style: style);
      break;
    case 3:
      text = Text('Mar', style: style);
      break;
    case 4:
      text = Text('Apr', style: style);
      break;
    case 5:
      text = Text('May', style: style);
      break;
    case 6:
      text = Text('Jun', style: style);
      break;
    case 7:
      text = Text('Jul', style: style);
      break;
    case 8:
      text = Text('Aug', style: style);
      break;
    case 9:
      text = Text('Sep', style: style);
      break;
    case 10:
      text = Text('Oct', style: style);
      break;
    case 11:
      text = Text('Nov', style: style);
      break;
    case 12:
      text = Text('Dec', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return Padding(padding: const EdgeInsets.only(top: 16), child: text);
}
