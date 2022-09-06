import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sample/Legend.dart';

import 'bottome_title.dart';


class DistanceLineChart extends StatelessWidget {
  const DistanceLineChart({
    Key? key,
    required this.yValues,
    required this.sportName,
    required this.meanDistance,
    required this.bottomTitlesType,
    required this.maxY,
  }) : super(key: key);
  final List<double> yValues;
  final String sportName;
  final double meanDistance;
  final String bottomTitlesType;
  final double maxY;

  @override
  Widget build(BuildContext context) {
    var list = List<int>.generate(yValues.length, (i) => i + 1);
    final lineBarsData = [
      LineChartBarData(
        // showingIndicators: yValues.asMap().entries.map((entry) {
        //     return entry.key;
        //   }).toList(),
        show: true,
        isStepLineChart: false,
        spots: yValues.asMap().entries.map((e) {
          return FlSpot(
              (e.key + 1).toDouble(), double.parse(e.value.toStringAsFixed(2)));
        }).toList(),
        isCurved: false,
        // curveSmoothness:0.1,
        barWidth: 2,
        belowBarData: BarAreaData(
          show: false,
          spotsLine: BarAreaSpotsLine(
            show: false,
          ),
        ),
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) {
            if (spot.y != 0) {
              return FlDotCirclePainter(
                radius: 5,
                color: Colors.purple.withOpacity(0.1),
                strokeWidth: 3,
                strokeColor: Colors.black,
              );
            } else {
              return FlDotCirclePainter(
                radius: 5,
                color: Colors.purple.withOpacity(0),
                strokeWidth: 3,
                strokeColor: Colors.white.withOpacity(0),
              );
            }
          },
        ),
      ),
    ];
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LegendsListWidget(
              legends: [
                Legend("Total Distance M ",
                    Colors.green),
                Legend("average value ${meanDistance.toStringAsFixed(2)} M",
                   Colors.blue.withOpacity(0.5)),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: LineChart(
                  LineChartData(
                    maxY: maxY,
                    showingTooltipIndicators: list.map((index) {
                      return ShowingTooltipIndicators([
                        LineBarSpot(
                            lineBarsData[0],
                            lineBarsData.indexOf(lineBarsData[0]),
                            lineBarsData[0].spots[index - 1]),
                      ]);
                    }).toList(),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFececec),
                        ),
                      ),
                    ),
                    lineTouchData: LineTouchData(
                      enabled: false,
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipMargin: 0,
                        getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                          return lineBarsSpot.map((lineBarSpot) {
                            return LineTooltipItem(
                              (lineBarSpot.y != 0)
                                  ? lineBarSpot.y.toString()
                                  : "",
                              const TextStyle(color: Colors.black),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    extraLinesData: ExtraLinesData(horizontalLines: [
                      HorizontalLine(
                        y: meanDistance,
                        color: Colors.blue.withOpacity(0.5),
                        strokeWidth: 3,
                        dashArray: [20, 2],
                      ),
                    ]),
                    lineBarsData: lineBarsData,
                    minY: 0,
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: bottomTitleSwitch(bottomTitlesType),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              heightFactor: 1,
              child: Text(
                  'View Trends -> Avg Distance this peorid is ${meanDistance.toStringAsFixed(2)} M',
                  style: const TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
